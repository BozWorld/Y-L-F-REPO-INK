# Copilot Instructions for Y-L-F-REPO-INK

These notes enable AI coding agents to be productive immediately in this repo. Keep answers concrete and aligned with how this project actually works.

## Big picture
- This is a static web Ink.js project (interactive fiction) that runs in the browser: no build tool or server required.
- The interactive story source is written in Ink (`*.ink`) and compiled/exported to a JavaScript story file consumed by Ink.js.
- The shipping demo is under `final/Aurevoir Yves Les Flot/`. There’s also top-level files used earlier in development.
- Visual identity includes a custom font (Silver.ttf), a 12-palette color system, a subtle pattern background, and optional CRT-like effects.

## Key runtime components
- `final/Aurevoir Yves Les Flot/index.html`: App entry; loads `ink.js`, the compiled story (`Aurevoir_Yves_les_flot.js`), and `main.js`. Provides UI: header (class 'bylovewithlove') and a controls bar (id 'controls') with buttons: 'rewind', 'save', 'reload', 'palette-switch'.
- `final/Aurevoir Yves Les Flot/main.js`: Ink.js bootstrap and renderer.
  - Creates `new inkjs.Story(storyContent)` from the compiled story global `storyContent`.
  - Renders paragraphs (`<p>`) and choices (`.choice a`).
  - Processes Ink tags (see below), manages scroll, save/load, theme & palette switching with `localStorage`.
- `final/Aurevoir Yves Les Flot/style.css`: Typography, palettes, background pattern, and CRT effects. Defines palette classes on `<body>` like `palette-cornsole2`.
- `final/Aurevoir Yves Les Flot/Aurevoir_Yves_les_flot.js`: Compiled story payload (auto-generated from `.ink`).

## Ink tag contract (supported by main.js)
These tags appear in the Ink text and are parsed in `continueStory()`:
- `AUDIO: url` → plays a one-shot audio (`new Audio(url).play()`).
- `AUDIOLOOP: url` → plays/loops until replaced.
- `IMAGE: url` → appends an `<img>` to the story flow.
- `LINK: url` → `window.location.href = url` (navigate).
- `LINKOPEN: url` → `window.open(url)` (new tab/window).
- `BACKGROUND: url` → sets `.outerContainer.style.backgroundImage`.
- `CLASS: className` → adds a CSS class to the current paragraph element.
- `CLEAR` or `RESTART` → clears paragraphs/images; `RESTART` also resets the story.

Example in `.ink`:
```
This line shows an image. # IMAGE: images/pic.png
Click to open the doc. # LINKOPEN: https://example.com
```

## Palette & theme system
- Button with id 'palette-switch' cycles through: `default`, `dark`, and `palette-<name>` classes.
- Palettes defined in CSS: `palette-cornsole2`, `-alt`, `peachy-keen`, `nostalgi2`, `kankei4`, `macao-12` (+ `-alt` variants). They set background, container, link colors, etc., and reuse `pattern/pattern2.png`.
- `dark` mode mirrors base styles with dark backgrounds.

## Persistence keys (localStorage)
- `save-state`: serialized Ink state for load/resume.
- `theme`: stores `"dark"` or empty.
- `palette`: stores selected palette slug (e.g., `"kankei4-alt"`).

## CRT effect notes
- CRT-like visuals are implemented in `style.css` via:
  - `body::before` scanlines + RGB mask with `animation: crt-flicker`.
  - Text glow/shadow animations on `p, h1, h2, .choice a`.
- If readability issues arise, adjust or disable by targeting those selectors first (avoid changing container z-index or `overflow` logic in `.outerContainer`).

## Developer workflow
- Editing story: change `Aurevoir_Yves_les_flot.ink` (root) then recompile/export to `final/.../Aurevoir_Yves_les_flot.js`.
  - Recommended: Use Inky to export, or CLI:
    - Windows PowerShell (paths with spaces):
      ```powershell
      & "C:\\path\\to\\inklecate.exe" -o "final\\Aurevoir Yves Les Flot\\Aurevoir_Yves_les_flot.js" "Aurevoir_Yves_les_flot.ink"
      ```
- Run locally: open `final/Aurevoir Yves Les Flot/index.html` with a static server (e.g., VS Code Live Server) for correct asset loading.
- No test suite or build; changes are visible on refresh. Keep console open to catch tag/url mistakes.

## Conventions & gotchas
- Do not rename ids 'story' and 'controls', or class 'outerContainer'; `main.js` queries them directly.
- Keep asset paths relative to `final/Aurevoir Yves Les Flot/` (e.g., `pattern/pattern2.png`, `fonts/Silver.ttf`).
- Z-order: header (class 'bylovewithlove') z=3, controls bar (id 'controls') z=4, story inside class 'container'. Avoid adding overlays with higher z-index unless intentional.
- Ink conditionals: use `{ varName == true: text }` inline or `*{cond} Choice` for gated choices/lines. See `WritingWithInk.md` for language details.

## Example: conditional snippet in this story
The project uses knowledge flags such as `knowledgeBI`, `knowledgeB`, `knowledgeD`, `knowledgeF` to gate lines:
```
*{knowledgeBI == true} ... j'avoue j'ai un peu craqué ...
*{knowledgeB == true}  ... j'aime bien peti.te jean ...
```

If you add new flags, remember to initialize/update them within the Ink script and re-export the JS story.
