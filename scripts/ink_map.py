#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Ink map helper: list all knots and stitches, and report potentially orphan addresses.

Usage (PowerShell):
  python .\scripts\ink_map.py --file "Aurevoir_Yves_les_flot.ink" --format md

Outputs a Markdown TOC and a reachability report to stdout.
"""

import argparse
import os
import re
from typing import Dict, List, Tuple, Set


KNOT_RE = re.compile(r"^\s*={2,}\s*([^=\r\n]+?)\s*(?:={2,}\s*)?$")
STITCH_RE = re.compile(r"^\s*=\s*([A-Za-z0-9_\.\-]+)\s*$")
DIVERT_RE = re.compile(r"->\s*([A-Za-z0-9_\.]+)")


def parse_ink(path: str):
    with open(path, "r", encoding="utf-8") as f:
        lines = f.read().splitlines()

    knots_order: List[Tuple[str, int]] = []
    stitches_by_knot: Dict[str, List[Tuple[str, int]]] = {}
    definitions: Set[str] = set()
    references: Set[str] = set()
    edges: Dict[str, Set[str]] = {}

    current_knot = None
    current_stitch = None
    before_first_knot = True
    root_targets: Set[str] = set()

    def add_edge(src: str, dst: str):
        if src not in edges:
            edges[src] = set()
        edges[src].add(dst)

    for idx, line in enumerate(lines, start=1):
        m_k = KNOT_RE.match(line)
        if m_k:
            name = m_k.group(1).strip()
            knots_order.append((name, idx))
            stitches_by_knot.setdefault(name, [])
            definitions.add(name)
            current_knot = name
            current_stitch = None
            before_first_knot = False
            continue

        m_s = STITCH_RE.match(line)
        if m_s:
            sname = m_s.group(1).strip()
            key = current_knot if current_knot is not None else "__root__"
            stitches_by_knot.setdefault(key, []).append((sname, idx))
            if current_knot:
                definitions.add(f"{current_knot}.{sname}")
            else:
                definitions.add(sname)
            current_stitch = sname
            continue

        # look for diverts anywhere on the line
        for m in DIVERT_RE.finditer(line):
            target = m.group(1)
            if target in ("END", "DONE"):
                continue

            # resolve local divert (no dot): stitch in current knot, else knot
            resolved = target
            if "." not in target and current_knot:
                local_stitches = {s for s, _ in stitches_by_knot.get(current_knot, [])}
                if target in local_stitches:
                    resolved = f"{current_knot}.{target}"

            # references
            references.add(resolved)

            # edges from current address to target
            if before_first_knot:
                root_targets.add(resolved)
            else:
                src = current_knot or "__root__"
                if current_stitch and current_knot:
                    src = f"{current_knot}.{current_stitch}"
                add_edge(src, resolved)

    # implicit edges: knot -> first stitch if present
    for knot, _ in knots_order:
        stitches = stitches_by_knot.get(knot, [])
        if stitches:
            first = stitches[0][0]
            add_edge(knot, f"{knot}.{first}")

    return knots_order, stitches_by_knot, definitions, references, edges, root_targets


def bfs_reachable(edges: Dict[str, Set[str]], starts: Set[str]) -> Set[str]:
    seen: Set[str] = set()
    stack: List[str] = list(starts)
    while stack:
        node = stack.pop()
        if node in seen:
            continue
        seen.add(node)
        for nxt in edges.get(node, ()):  # type: ignore
            if nxt not in seen:
                stack.append(nxt)
    return seen


def to_markdown(knots_order, stitches_by_knot) -> str:
    lines: List[str] = []
    lines.append("## Knots & stitches")
    for knot, line_no in knots_order:
        lines.append(f"- {knot} (line {line_no})")
        for sname, sline in stitches_by_knot.get(knot, []):
            lines.append(f"  - {sname} (line {sline})")
    return "\n".join(lines) + "\n"


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--file", default="Aurevoir_Yves_les_flot.ink", help="Path to .ink file")
    ap.add_argument("--format", default="md", choices=["md"], help="Output format")
    args = ap.parse_args()

    path = args.file
    if not os.path.isabs(path):
        path = os.path.abspath(path)
    if not os.path.exists(path):
        raise SystemExit(f"Ink file not found: {path}")

    knots_order, stitches_by_knot, definitions, references, edges, root_targets = parse_ink(path)

    # Start set: diverts in root, otherwise first knot
    starts: Set[str] = set(root_targets)
    if not starts and knots_order:
        starts.add(knots_order[0][0])

    # Reachability
    reachable = bfs_reachable(edges, starts)

    # Orphan definitions: defined but not reachable from starts
    # (Note: being unreferenced is not strictly an error; here we flag as FYI.)
    orphans = sorted([d for d in definitions if d not in reachable])

    # Output
    md = to_markdown(knots_order, stitches_by_knot)
    print(md)
    print("## Reachability report")
    print(f"Start nodes: {', '.join(sorted(starts)) or '(none)'}")
    print(f"Reachable: {len(reachable)} / Defined: {len(definitions)}")
    if orphans:
        print("Orphans (defined but not reached from start):")
        for o in orphans:
            print(f"- {o}")
    else:
        print("No orphans detected.")


if __name__ == "__main__":
    main()
