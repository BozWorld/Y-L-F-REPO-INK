/**
 * @file A.Y.L.F-story.ink
 * @title A Yves Les Flots Story
 * @author GitHub Copilot
 * @version 1.0
 *
 * @brief This Ink script outlines a na=== vol

{visitedIsland == 0:
    // PREMIER VOL — D=== vol

{visitedIsland == 0:
    // PREMIER VOL — DÉPART DU HANGAR
    "Le hangar s'ouvre lentement, laissant place à un ciel d'un bleu éclatant.
    C'est le moment. Le moteur vrombit doucement alors = karim_huguette

**INFORMATION RÉSIDENT** : Deux anciens soldats. Ils vivaient ici avant l'inondation mais sont partis faire la guerre contre l'ancien régime. Revenus changés... et probablement bien éméchés 😅

**INFORMATION LIEU** : Le bistrot "**La Gamberge**". Impossible de le rater : y a des chaises et des tables dehors. Va boire un coup avec eux !

**COLIS À LIVRER** : Une lettre et une caisse d'alcool. Les classiques du réconfort.

* [Lire la description de Boogie-Love] -> boogie
* [Lire la description de Pet.ite Jean] -> petite_jean
* [Lire la description du Vieux Jean] -> vieux_jean
* [Voir les contrôles] -> control
* [Décoller] -> voli prend de l'altitude.
    Les premières notes d'une vieille chanson résonnent dans la radio..."
- else:
    {visitedIsland == 2 && TURNS_SINCE(-> interlude) == 0:
        // RETOUR APRÈS L'INTERLUDE
        "De retour dans les airs. L'horizon semble plus vaste maintenant. 
        Meli se sent différente après cette conversation avec Meryl.
        Il reste encore des histoires à découvrir."
    - else:
        {visitedIsland == 3:
            // AVANT-DERNIER VOL
            "L'avion s'élève dans les airs. Le ciel commence à prendre des teintes orangées. 
            La journée avance et il ne reste plus qu'une destination à visiter.
            La dernière livraison avant de conclure cette mission."
        - else:
            // RETOUR STANDARD APRÈS UNE LIVRAISON
            "Meli redécolle. Le ciel est plus lourd cette fois-ci.
            Le vent souffle un peu plus fort, ou est-ce juste dans sa tête ?"
        }
    }
}

-> choix_destinationR
    "Le hangar s'ouvre lentement, laissant pla      * {petite_jean_visited == false} [Aller vers l'île de Pet.ite Jean] 
        ~ petite_jean_visited = true
        -> bosquet{petite_jean_visited == false} [Aller vers l'île de Pet.ite Jean] 
        ~ petite_jean_visited = true
        -> bosquet un ciel d'un bleu éclatant.
    C'est le m= boogie

**INFORMATION RÉSI= petite_jean

**INFORMATION RÉSIDENT** : Pet.ite Jean n'est pas résident·e permanent·e, mais iel vient souvent voir son grand-père (le Vieux Jean). 
"Introverti·e, bricoleur·euse, iel a du potentiel. Toujours en train de bidouiller des trucs !"

**INFORMATION LIEU** : Un îlot entouré d'arbres et de matos technique. Pet.ite Jean y a installé sa cabane. 
"Attention : avant, c'était une zone minée... mais iel est toujours vivant·e, donc ça devrait aller !"

**COLIS À LIVRER** : (À NE PAS COMMUNIQUER AU SYNDICAT) C'est moi qui le commande pour iel. Y a du matos de soudure et d'électronique. Iel est malin·igne. Laisse-iel bricoler ! Docteur Boogie-Love est un excentrique... c'est moi ! Hehehe. J'espère t'avoir surpris·e.
"Je suis fan de musique, et j'ai une histoire mystérieuse à raconter !"

**INFORMATION LIEU** : J'habite sur l'île la plus cool. Y a plein de disques et une enseigne géante en forme de disque (pas celle en forme de coquille Saint-Jacques — l'autre !).
"C'est là que je tiens mon disquaire '**CRAZY-LOVE**'. Du feu de dieu !"

**COLIS À LIVRER** : Le colis scellé par le Syndicat, c'est pour moi. Apporte-le et je satisferai ta curiosité...

-> boogie_choix

= boogie_choix moteur vrombit doucement alors que Meli prend de l'altitude.
    Les premières notes d'une vieille chanson résonnent dans la radio..."
- else:
    {visitedIsland == 2 && TURNS_SINCE(-> interlude) == 0:
        // RETOUR APRÈS L'INTERLUDE
        "De retour dans les airs. L'horizon semble plus vaste maintenant. 
        Meli se sent différente après cette conversation avec Meryl.
        Il reste encore des histoires à découvrir."
    - else:
        {visitedIsland == 3:
            // AVANT-DERNIER VOL
            "L'avion s'élève dans les airs. Le ciel commence à prendre des teintes orangées. 
            La journée avance et il ne reste plus qu'une destination à visiter.
            La dernière livraison avant de conclure cette mission."
        - else:
            // RETOUR STANDARD APRÈS UNE LIVRAISON
            "Meli redécolle. Le ciel est plus lourd cette fois-ci.
            Le vent souffle un peu plus fort, ou est-ce juste dans sa tête ?
            Elle pense aux rencontres qu'elle vient de faire."
        }
    }
}

-> choix_destinational
"C'était la dernière livraison. Il est temps de rentrer... une dernière fois."
-> final

=== final
// Structure de la fin du jeu - à compléter par le créateur
"Le soleil se couche sur Yvelines-les-Flots. Meli regarde une dernière fois l'archipel 
depuis le cockpit de son avion. Les vagues montent déjà, avalant lentement 
les derniers vestiges d'une histoire qui s'efface."

"La radio grésille..."

* [Répondre à l'appel] -> final_radio
* [Rester silencieuse] -> final_silence

= final_radio
"Ici Meryl. Mission accomplie, Meli. Tu peux rentrer maintenant."

* [Continuer] -> final_conclusion

= final_silence
Les pensées de Meli dérivent vers tous ces gens qu'elle a rencontrés...
Leurs histoires continueront de vivre, même quand l'eau aura tout recouvert.

* [Continuer] -> final_conclusion

= final_conclusion
// À compléter avec le texte de fin définitif

"Merci d'avoir joué à Yvelines-les-Flots."

-> ENDe game where the player, as a pilot named Meli, delivers packages to the last inhabitants of a flooded archipelago called "Yves les flots".
 *
 * @description The story begins with a mission briefing from Meryl, establishing the player's role as a pilot for an organization called "le syndicat". The player's task is to deliver packages to the few remaining residents on different islands.
 * The game is structured around a central hub (`vol`) from which the player can choose to visit various islands or consult a manual. Each island hosts unique characters with their own backstories, which are revealed through dialogue choices.
 *
 * The script uses a global variable `visitedIsland` to track the number of islands the player has successfully visited. This could be used to trigger different events or endings as the story progresses.
 *
 * ---
 *
 * ### Story Knots Overview:
 *
 * - **`introduction`**: The opening scene. Meli receives her mission briefing from Meryl. It sets the context of the world and the player's objective.
 *
 * - **`vol`**: The main hub of the game. From here, the player pilots the COLLAPS-40 plane and can choose which island to visit next or to read the manual. This knot acts as the central point to which the story returns after each island visit.
 *
 * - **`manuel`**: An in-game manual written by "docteur boogie love". It contains lore, character descriptions (Boogie Love, petite jean, vieux jean, Karim & Huguette), and game control instructions. It serves as a guide for the player.
 *
 * - **`bosquet`**: The knot for the island where "pet.ite jean" resides. This character is a young, tech-savvy individual trying to build machines and communicate with aliens. The dialogue explores their relationship with their grandfather and their ambitions.
 *
 * - **`bistro`**: The knot for the island with the bistro "Le Gamberge", inhabited by two syndicate veterans, Karim and Huguette. Conversations here reveal the history of the syndicate, the war against the "ancien régime", and personal stories of loss and camaraderie.
 *
 * - **`disquaire`**: The knot for the island of "docteur boogie love", a music and sound enthusiast who maintains the local radio and the COLLAPS-40 plane. This section delves into the history of the COLLAPS technology and the inventor, Eleone von kerk.
 *
 * - **`ferme`**: The knot for the island where "vieux jean" lives. He is a farmer who is deeply suspicious of the syndicate and its technology ("les ondes"). Dialogue with him uncovers his role in the past resistance and his belief in an alien cow.
 *
 * ### Global Variables:
 *
 * - **`VAR visitedIsland = 0`**: An integer that increments each time the player completes a delivery to an island. It tracks the player's progress through the main missions.
 *
 */

VAR visitedIsland = 0
VAR petite_jean_visited = false
VAR boogie_love_visited = false
VAR karim_huguette_visited = false
VAR vieux_jean_visited = false

-> introduction

=== introduction

Dans une pièce noir, une radio repose sur une caisse métallique.

*[ communiquer avec le microphone ]
      -> intro
= intro
"1, 2... 1, 2...CIEL BLEUE ET TEMPS ET TEMPËRATURE PARADISIAQUE !
NE VOUS INQUIETEZ PAS, HABITANT DE YVES LES FLOTS
VOTRE SERVITRICE EST LÀ POUR VOUS !!!!"

*[interruption] 
      -> interruption

->END

= interruption
#radio_interface

la radio grésille avant de se stabiliser sur une fréquence claire.
1, 2... ici meryl, unité d'accompagnement du COLLAPS-40...
Meli, il va falloir arreter d'utiliser la radio comme ton jouet perso.
A Yves, il reste encore des habitants opposés au projet du syndicat 
on essaye de se faire accepter - fait plus profil bas, ok ?"

"Bon... C'est ta dernière mission.
Tu dois livrer des colis aux derniers habitants.
L'avion ne pourra pas faire plusieurs allez-retour d'affilé.
On va passer à un rapide brief de la mission si tu es OK ?

* [Raconte moi tout] -> brief

= brief
"Yvelines-les-Flots est en train de se noyer depuis des années.
Les habitants sont quasiment tous partis.
Mais quelques irréductibles attendent le déluge.  
Ils ont refusé tout relogement."

"Politiquement, c’est tendu.  
On essaie de ne pas trop attirer l’attention, mais eux reçoivent encore des colis  
de proches ou d’anciens camarades."

"Tu as accès au manuel de Boogie-Love,  
avec les infos sur les îles et leurs habitants.  
Réfère-toi à ça pour les livraisons."

* [Ok, j’ai tout retenu]
    -> done

= done
"OUI OUI OUI, message reçu Meryl !

Merci pour ton aide, c’est cool que tu m’accompagnes.  
Mais t’inquiète, je vais checker le manuel, et je vais faire AUCUNE bêtise."

"COLLAPS-40 m’attend, le ciel aussi.  
Je fais chauffer la machine. Merci Meryl ! À tout à l’heure !"

* [Meryl reprend une dernière fois]
    -> intro_end

= intro_end
"...Bon voyage Meli.  
Et... oublie pas de te reposer, vraiment.  
Fin de communication."

* [Faire chauffer le moteur]
    -> vol


-> vol

=== vol

{visitedIsland == 0:
    // PREMIER VOL — DÉPART DU HANGAR
    "Le hangar s’ouvre lentement, laissant place à un ciel d’un bleu éclatant.
    C’est le moment. Le moteur vrombit doucement alors que Meli prend de l'altitude.
    Les premières notes d’une vieille chanson résonnent dans la radio..."
- else:
    // TOUS LES AUTRES VOLS
    "Meli redécolle. Le ciel est plus lourd cette fois-ci.
    Le vent souffle un peu plus fort, ou est-ce juste dans sa tête ?"
}

-> choix_destination

=== choix_destination

{visitedIsland == 2:
    -> retour_hub
- else:
    {visitedIsland == 4:
        -> retour_final
    - else:
        -> destination_normale
    }
}

=== retour_hub
"Deux livraisons accomplies. Il est temps de rentrer au hub principal pour faire le point."
-> interlude

=== retour_final
"C’était la dernière livraison. Il est temps de rentrer... une dernière fois."
-> final

=== final
// Structure de la fin du jeu - à compléter par le créateur
"Le soleil se couche sur Yvelines-les-Flots. Meli regarde une dernière fois l'archipel 
depuis le cockpit de son avion. Les vagues montent déjà, avalant lentement 
les derniers vestiges d'une histoire qui s'efface."

"La radio grésille..."

* [Répondre à l'appel] -> final_radio
* [Rester silencieuse] -> final_silence

= final_radio
"Ici Meryl. Mission accomplie, Meli. Tu peux rentrer maintenant."

* [Continuer] -> final_conclusion

= final_silence
Les pensées de Meli dérivent vers tous ces gens qu'elle a rencontrés...
Leurs histoires continueront de vivre, même quand l'eau aura tout recouvert.

* [Continuer] -> final_conclusion

= final_conclusion
// À compléter avec le texte de fin définitif

"Merci d'avoir joué à Yvelines-les-Flots."

-> END

=== destination_normale
"Vers quelle île Meli souhaite-t-elle aller ?"
    * {petite_jean_visited == false} [Aller vers l’île de Pet.ite Jean] 
        ~ petite_jean_visited = true
        ~ visitedIsland += 1
        -> bosquet

    * {boogie_love_visited == false} [Aller vers la boutique CRAZY-LOVE]
        ~ boogie_love_visited = true
        -> disquaire

    * {karim_huguette_visited == false} [Aller au bistrot de Karim et Huguette]
        ~ karim_huguette_visited = true
        -> bistro

    * {vieux_jean_visited == false} [Aller à la ferme du Vieux Jean]
        ~ vieux_jean_visited = true
        -> ferme

...
* [ouvrir manuel] 
    -> manuel

=== manuel

-> page1

= page1

Hello routeur du ciel !! Ce manuel est un manuel **spécial**, conçu par mes soins pour les besoins des habitants de l’île ! (Enfin... les 3 résidents officiels. Y a une quatrième page pour un presque-résident ? 👀)

Chaque page est dédiée à l’un·e d’entre eux, mais tu peux aussi regarder les **contrôles** du COLLAPS-40 si tu sais plus comment voler.

* [Voir les contrôles] -> control
* [Lire la description de Boogie-Love] -> boogie
* [Lire la description de Pet.ite Jean] -> petite_jean
* [Lire la description du Vieux Jean] -> vieux_jean
* [Lire la description de Karim et Huguette] -> karim_huguette
* [Décoller] -> vol

= control

Le COLLAPS-40 fonctionne grâce aux ondes radio du système-mère COLLAPS !
Il est plus léger que les anciennes versions (et, bonne nouvelle, **il ne balance pas de bombes**).

- **Accélérer** : gâchette RB
- **Ralentir** : gâchette LT

L’avion ne décolle que quand tu as assez de vitesse. Ensuite, libre à toi de planer !

Le joystick gauche sert à :
- Gauche/Droite → orientation
- Haut/Bas → monter ou piquer

Pour atterrir, pose-toi simplement sur l’eau autour d’une île. À partir d’une certaine vitesse, 40 s’aligne automatiquement à l’île.

**⚠ Attention** : la tour radio de Yvelines est rudimentaire. Après deux voyages, tu seras obligé·e de revenir au hangar.

C’est tout pour les contrôles ! Bon vol et reste funky ✈️💿

* [Lire la description de Boogie-Love] -> boogie
* [Lire la description de Pet.ite Jean] -> petite_jean
* [Lire la description du Vieux Jean] -> vieux_jean
* [Lire la description de Karim et Huguette] -> karim_huguette
* [Décoller] -> vol

= boogie

**INFORMATION RÉSIDENT** : Docteur Boogie-Love est un excentrique... c’est moi ! Hehehe. J’espère t’avoir surpris·e.
Je suis fan de musique, et j’ai une histoire mystérieuse à raconter !

**INFORMATION LIEU** : J’habite sur l’île la plus cool. Y a plein de disques et une enseigne géante en forme de disque (pas celle en forme de coquille Saint-Jacques — l’autre !).
C’est là que je tiens mon disquaire "**CRAZY-LOVE**". Du feu de dieu !

**COLIS À LIVRER** : Le colis scellé par le Syndicat, c’est pour moi. Apporte-le et je satisferai ta curiosité...

* [Lire la description de Pet.ite Jean] -> petite_jean
* [Lire la description du Vieux Jean] -> vieux_jean
* [Lire la description de Karim et Huguette] -> karim_huguette
* [Voir les contrôles] -> control
* [Décoller] -> vol

= petite_jean

**INFORMATION RÉSIDENT** : Pet.ite Jean n’est pas résident·e permanent·e, mais iel vient souvent voir son grand-père (le Vieux Jean). 
Introverti·e, bricoleur·euse, iel a du potentiel. Toujours en train de bidouiller des trucs !

**INFORMATION LIEU** : Un îlot entouré d’arbres et de matos technique. Pet.ite Jean y a installé sa cabane. Attention : avant, c’était une zone minée... mais iel est toujours vivant·e, donc ça devrait aller !

**COLIS À LIVRER** : (À NE PAS COMMUNIQUER AU SYNDICAT) C’est moi qui le commande pour iel. Y a du matos de soudure et d’électronique. Iel est malin·igne. Laisse-iel bricoler !

* [Lire la description de Boogie-Love] -> boogie
* [Lire la description du Vieux Jean] -> vieux_jean
* [Lire la description de Karim et Huguette] -> karim_huguette
* [Décoller] -> vol

= vieux_jean

**INFORMATION RÉSIDENT** : Le plus old-school du coin. Il tient une ferme, râle tout le temps, mais il est pas méchant. C’est le grand-père de Pet.ite Jean. 
Il parle à ses vaches... ouais. Faut le laisser tranquille.

**INFORMATION LIEU** : Une île classique : un champ, une ferme, du bétail, un moulin. Simple et rustique.

**COLIS À LIVRER** : Une lettre de sa fille et un peu d’engrais. Rien de bien fou, mais ça compte.

* [Lire la description de Boogie-Love] -> boogie
* [Lire la description de Pet.ite Jean] -> petite_jean
* [Lire la description de Karim et Huguette] -> karim_huguette
* [Voir les contrôles] -> control
* [Décoller] -> vol

= karim_huguette

**INFORMATION RÉSIDENT** : Deux anciens soldats. Ils vivaient ici avant l’inondation mais sont partis faire la guerre contre l’ancien régime. Revenus changés... et probablement bien éméchés 😅

**INFORMATION LIEU** : Le bistrot "**La Gamberge**". Impossible de le rater : y a des chaises et des tables dehors. Va boire un coup avec eux !

**COLIS À LIVRER** : Une lettre et une caisse d’alcool. Les classiques du réconfort.

* [Lire la description de Boogie-Love] -> boogie
* [Lire la description de Pet.ite Jean] -> petite_jean
* [Lire la description du Vieux Jean] -> vieux_jean
* [Voir les contrôles] -> control
* [Décoller] -> vol



=== bosquet
tu arrives au dessus d'une ile verdoyante, remplie d'arbre, au milieux des arbres tu peux reconnaitre un étrange tank rouge qui n'as plus l'air fonctionnel, dessus un.e enfant fixe le ciel sans rien dire, iel est entouré de pleins d'outils de construction, de modification et autre

le silence est plombat mais tu peux l'entendre brisé le silence par de ponctuel "zib...zib..zab"

*[ commencer a lui poser des question ] -> question


= question
Tu as des colis a livrer, et des mission a remplir il ne faudrai pas s'éterniser ici

*[ c'est toi pet.ite jean ?] -> soudure
*[...waouh tu parles comme un robot !?] -> robot
*[...c'est vrai qu'il y a des mines ici ? ] -> tank
*[...ton grand-père sait que t'es ici? ] ->vieux
*[tiens ton colis] -> conclusion

= soudure

...Oui c'est moi... désolé je suis un poil occupé j'essaye de communiquer avec des alien.

*[lui poser une autre question] -> question
*[comment ça alien?] -> alien

= alien
Oui alien...je suis persuadé que un alien se cache quelque part pas loin d'ici.
mon grand père ma déjà raconter qu'un jour une de ses vaches lui as parler.
je le crois pas trop...mais je crois au alien j'essaye de communiquer avec eue.

*[ tu as déjà réussit ????] -> alien2
*[ lui poser une autre question ] -> question


= alien2
Non malheureusement...pour l'instant il me rejette.
mais je travaille a devenir une machine pour réussir a communiquer avec eue.
je pense qu'il seront plus ouvert a me parler si j'étais un.e machine.

*[ ...lui poser une autre question ] -> question 

= robot

Malheureusement je ne peux pas me modifier pour devenir un robot...Ma mère s'inquieterai.
Mais en attendant de pouvoir devenir un robot j'en apprend plus sur les machines.

*[ un robot genre...comme les COLLAPS? ] -> robot_2
*[ lui posez une autre question ] -> question

= robot_2

oui...J'aimerai tellement construire une machine comme COLLAPS 30/40...mais quelque chose de vivant
une machine intelligente capable de fonctionner seule. elle volerai sur toute l'archipel.
Je suis sur que avec une telle machine j'arriverai a convaincre grand père que le système radio est géniale...
j'aimerai beaucoup crée le COLLAPS-50 ...appart si il est déjà sortit quand je rejoins le syndicat

*[lui posez d'autre question] -> question


= tank
Non c'est les anciens habitant qui étais parano... Y'a eue une guerre ici y'a longtemps...enfaite j'en sais rien
mais j'aime bien ce tank, c'est une construction du syndicat quand il fabriquait des armes. Ils ont finit par arreter.
mais il n'y pas de mine ici, ni de monde d'ailleurs c'est pour ça que je viens ici.

*[ mais ta bidouiller ce tank ?!] -> tank_2
*[lui posez d'autre question] -> question

= tank_2
NON....si...tu pourrais évider de le dire au syndicat ? j'aimerai que papy est pas de représaille a cause de moi.
Mais j'ai rien fait de mal avec ! y'a une fois, ça faillit exploser, mais on s'entend bien lui et moi maintenant.
Je l'ai réamménager, modifier pour que ce soit comme uen cabane...un peu spéciale.
je préfère les cabanes un peu spéciale a vrai dire.

*[ lui poser d'autre question] -> question

= vieux
Oui...plus ou moin ? Grand père aime pas trop s'expliquer alors il me demande pas d'explication.
ce bosquet avant il étais directement relié a l'ile de grand père...en tout cas c'est ce qu'il ma expliquer.
et grand père sait que je bidouille des trucs

* [ il s'inquiète pas ?] -> peur

= peur 

Non grand père sais que je ne risque rien...et il me fait confiance. Grand père est la seule personne qui me fait confiance
c'est pour ça que je reviens ici...A yves les flots je suis tranquille. Sur l'archipel, ils veulent tout controller.
ils ont jamais confiance en moi. il comprenne pas pourquoi je veux devenir un android. Alors je viens ici grand père ne dis rien, et je dis rien. puis on se regrde.
des fois on dis des choses, des fois non. et c'est très bien comme ça

*[ ton papy accepte que tu deviennes un robot?] -> robot_end

=robot_end
Oui papy l'accepte. Il a peur du syndicat et des radio, il est persuadé que le système finira par se tourner contre nous.
Mais quand je lui ai dit que je voulais rejoindre le syndicat, crée une machine autonome qui ne pourra pas etre controler par le syndicat. Il étais rassurez.
Alors maintenant j'essaye de devenir un android, pour ensuite savoir comment faire un android.

*[ ...lui posez d'autre question] -> question

-> bosquet

=conclusion
Il est temps de repartir pour ailleurs, tu tend le colis a pet.ite jean, qui te regarde en essayant d'esquisser un sourir.
tu t'appretes a partir avant d'entendre
"merci d'etre passé madame du syndicat...Meme si mon grand père a peur du syndicat, je vous promet pour vous remercier de ne pas me dénoncer, qu'un jour je créerai un COLLAPS qui vous permettra de vous repoesez"

Pas sur que cet histoire ne fasse que du bien, mais le gamin est très anthousiasmé c'est contagieux
~ visitedIsland += 1

*[ retourner dans l'avions ]-> vol


=== bistro

-> bistro_question

=bistro_question
tu finis par atterir sur un ilot, ou il est disposé quelque tables, et des chaisses proteger par une terasse.
proche d'un batiment qui prend la forme d'un bistro, tu reconnais une enseigne : LE GAMBERGE

sur une table une femme et un homme discute une bouteille face a eue, tu remarques des élèments du syndicat dans leurs dos.

*[ une bouteille a cet heure?] -> bouteille
*[...pourquoi un bistro ici ? ] -> vide
*[...je peux boirre avec vous?] -> straightEdge
*[vous bossez pour le syndicat ?] -> syndicat
*[leurs rendre leurs colis] -> conclusion
= bouteille

" oh tu sais quand tu n'as plus grand chose a faire, et une bonne amie avec toi la boisson deviens rapdiement une option entendable.
Ici il se passe rien faut bien s'occuper ! alors des fois on organise des apéro avec le reste." répond karim.
" Oh la gamine nous juge pas trop juste parce que ta enfilé le costume ! nous aussi on est passé par la on prenais pas les gens de haut alors reste a ta place la gamine !"

*[ la traiter de vielle folle ] -> folle
*[ leurs posez d'autre question ] -> bistro_question

= folle

Karim rigole a gorge déployé, huguette après avoir esquisé un petit sourir de décontenance se met a secouer son amis Karim.
" HE ! déjà que on manque de respect, ta pas interet a se mettre de son coté ! foutu pilote incapable de tenir un engin !"
il se met a rigoler de plus belle

*[ vous etes des anciens membre du syndicat ?] -> folle_2
*[ leurs posez d'autre question ] -> bistro_question

= folle_2

il se retourne vers vous avec un regard de fierté , huguette prend la parole

"et ouai gamine figure toi que on est des anciens soldat du syndicat et ouai ! on est partit quand on étais jeune.
on a aidé a repoussé l'armée de l'ancien regime ! Soit en sur qu'il ne viendront plus jamais nous prendre la tete!
Maintenant on se la coule douce on se repose et on pense au bon vieux temps quand on se battais contre des fachiste"

un sourire remplie de nostalgie se dessine sur leurs visage.

*[ leurs posez d'autre question ] -> bistro_question

= vide

Karim et huguette esquisse un sourire, mais ils ont l'air moin a l'aise.

a vrai dire ce n'est pas notre bistro, on la récupéré. il appartenais a vieux résident d'ici. On venais souvent ici quand on étais jeune avant de servir pour le syndicat. 
le détenteur du bistro détestais que on vienne jouer proche de sa terrace avant que ce soit inondé

*[ le propriétaire est partit ?] -> leproprio
*[ leurs posez d'autre question ] -> bistro_question

= leproprio

Non le propriètaire ne serait jamais partit d'ici, pas excatement. il tenais trop a son bistro. a vrai dire il tenais beaucoup au gens du coin. il surjoué le gronchon mais il tenais beaucoup ça.

Il nous la dis lui-meme quand on la croiser dans notre escadron avec Karim. Nous sommes parti avec lui en guerre contre les soldat de l'ancien ordre. C'étais quelque chose d'important pour lui cet lutte.

*[ j'imagine qu'il est mort au combat. ] -> mort 
*[ leurs posez d'autre question ] -> bistro_question


= mort

Oui il est mort comme beaucoup de nos camarades. On a décidé de reprendre son bistro, l'ile coulé déjà. mais c'étais trop dur de partir ailleurs tout de suite. Meme sans habitant ça nous tenais a coeur de revenir au gamberge.
Et au final on est jamais reparti haha. on Se la coule douce ici tant que l'eau nous as pas subermergé.

*[ leurs posez d'autre question ] -> bistro_question

= straightEdge

les deux se mettent a faire un petit sourir espiègle et t'invite a t'assoir a coté d'eue, Huguette met un verre devant la chaise vide.
tu commences a boire :
"tu sais cet alcool est un alcool fait par un de nos amis Simon levail ! il étais dans notre escadron avant la guerre. après la guerre il a survécue, et c'est installé sur l'archipel. depuis il fait de l'alcool qui est distribué dans toute l'archipel.
meme si on a pas participé c'est devenue notre petite fierté 

*[reprendre un verre] -> straightEdge2
*[ leurs posez d'autre question ] -> bistro_question

= straightEdge2

Après quelque verre vous etes tous bien pompete, tu commence a te dire que l'alcool risque de coppromettre ta capacité a revoler, meli repense a Meryl qui lui as dit de faire attention.

Huguette approche son visage et se met directement a te parler
"mais toi gamine comment tu t'es retrouver a bosser pour le syndicat ? et pas de discours patriote ou je sais pas quoi, qu'est ce qui ta vraiment amener ici."

*[ leurs dire la vérité ] -> verite
*[ leurs posez d'autre question ] -> bistro_question

= verite

Meli marque un temps d'arret, elle hésite. ça n'arrive pas souvent qu'elle est envie de parler de soi, mais choisit de quand meme le faire , huguette a l'air sympa.

" J'ai vécue une rupture amoureuse difficile y'a quelque temps. et c'est très probablement ma faute. Je regrette beaucoup, mais j'aimerai passé a autre chose dans ma vie. Sur l'archipel ce n'est pas bien vu de rien faire. Devenir pilote pour le syndicat m'allez ça me forcez a sortir de chez moi et renouer du contact sociale"

huguette te regarde avec tendresse, karim écoute en silence, huguette s'approche, son odeur t'entoure, elle a l'air de vouloir te caliner. tu n'es pas usé au contact physique, mais tu sens que tu en as besoin

*[ accepter le calin ?] -> calin
*[ leurs posez d'autre question ] -> bistro_question


=calin

" j'ai connu ça il y a quelque année hahaha, ce n'est pas simple comme expérience. prend ton temps gamine. Cet douleur ne disparaitra pas avec le labeur. tu pourrais visiter les plus belles iles de l'archipel, lunette d'aviatrice viser sur les yeux, une mission noble dans ta tete, mais tout ça cache ta peine. Prend le temps de te soigner, de cicatriser gamine."

Meli ne peut empecher un songlot de tomber, elle pleure en calinant huguette, ces mains sont comme accrocher huguette. Après un long silence, tu quittes les bras de huguette
"ne t'inquiete pas pour l'alcool si tu veux partir, les effets se sont normalement déjà dissipé. Cet alcool est pensée pour ne pas durer, pour les membre du syndicat qui as besoin de vite retourner au travail.

*[ leurs posez d'autre question ] -> bistro_question
-> bistro

= syndicat

les 2 se mettent a rire en entendant ta question. Karim finit par reprendre la parole.

"Plus excatement. on a servit pour le syndicat, avant que cet ile ne soit que des morceau d'ile hahaha. On a été des soldat contre l'ancien régime, comme beaucoup de jeune de notre époque, nous somme partit avec pas grand chose autre que la volonté d'en finir avec l'ancien régime. Mais on est toujours la, toujours en vie malgré tout."

*[ l'ancien régime étais comment ? ] -> regime
*[ leurs posez d'autre question ] -> bistro_question

=regime

"misérable. il n'y aurais pas de mots suffisant pour décrire le malheur qui sème dans leurs sillon. Au final il étais des élites déconnecté des gens comme nous, des bourgeois. l'archipel a été dirigé par ce régime depuis tellement longtemps que personne ne sais vraiment depuis quand ils étaient la.

Il exploitait la vie des habitants, faisait tout pour s'assurer que personne ne veuille se rebeller, ou ne se rendent meme compte que ils se faisait exploiter. ils n'ont jamais été autre chose que un poison pour les habitants de yves. mais le syndicat a permit de changer la donne, ils nous ont aidé a s'organiser."

* [ commnt le syndicat a fait] -> hero
*[ leurs posez d'autre question ] -> bistro_question

= hero 

Le syndicat c'est fondé il y a plusieurs année de ça, l'influence du régime avais déjà drastiquement baisé. Mais les iles ne communiquais pas entre elle tout passé par le regime. Ils ont inventé le système COLLAPS un système radio qui permet de communiquer d'ile en ile. 

*[Qui sont les fondateur] -> fondateur
*[ leurs posez d'autre question ] -> bistro_question

= fondateur

(huguette marque un temps d'arret) 

Il n'y a pas vraiment eue de fondateur. Ou en tout cas iel ont été gommé par le syndicat...Tout est partit de l'initiative d'une petite classe d'ingénieur issu de Carlia une petite ile complétement abandonné par le régime.
iels crérent un  technologie révolutionnaire qui nous permir de directement communiquer d'ile en ile. Puis très vites les habitants des différentes iles se sont emparé de l'outils se sont organisé. et le syndicat fut.

*[ c'est une belle histoire ] -> belle_histoire
*[ leurs posez d'autre question ] -> bistro_question

= belle_histoire

(karim et huguette esquise un sourir karim reprend la parole ) 

Et comme tout les belles histoire elle contient son lot de contradiction. Beaucoup on essayé de tirer leurs épingle du pied. leurs part du gateau, le syndicat c'est fait dans le fer et dans le sang de tout ceux qui ont creut une vision commune.
Il reste de la contradiction dans le syndicat. Yves les flot a payé le prix de cet guerre, et le gamberge et notre présence ici en est le symbole.

(il rigole tout les deux de bon coeur ) 

*[ leurs posez d'autre question ] -> bistro_question

=conclusion

(tu leurs rend leurs colis) ( après avoir complétement déssoulé tu leurs rend leurs colis)

(karim et huguette leve leurs verre en te voyant partir) (huguette te fais un calin une dernière fois auqu'elle s'ajoute karim) 
huguette prend la parole
"Aurevoir Gamine fait bon vol, et n'hésite pas a revenir !! tu es la bienvenue ici et prend soin de toi" 
~ visitedIsland += 1
-> vol

=== disquaire

-> disquaire_question

= disquaire_question
(tu finis par atterir sur un ilot, ou se trouve un batiment avec une énorme enseigne en forme de disque écrit "CRAZY LOVE PLACE")
(il se trouve pleins de carton devant la boutique, depuis l'intérieur du batiment on peut entendre une musique se jouer très fort, un homme, avec une étrange coupe et une étrange dégaine, sort de la boutique avec un grand sourir)
"BIENVENUE SUR L'UNIQUE ILE DU DOCTEUR BOOGIE LOVE"

*[vous n'avez pas vraiment l'air d'un docteur] -> docteur
*[...ça c'est de l'introduction] -> intro
*[Vous avez pas peur de vous bousilliez les oreilles?] -> peur
*[vous en avez des carton] -> carton
*[lui donnez son colis] -> conclusion

=docteur

"NON PAS EXCATEMENT ! a vrai dire je suis un fan de musique exentrique hahaha. Je décortique le sons et les ondes pour découvrir ce qu'elle cache, comment les soigner, les faire evoluer, les entretenir.
JE SUIS UN DOCTEUR DU SON, DE L'ONDE"

*[ OHH mais c'est de vous le manuel!!] -> revelation
*[ lui posez une autre question ] -> disquaire_question

=revelation

"hahaha et oui ! je le met meme régulièrement a jour, pour prendre les commandes pirate de pet.ite Jean. J'entretiens aussi la tour du coins, la pirate passez le son le plus cool de la région.
le seul aussi"

*[ça me parait peut légal ce que vous faites] -> cops
*[ lui posez une autre question ] -> disquaire_question

=cops

"QUI POURRAIS M'ARRETER ? JE SUIS TOUT PUISSANT EN CES TERRES. L'ile a été abandonné par le syndicat quand l'innodation a commencé, il ne pensais pas que 3 habitant lutterai autant pour rester ici.
Ils ont mit une mission de bénévolat périodique pour nous livrer des colis. Mais les lois ne s'applique plus vraiment ici, ils n'ont pas d'interet a s'occuper d'une vielle radio usé, et tu n'as que faire de rapporter  un vieux exentrique et un.e pet.ite un peu étrange.

*[ c'est pas faux, mais pourquoi vous faites ça] -> passion
*[ lui posez une autre question ] -> disquaire_question


=passion

(il esquisse un sourir et se raproche de toi et prend une pose exentrique )

Tout bonnement parce que j'aime ce son plus que je n'aime autre chose. J'ai perdu quelque chose de cher dans ma vie mais j'ai toujours le son et les ondes. Je voulais un onde ou je pourrais les travailler tranquillement, et aider les dernier habitant de yves les flot me plaisait.
le.a gam.ine a du potentiel.

*[ lui posez une autre question ] -> disquaire_question

=intro
(il se met a danser sur le rythme de la musique avant de la couper brutalement ) 

désolé aviatrice ! j'étais encore entrain d'essayer de nouvelles ondes. Mais j'apprécie ton bon gout. ça faisait longtemps que on avais pas vu un vrai membre du syndicat venir ! la dernière fois que on a reçu du colis c'étais en passant déposer pet.ite jean chez son grand père.

Mais bon ça ma laissez le temps de bien préparer le COLLAPS-40.

*[vous entretenez COLLAPS-40 !!!?] -> docteur_robot

=docteur_robot

Et oui c'est moi chère aviatrice ! Je suis celui qui entretiens COLLAPS-40, bien que je ne sois pas son inventeur j'ai beaucoup cotoyé son inventrice, j'entretiens aujourd'hui la radio et l'avion. ( il rigole un coup ) c'est ce qui ma fait tomber amoureux du son et des ondes, depuis je ne les as jamais quittés. Cet radio est mon meilleurs amis ici.

*[ Merci pour le travail il est flambant neuf !!] -> neuf

=neuf

( il esquisse un sourir mélancolique ) 

Merci ça me touche. ça me tiens a coeur il a été construit par quelqu'un de proche ( il marque un temps d'arret, il brise le personnage ), elle y tenais plus que tout, et on a travaillé ensemble pour le construire, elle étais l'ingénieur principale de la construction de cet machine. Elle croyais plus que tout que ce projet permettrait un meilleurs avenir a l'archipel.
Elle s'imaginais un monde ou les ondes serait partout, et que quiconque pourrez transmettre ce qu'il veut graçe a l'aide des radio, rencontrer des gens d'ailleurs. ( il rigole ) pet.ite jean a toutes les chances de réaliser son reve !

*[...j'imagine qu'elle n'est plus la?] -> mort
*[ lui posez une autre question ] -> disquaire_question

=mort 
oui elle est morte d'une grave maladie, et avec nos moyen de l'époque nous avions pas de quoi la sauver. Le colis que tu viens me délivrer son ses notes de carnet sur COLLAPS-30.
Je les aie lu quand je bossais avec elle. Elle se nommais Elisabeth Van-kerk, ces notes sont restez longtemps caché en attendant qu'une meilleur version ( la tienne ) soit séréaliser par peur d'espionnage de l'ancien régime. 
Bref ton destrier et sa plus belle preuvent de son empreinte sur le monde.

*[ lui posez une autre question ] -> disquaire_question
=peur

( il rigole a pleine gorge avant de prendre une pause dramatique ) 

Oh tu sais j'ai perdu bien plus dans ma recherche. C'est un risque que je prend avec plaisir si mes oreilles finissent usé je l'accepterai.
le silence me terrorise, il m'horripile, et dans un coin comme celui la du silence il y en a partout, le bruit, le son est la seule chose qui me garde compagnie aujourd'hui.

*[dis comme ça c'est un peu triste] -> tristesse
*[ lui posez une autre question ] -> disquaire_question

= tristesse

( il rigole de plus belle)

Bien sur qu'il y a un peu de tristesse dans ça ! on est sur une petite ile qui a été inondé par l'eau après avoir été ravagé par la guerre. Les bombardements, les tirs, les cris, les pleurs formais periodiquement une triste melodie, puis revenais le silence plombant. 
Avant le syndicat trouvent un arrengement avec le gouvernement, la terreur régnais sur l'archipel, ce qui as aussi donné lieu a de violent conflit.

*[ l'ancien régime ? ] -> regime
*[ lui posez une autre question ] -> disquaire_question

= regime

Gallia étais une archipel dirigé par un gouvernement autoritaire, qui as finit par progressivement quitté les lieux suite a un violent conflit contre le syndicat, qui ont aboutit qu'il organise les iles et les gère, mais accompagné d'un gouvernement de transition en attendant que le syndicat trouve mieux.
L'ancien régime appliquait toute sorte de loi autoritaire, afin de garder la population bien docile. toute contestation populaire étais fortement réprimé ( il rigole ) aucun des habitants de cet ile ne pourrais vivre une vie aussi tranquille si il était encore la.
Aujourd'hui je profite du faite que le syndicat soit laxiste pour faire ce que je n'aurais jamais pu faire avant. Jouer et vivre avec les son et les ondes.

*[ lui posez une autre question ] -> disquaire_question

=carton
( Boogie love esquisse un sourir de fierté ) 

Tout ces cartons, sont principalement mes vynil. Mais il y a aussi beaucoup de babiole, tu sais le magasin n'est pas bien grand et il y a pas grand endroit ou stocker tout ça hahaha.
J'ai eue l'occasion de beaucoup voyager autour de l'archipel avec les  ingénieurs du syndicat. Je trouvais ça important de profiter de cet chance pour garder un souvenir, du maximum de gens que je rencontre et des bizarrerie que je retrouver.
Le colis que tu viens m'amener est justement un colis très important pour moi hahaha.

*[...Je peux savoir ce qu'il contient?] -> verite 

= verite

J'accepte de te dire la nature excat de ce colis en échange d'un souvenir venant de toi.
Quelque hose qui fait sens pour toi et que tu me disent pourquoi en échange je te dis la vérité sur ce colis que j'attendent

*[ lui donner un souvenir] -> souvenir
*[ lui posez une autre question ] -> disquaire_question

=souvenir 

( après une courte hésitation, Meli sort avec confiance un CD de l'avions )

...Ajouter ça a votre collection musicale. c'est une compilation de musique que j'aime beaucoup que j'avais faite il y a longtemps pour...une amis mais je n'en ai plus besoin aujourd'hui...l'avoir toujours avec moi je crois ça me fait un peu souffrir.
Alors je préfère que ce soit vous qui l'avez. J'espère que ça vous plaira.

*[ ecouter son histoire ] -> histoire
*[ lui posez une autre question ] -> disquaire_question

=histoire

(boogie love accepte le cadeau ,et s'éclaircis la voix, et prend un ton melancolique)

C'est le carnet de ma femme. Eleone von kerk, l'inventrice du COLLAPS protocole. Celui qui a permit de donner plus d'indépendance au syndicat, un protocole simple permettant la communication entre les iles.
Elle est morte pendant une violente répréssion de la part du gouvernement de transition. Bref une longue histoire mais surtout la femme de ma vie. Ce carnet sont ses ils avaient été conservé par le syndicat pour secret d'état, elle me les avaient légué.
elle ne m'avais jamais offert de souvenir , elle voulais que si elle parte la première je récupère ce journal.

*[ lui posez une autre question ] -> disquaire_question

=conclusion

( vous lui rendez son colis ) 

Meli c'est ton nom c'est ça ?
reviens me voir si jamais tu ne sais pas quoi faire de ta vie. Je te montrerai comment utiliser les radio, je suis persuadé que ça pourrais te plaire.

( vous le remercier et retourner dans votre avion )
~ visitedIsland += 1
*[ retourner dans l'avions ]-> vol

=== ferme
-> ferme_question

=ferme_question
( vous arrivez sur une ile, avec un moulin, une petite ferme, et un enclos de vache, un vielle homme se tiens assied sur une chaise devant la ferme, il vous fixe avec méfiance ) 

Oh vous devez un de chiens de garde du Syndicat ! je vous fait pas confiance, restez bien a votre place et vous avez pas interet a toucher a mes vaches ! Oui maon pt.iote !

*[ lui dire qu'il a une belle ferme ] -> belle_ferme
*[ lui demandez de quoi il se méfie ] -> mefiance
*[ lui demandez ou est pet.ite jean] -> jean
*[ lui demandez comment vont ses vaches ] -> vache
*[tiens ton colis] -> conclusion

= belle_ferme

Ta pas tord de le dire ! Elle a résistez a beaucoup de chose ma petite ferme ! elle a résistez meme quand la monté des eaux a commencé a arrivé, les différent habitant étais persuadé que j'étais un illuminé de restez ils disaient que je me laisserai submergé. Ma ferme as meme servit a protégé des vayant soldat de la résistance !
Ils se sont fait avoir par les ondes que vous diffusez partout qui provoque la montée des eaux !

*[ la résistance ? ] -> resistance 
*[ lui posez une autre question ] -> ferme_question
= resistance
( il crache sur le sol et te regarde avec les sourcils froncé 

Alors on vous apprend rien de l'histoire de notre ile au syndicat ! il y a quelque année de ça quand le gouvernement de transition nous mennais la vie trop dur, une petite bande de résistant se sont former et menez la lutte depuis ici pour se débarasser de l'autorité du gouvernement de transition. ça a permit l'indépendance de l'archipel

*[ pourquoi vous avez aidez le syndicat ? ] -> ennemis
*[ lui posez une autre question ] -> ferme_question

=ennemis

Je deteste le syndicat, je suis persuadé qu'il cache des choses avec les ondes ! mais l'ancien régime as fait bien plus de mal a la population de yves les flots. La résistance étais composé majoritairement de petit venu des iles alentour ! je pouvais pas collaborer avec ces pourris du gouvernement

*[ lui posez une autre question ] -> ferme_question

=mefiance 

De quoi je me méfie ? des ondes ! des tour ! de toute ces machines qui nous parasites le cerveau ! et puis tout les jeunes s'enrole dans le syndicat en pensant faire quelque chose de grand, mais je sais que eue ils sont pret a collaborer avec les anciens pouvoir, ILS NE SONT PAS DE CONFIANCE.

*[ lui promettre de ne jamais négocié avec qui que ce soit ] -> negociation
*[ lui posez une autre question ] -> ferme_question

=negociation

( il esquise un leger sourire )

merci Gamine. Meli c'est ça ton nom ? fait gaffe au syndicat ! je suis sur que tu es une de ses jeunes avec pleins de reve patriotique dans la tete, qui reve d'une grande archipel interconnecté ! Avec pleins d'onde partout qui nous surveille en permanence secrétement !

*[ lui dire que vous n'etes qu'un coeur brisé ] -> amour
*[ lui posez une autre question ] -> ferme_question

=amour

( il a l'air toujours de se méfier )

Les jeunes d'aujourd'hui s'enrole pour un tout et un rien ! Tu me rappelles la mère de pet.ite jean, elle étais tellement charmé par les discours du sénile boogie-love qu'elle as décidé d'allez a la capitale travaillez pour ses traitres du syndicat ! 
Aujourd'hui elle travaille pour l'ennemis ! mais j'éduque le.a Pet.ite Jean a ne pas se faire avoir par ce genre de discours ! 

*[ lui posez une autre question ] -> ferme_question

= jean

( il réfléchis 5 seconde ) 

Surement dans le bosquet pas loin. En général il aime bien restez dans son coin, jouer avec ces engins ces trucs. Le.a pet.ite est malin.igne très débrouillard. Iel est très renfermé, et n'aime pas beaucoup parler alors je le.a laisse tranquille.
Et en vérité je suis un peu comme lui je le.a comprend bien, on a signé un contrat alors je sais pas trop ou iel est.

*[ un contrat ? ] ->contrat
*[ lui posez une autre question ] -> ferme_question

= contrat 

je le laisse faire ce qu'il veut tant qu'il est ici, et je l'aide a avoir ce qu'il a besoin en terme de colis. et lui il vient me voir et un jour il trouvera une solution pour que yves les flot redevienne une ile comme elle l'étais par le passé. 
Meme si je n'ai pas confiance en la radio et toute ces choses j'ai confiance en le.a pet.ite, quoi qu'il fasse ça sera pour le bien de tous j'en suis convaincu 

*[ lui posez une autre question ] -> ferme_question

= vache

Vous ne me croirez jamais...mais il y a une de mes vaches qui est un alien. Je l'ai vu un soir orageux une de mes vaches étais entrain de parler avec un talkie-walkie, avant que j'ai le temps de réaliser, je suis tomber dans les pommes. A mon reveil plus aucune vache ne ce comportait de manière étrange.

*[une vache qui parle ? ça a l'air cool ] -> cool 
*[ lui posez une autre question ] -> ferme_question

= cool

Je suis convaincu que cet vache communicais avec des aliens. des etre venue d'ailleurs qui essaye d'apprendre le plus sur les habitant de yves les flots. Pet.ite Jean est aussi sur que moi d'avoir vu ces aliens. Mais il est persuadé qu'elle s'envolais dans une soucoupe volante.

Je sais que personne ne me crois mais je vous jure qu'un jour je prouverai l'existence de ces vaches !
*[ lui posez une autre question ] -> ferme_question

=conclusion
( vous lui donnez le colis, il vous remercie en abaisant son chapeau, alors que vous partez il vous fait un signe de main. vous remarquez que une des vaches vous regarde étrangement, mais vous avez juste le temps de clignez les yeux que elle a arreté...)

Merci gamine pour les engrais, repasse manger je te ferai quelque chose qui n'as pas été contamnié par les ondes un vrai repas ! 

( vous le remerciez et vous vous en allez )

*[ retourner dans l'avions ] -> vol

=== interlude
// Interlude - se déclenche après avoir visité deux îles
"De retour au hangar principal, Meli prend un moment pour souffler. 
La radio grésille doucement."

* [Répondre à la radio] -> interlude_radio
* [L'ignorer et continuer sa mission] -> vol

= interlude_radio
"Ici Meryl. Comment ça se passe, Meli ? Les habitants ne sont pas trop difficiles ?"

* ["Tout va bien, c'est... intéressant."] -> interlude_fin
* ["J'ai encore du mal à comprendre ce qui se passe ici."] -> interlude_fin

= interlude_fin
"Fais attention à toi. Ces gens ont leurs histoires, leurs blessures... 
Rappelle-toi qu'on est juste là pour livrer des colis, pas pour s'immiscer dans leurs affaires."

"Bon, je te laisse reprendre ta mission. Fin de communication."

* [Retourner à l'avion] -> vol

