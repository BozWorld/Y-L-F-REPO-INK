VAR visitedIsland = 0
VAR interlude_finished = false
VAR petite_jean_visited = false
VAR boogie_love_visited = false
VAR karim_huguette_visited = false
VAR vieux_jean_visited = false
// Variables globales à définir en début de script général
VAR knowledgeMB = false
VAR knowledgeMBI = false
VAR knowledgeMD = false
VAR knowledgeMF = false
VAR knowledgeB = false
VAR knowledgeBI = false
VAR knowledgeD = false
VAR knowledgeF = false
-> introduction

=== introduction ===

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

* [Ok, j’ai tout retenu] -> done

= done
"OUI OUI OUI, message reçu Meryl !

Merci pour ton aide, c’est cool que tu m’accompagnes.  
Mais t’inquiète, je vais checker le manuel, et je vais faire AUCUNE bêtise."

"COLLAPS-40 m’attend, le ciel aussi.  
Je fais chauffer la machine. Merci Meryl ! À tout à l’heure !"

* [Meryl reprend une dernière fois] -> intro_end

= intro_end
"...Bon voyage Meli.  
Et... oublie pas de te reposer, vraiment.  
Fin de communication."

* [Faire chauffer le moteur]
    -> vol


-> vol

=== vol ===

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

=== choix_destination ===
{visitedIsland == 2 and interlude_finished == false:
    -> retour_hub
- else:
    {visitedIsland == 4:
        -> retour_final
    - else:
        -> destination_normale
    }
}

=== retour_hub ===
"Deux livraisons accomplies. Il est temps de rentrer au hub principal pour faire le point."
-> interlude

=== retour_final ===
"C’était la dernière livraison. Il est temps de rentrer... une dernière fois."
-> final

=== final ===
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

=== destination_normale ===
"Vers quelle île Meli souhaite-t-elle aller ?"
    * {petite_jean_visited == false} [Aller vers l'île de Pet.ite Jean] 
        ~ petite_jean_visited = true
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

=== manuel ===

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

- Accélérer : gâchette RB
- Ralentir : gâchette LT

L’avion ne décolle que quand tu as assez de vitesse. Ensuite, libre à toi de planer !

Le joystick gauche sert à :
- Gauche/Droite → orientation
- Haut/Bas → monter ou piquer

Pour atterrir, pose-toi simplement sur l’eau autour d’une île. À partir d’une certaine vitesse, 40 s’aligne automatiquement à l’île.

Attention la tour radio de Yvelines est rudimentaire. Après deux voyages, tu seras obligé·e de revenir au hangar.

C’est tout pour les contrôles ! Bon vol et reste funky ✈️💿

* [Lire la description de Boogie-Love] -> boogie
* [Lire la description de Pet.ite Jean] -> petite_jean
* [Lire la description du Vieux Jean] -> vieux_jean
* [Lire la description de Karim et Huguette] -> karim_huguette
* [Décoller] -> vol

= boogie
~ knowledgeMF = true

INFORMATION RÉSIDENT : Docteur Boogie-Love est un excentrique... c’est moi ! Hehehe. J’espère t’avoir surpris·e.
Je suis fan de musique, et j’ai une histoire mystérieuse à raconter !

INFORMATION LIEU : J’habite sur l’île la plus cool. Y a plein de disques et une enseigne géante en forme de disque (pas celle en forme de coquille Saint-Jacques — l’autre !).
C’est là que je tiens mon disquaire "**CRAZY-LOVE**". Du feu de dieu !

COLIS À LIVRER : Le colis scellé par le Syndicat, c’est pour moi. Apporte-le et je satisferai ta curiosité...

* [Lire la description de Pet.ite Jean] -> petite_jean
* [Lire la description du Vieux Jean] -> vieux_jean
* [Lire la description de Karim et Huguette] -> karim_huguette
* [Voir les contrôles] -> control
* [Décoller] -> vol

= petite_jean
~ knowledgeMB = true

INFORMATION RÉSIDENT : Pet.ite Jean n’est pas résident·e permanent·e, mais iel vient souvent voir son grand-père (le Vieux Jean). 
Introverti·e, bricoleur·euse, iel a du potentiel. Toujours en train de bidouiller des trucs !

INFORMATION LIEU : Un îlot entouré d’arbres et de matos technique. Pet.ite Jean y a installé sa cabane. Attention : avant, c’était une zone minée... mais iel est toujours vivant·e, donc ça devrait aller !

COLIS À LIVRER : (À NE PAS COMMUNIQUER AU SYNDICAT) C’est moi qui le commande pour iel. Y a du matos de soudure et d’électronique. Iel est malin·igne. Laisse-iel bricoler !

* [Lire la description de Boogie-Love] -> boogie
* [Lire la description du Vieux Jean] -> vieux_jean
* [Lire la description de Karim et Huguette] -> karim_huguette
* [Décoller] -> vol

= vieux_jean

~ knowledgeMF = true

INFORMATION RÉSIDENT : Le plus old-school du coin. Il tient une ferme, râle tout le temps, mais il est pas méchant. C’est le grand-père de Pet.ite Jean. 
Il parle à ses vaches... ouais. Faut le laisser tranquille.

INFORMATION LIEU : Une île classique : un champ, une ferme, du bétail, un moulin. Simple et rustique.

COLIS À LIVRER : Une lettre de sa fille et un peu d’engrais. Rien de bien fou, mais ça compte.

* [Lire la description de Boogie-Love] -> boogie
* [Lire la description de Pet.ite Jean] -> petite_jean
* [Lire la description de Karim et Huguette] -> karim_huguette
* [Voir les contrôles] -> control
* [Décoller] -> vol

= karim_huguette

~ knowledgeMD = true

INFORMATION RÉSIDENT : Deux anciens soldats. Ils vivaient ici avant l’inondation mais sont partis faire la guerre contre l’ancien régime. Revenus changés... et probablement bien éméchés 😅

INFORMATION LIEU : Le bistrot "**La Gamberge**". Impossible de le rater : y a des chaises et des tables dehors. Va boire un coup avec eux !

COLIS À LIVRER : Une lettre et une caisse d’alcool. Les classiques du réconfort.

* [Lire la description de Boogie-Love] -> boogie
* [Lire la description de Pet.ite Jean] -> petite_jean
* [Lire la description du Vieux Jean] -> vieux_jean
* [Voir les contrôles] -> control
* [Décoller] -> vol

=== bosquet ===
Tu arrives au-dessus d’une île verdoyante, remplie d’arbres.  
Au milieu, tu repères un étrange tank rouge, hors d’usage.  
Dessus, un·e enfant fixe le ciel en silence, entouré·e d’outils de construction, de bricolage et autres bidouilles.

Le silence est lourd… mais tu l’entends brisé par de petits “zib… zib… zab…” répétés.

*[Commencer à lui poser des questions] -> question


= question
Tu as des colis à livrer et des missions à remplir.  
Pas sûr qu’il faille trop traîner ici…

// Rencontre initiale : formulation différente selon qu'on connaît déjà Pet.ite Jean ou pas
{knowledgeMB == false:
    *[...je sais pas trop ou je suis enfaite ?] -> soudure
- else:
    *[Salut ...Pet.ite Jean ?] -> soudure
}

// Question sur les mines → dispo seulement si knowledgeMB est vrai
{knowledgeMB:
    *[… c’est vrai qu’il y a des mines ici ?] -> tank
}

// Question sur le grand-père → dispo seulement si knowledgeB est vrai
{knowledgeB:
    *[… ton grand-père sait que t’es ici ?] -> vieux
}

*[… waouh, tu parles comme un robot !?] -> robot
*[Tiens, ton colis.] -> conclusion


= soudure

{knowledgeMB == false:
    ...Vous etes sur une ile de yveline les flots, elle a pas trop de non c'est le bosquet, elle étais autrefois rattaché a la ferme pas loin, celle de mon grand père le vieux jean maintenant elle est isolé on ne peut venir ici que en barque....ou avec le glorieux COLLAPS
    -else:
    … Oui, c’est moi.  
    Désolé·e, je suis un peu occupé·e… j’essaie de communiquer avec des aliens.

}

*[Lui poser une autre question] -> question
*[Comment ça, “aliens” ?] -> alien


= alien
Oui, des aliens… Je suis persuadé·e qu’il y en a un pas loin d’ici.  
Mon grand-père m’a déjà raconté qu’un jour, une de ses vaches lui avait parlé.  
Je le crois pas trop… mais les aliens, si. Alors j’essaie de leur parler.

*[Tu as déjà réussi ?] -> alien2
*[Lui poser une autre question] -> question


= alien2
Non… pour l’instant, ils me rejettent.  
Mais je travaille à devenir une machine pour mieux leur parler.  
Je me dis qu’ils seraient plus ouverts si j’étais moi-même une machine.

*[Lui poser une autre question] -> question


= robot
Malheureusement, je peux pas me transformer en robot… Ma mère s’inquiéterait trop.  
En attendant, j’apprends tout ce que je peux sur les machines.

*[Un robot genre… comme les COLLAPS ?] -> robot_2
*[Lui poser une autre question] -> question


= robot_2
Oui… J’aimerais tellement construire une machine comme COLLAPS-30 ou 40…  
Mais vivante.  
Une machine intelligente, capable de voler seule à travers l’archipel.  
Avec ça, je pourrais convaincre grand-père que le système radio est génial…  
J’aimerais créer le COLLAPS-50.  
Sauf si, quand je rejoins le Syndicat, il existe déjà.

*[Lui poser d’autres questions] -> question


= tank
Non, les mines, c’était les anciens habitants paranoïaques…  
Il y a longtemps, il y a eu une guerre ici.  
Enfin… j’en sais rien.  
Mais j’aime bien ce tank. C’est une vieille construction du Syndicat, à l’époque où ils fabriquaient des armes.  
Ils ont fini par arrêter.  
Maintenant, y’a ni mines, ni vraiment de monde… C’est pour ça que je viens ici.

*[Mais t’as bidouillé ce tank ?!] -> tank_2
*[Lui poser une autre question] -> question


= tank_2
NON… enfin, si.  
Mais tu pourrais éviter de le dire au Syndicat ?  
Je veux pas que papy ait des ennuis à cause de moi.  
J’ai rien fait de dangereux ! Bon… une fois, il a failli exploser, mais maintenant on s’entend bien, lui et moi.  
Je l’ai réaménagé, modifié… C’est comme une cabane, mais spéciale.  
Et moi, j’aime bien les cabanes spéciales.

*[Lui poser une autre question] -> question


= vieux
Oui… plus ou moins.  
Grand-père aime pas trop s’expliquer, alors il me demande pas d’explications.  
Ce bosquet, avant, était relié directement à son île… c’est ce qu’il m’a dit.  
Et il sait que je bidouille des trucs.

*[Il s’inquiète pas ?] -> peur


= peur
Non. Grand-père sait que je risque rien.  
Et il me fait confiance.  
C’est la seule personne qui me fait confiance.  
C’est pour ça que je reviens toujours ici.  
À Yvelines-les-Flots, je suis tranquille.  
Sur l’archipel, ils veulent tout contrôler.  
Ils comprennent pas pourquoi je veux devenir un androïde.  
Alors je viens ici, grand-père dit rien, je dis rien.  
Des fois on parle, des fois pas. Et c’est très bien comme ça.

*[Ton papy accepte que tu deviennes un robot ?] -> robot_end


= robot_end
Oui, papy l’accepte.  
Il a peur du Syndicat et de la radio, il est persuadé que le système finira par se retourner contre nous.  
Mais quand je lui ai dit que je voulais rejoindre le Syndicat pour créer une machine autonome, impossible à contrôler par eux, il a été rassuré.  
Alors maintenant, j’essaie de devenir un androïde… pour savoir ensuite comment en construire un.

*[Lui poser une autre question] -> question

-> bosquet


= conclusion
~ visitedIsland += 1
Il est temps de repartir.  
Tu tends le colis à Pet.ite Jean, qui tente d’esquisser un sourire.  
Tu t’apprêtes à décoller quand tu l’entends dire :  
« Merci d’être passée, madame du Syndicat…  
Même si mon grand-père a peur de vous, je te promets — pour te remercier de ne pas me dénoncer — qu’un jour, je créerai un COLLAPS qui te permettra de te reposer. »

Pas sûr que cette promesse te fasse que du bien…  
Mais le gamin est tellement enthousiaste que c’en est contagieux.
~ knowledgeB = true
*[Retourner dans l’avion] -> vol




=== bistro ===

tu finis par atterir sur un ilot, ou il est disposé quelque tables, et des chaisses proteger par une terasse.
proche d'un batiment qui prend la forme d'un bistro, tu reconnais une enseigne : LE GAMBERGE

sur une table une femme et un homme discute une bouteille face a eue, tu remarques des élèments du syndicat dans leurs dos.

*[Commencer à lui poser des questions] -> bistro_question

= bistro_question
Tu as des colis à livrer et des missions à remplir.  
Pas sûr qu’il faille trop traîner ici…

*[ une bouteille a cet heure?] -> bouteille
* {knowledgeMBI == false} [...c'est une sorte de bistro ici ?] -> bistro_vide
* {knowledgeMBI == true} [...pourquoi un bistro ici ? ] -> bistro_vide
*[...je peux boirre avec vous?] -> straightEdge
* {knowledgeMBI == true} [vous bossez pour le syndicat ?] -> syndicat
*[leurs rendre leurs colis] -> conclusion_bistro

= bouteille
« Oh, tu sais, quand t'as plus grand-chose à faire et une bonne amie avec toi, la boisson devient vite une option acceptable. Ici, y'a rien à faire — faut bien s'occuper, alors parfois on organise des apéros. » répond Karim.

Huguette renchérit, un peu piquée : « Oh, la gamine, nous juge pas parce que t'as enfilé le costume ! Nous aussi on est passés par là — on regardait pas les gens de haut. »

*[La traiter de vieille folle] -> folle
*[Leur poser d'autres questions] -> bistro_question


= folle
Karim éclate de rire. Huguette, après un petit sourire gêné, secoue son ami.

« Hé ! Déjà qu'on manque de respect, t'as pas intérêt à te mettre de son côté ! Foutu pilote incapable de tenir un engin ! » dit-elle en le bousculant.

Karim se remet à rire aux éclats.

*[Vous êtes d'anciens membres du Syndicat ?] -> folle_2
*[Leur poser d'autres questions] -> bistro_question


= folle_2
Il se retourne vers toi, tout fier. Huguette prend la parole.

« Et ouais, gamine — figure-toi qu'on est d'anciens soldats du Syndicat, ouais ! On est partis quand on était jeunes. On a aidé à repousser l'armée de l'ancien régime. Sois sûr·e qu'ils ne viendront plus nous embêter ! Maintenant on se la coule douce, on se repose et on repense aux bons vieux temps, quand on se battait contre les fascistes. »

Un sourire nostalgique se dessine sur leurs visages.

*[Leur poser d'autres questions] -> bistro_question


= bistro_vide
{knowledgeMB == false:
    ... les deux habitant esquissent un grand sourire après vous avoir regardé de haut en bas. la femme parmit les deux prend la parole et dis
    " ça n'as pas bien révisé son brief a ce que je vois hahaha c'est notre bistro...enfin ça l'est devenue on la récupéré."
    -else:
        Karim et Huguette esquissent un sourire, mais paraissent un peu moins à l'aise.

        « À vrai dire, ce n'était pas notre bistro à l'origine — on l'a récupéré. Il appartenait à un ancien résident d'ici. On venait souvent quand on était jeunes, avant de servir pour le Syndicat. Le propriétaire détestait qu'on joue près de sa terrasse avant que tout soit inondé. »
}

*[Le propriétaire est parti ?] -> proprio
*[Leur poser d'autres questions] -> bistro_question


= proprio
« Non, le propriétaire ne serait jamais parti d'ici, pas vraiment. Il tenait trop à son bistro. À vrai dire, il tenait beaucoup aux gens du coin. Il faisait le grognon, mais il y tenait. »

Il nous l'a dit lui-même quand on l'a croisé avec Karim, continue Huguette. « On est partis avec lui à la guerre contre les soldats de l'ancien ordre. Cette lutte, c'était important pour lui. »

*[J'imagine qu'il est mort au combat.] -> mort
*[Leur poser d'autres questions] -> bistro_question


= mort
« Oui, il est mort, comme beaucoup de nos camarades. On a décidé de reprendre son bistro — l'île coulait déjà — mais c'était trop dur de partir. Même sans habitants, ça nous tenait à cœur de revenir au Gamberge. Au final, on est jamais repartis, haha. On se la coule douce ici tant que l'eau ne nous a pas submergés. »

*[Leur poser d'autres questions] -> bistro_question


= straightEdge
Les deux esquissent un petit sourire espiègle et t'invitent à t'asseoir à côté d'eux. Huguette pose un verre devant la chaise vide. Tu commences à boire.

« Tu sais, cet alcool est fabriqué par un de nos amis, Simon Levail. Il était dans notre escadron avant la guerre. Après, il a survécu et s'est installé ici ; depuis, il distille pour tout l'archipel. Même si on n'a pas participé, c'est devenu notre petite fierté. »

*[Reprendre un verre] -> straightEdge2
*[Leur poser d'autres questions] -> bistro_question


= straightEdge2
Après quelques verres, vous êtes tous un peu pompette. Tu commences à te dire que l'alcool pourrait compromettre ta capacité à revoler — Meli repense à Meryl qui lui avait dit de faire attention.

Huguette se penche vers toi et te demande directement :  
« Mais toi, gamine, comment t'es retrouvée à bosser pour le Syndicat ? Pas de discours patriote — qu'est-ce qui t'a vraiment amenée ici ? »

*[Leur dire la vérité] -> verite
*[Leur poser d'autres questions] -> bistro_question


= verite
Meli marque un temps d'arrêt. Elle hésite : elle n'a pas souvent envie de parler d'elle, mais Huguette a l'air gentille.

« J'ai vécu une rupture amoureuse difficile il y a quelque temps. C'est probablement de ma faute. Je regrette beaucoup, mais j'aimerais passer à autre chose. Sur l'archipel, c'est mal vu de ne rien faire. Devenir pilote pour le Syndicat, ça m'a forcée à sortir de chez moi et à renouer du lien social. »

Huguette te regarde avec tendresse, Karim écoute en silence. Huguette s'approche ; son odeur t'entoure et elle semble vouloir te câliner. Tu n'es pas habituée au contact physique, mais tu sens que tu en as besoin.

*[Accepter le câlin ?] -> calin
*[Leur poser d'autres questions] -> bistro_question


= calin
« J'ai connu ça il y a quelques années, hahaha — c'est pas simple. Prends ton temps, gamine. Cette douleur ne disparaîtra pas avec le boulot. Tu peux visiter les plus belles îles de l'archipel, lunettes d'aviateur sur le nez, une mission qui te semble noble… mais tout ça peut cacher ta peine. Prends le temps de te soigner, de cicatriser. »

Meli ne peut empêcher un sanglot de s'échapper ; elle pleure en serrant Huguette. Après un long silence, tu quittes ses bras.

« T'inquiète pas pour l'alcool si tu veux partir : les effets sont normalement déjà dissipés. Cet alcool est pensé pour ne pas durer — pour les membres du Syndicat qui doivent vite retourner au travail. »

*[Leur poser d'autres questions] -> bistro_question


= syndicat
« Non, on bosse plus pour eux », répond Karim. « On a fait partie du Syndicat autrefois, mais plus maintenant. On est des anciens. »

*[Leur poser d'autres questions] -> bistro_question
*[Leur rendre leur colis] -> conclusion_bistro


= conclusion_bistro
~ visitedIsland +=1 
~ knowledgeBI = true
Tu leur rends le colis. Huguette le prend, te sourit.

« Merci, gamine. Fais attention en vol, et repose-toi quand tu peux. »

-> vol
=== disquaire ===
(Tu finis par atterrir sur un îlot où se trouve un bâtiment avec une énorme enseigne en forme de disque où il est écrit "CRAZY LOVE PLACE")
(Il y a plein de cartons devant la boutique. Depuis l'intérieur du bâtiment, on peut entendre une musique très forte. Un homme avec une étrange coupe et une dégaine particulière sort de la boutique avec un grand sourire)
"BIENVENUE SUR L'UNIQUE ÎLE DU DOCTEUR BOOGIE LOVE!"

-> disquaire_question

= disquaire_question
Tu as des colis à livrer et des missions à remplir.  
Pas sûr qu'il faille trop traîner ici…

* {knowledgeMD == false} [...ça c'est de l'introduction] -> intro
* {knowledgeMD == true} [...ça serait pas vous, le manuel ?] -> intro
* [Vous n'avez pas vraiment l'air d'un docteur] -> docteur
* [Vous n'avez pas peur de vous bousiller les oreilles?] -> peur
* [Vous en avez des cartons] -> carton
* [Lui donner son colis] -> conclusion_disquaire

= docteur

"NON, PAS EXACTEMENT ! À vrai dire, je suis un fan de musique excentrique, hahaha. Je décortique les sons et les ondes pour découvrir ce qu'ils cachent, comment les soigner, les faire évoluer, les entretenir.
JE SUIS UN DOCTEUR DU SON, DE L'ONDE !"

* [OH mais c'est vous le manuel !] -> revelation
* [Lui poser une autre question] -> disquaire_question

= revelation

"Hahaha, et oui ! Je le mets même régulièrement à jour, pour prendre les commandes pirates de Pet.ite Jean. J'entretiens aussi la tour du coin. La pirate passe le son le plus cool de la région.
Le seul aussi !"

* [Ça me paraît peu légal ce que vous faites] -> cops
* [Lui poser une autre question] -> disquaire_question

= cops

"QUI POURRAIT M'ARRÊTER ? JE SUIS TOUT-PUISSANT EN CES TERRES ! L'île a été abandonnée par le Syndicat quand l'inondation a commencé. Ils ne pensaient pas que trois habitants lutteraient autant pour rester ici.
Ils ont mis en place une mission de bénévolat périodique pour nous livrer des colis. Mais les lois ne s'appliquent plus vraiment ici. Ils n'ont pas d'intérêt à s'occuper d'une vieille radio usée, et tu n'as que faire de rapporter un vieux excentrique et un·e petit·e un peu étrange."

* [C'est pas faux, mais pourquoi vous faites ça ?] -> passion
* [Lui poser une autre question] -> disquaire_question


= passion

(Il esquisse un sourire et se rapproche de toi en prenant une pose excentrique)

"Tout bonnement parce que j'aime ce son plus que je n'aime autre chose. J'ai perdu quelque chose de cher dans ma vie, mais j'ai toujours le son et les ondes. Je voulais un endroit où je pourrais les travailler tranquillement, et aider les derniers habitants de Yves-les-Flots me plaisait.
Le·a gamin·e a du potentiel."

* [Lui poser une autre question] -> disquaire_question

= intro

{knowledgeMD == false:
    "Yes, YES, YES ! C'est moi, docteur CRAZY-LOVE ! Je suis un peu pris actuellement, j'essaie encore de nouvelles ondes, mais j'apprécie que tu aies pris le temps de lire un peu mon manuel, YO ! Ça fait un bail qu'on n'a pas vu quelqu'un de ton genre par ici. Faut dire qu'il reste pas grand monde de branché dans le coin !
    Mais bon, ça m'a laissé le temps de bien préparer le COLLAPS-40."
- else:
    (Il se met à danser sur le rythme de la musique avant de la couper brutalement)

    "Désolé, aviatrice ! J'étais encore en train d'essayer de nouvelles ondes. Mais j'apprécie ton bon goût. Ça faisait longtemps qu'on n'avait pas vu un vrai membre du Syndicat venir ! La dernière fois qu'on a reçu du courrier, c'était en passant déposer Pet.ite Jean chez son grand-père.

    Mais bon, ça m'a laissé le temps de bien préparer le COLLAPS-40."
}


* [Vous entretenez COLLAPS-40 ?!] -> docteur_robot
* [Lui poser une autre question] -> disquaire_question

= docteur_robot

"Et oui, c'est moi, chère aviatrice ! Je suis celui qui entretient COLLAPS-40. Bien que je ne sois pas son inventeur, j'ai beaucoup côtoyé son inventrice. J'entretiens aujourd'hui la radio et l'avion." (Il rigole un coup) "C'est ce qui m'a fait tomber amoureux du son et des ondes. Depuis, je ne les ai jamais quittés. Cette radio est ma meilleure amie ici."

* [Merci pour le travail, il est flambant neuf !] -> neuf
* [Lui poser une autre question] -> disquaire_question

= neuf

(Il esquisse un sourire mélancolique) 

"Merci, ça me touche. Ça me tient à cœur, il a été construit par quelqu'un de proche." (Il marque un temps d'arrêt, brisant le personnage.) "Elle y tenait plus que tout, et on a travaillé ensemble pour le construire. Elle était l'ingénieure principale de la construction de cette machine. Elle croyait plus que tout que ce projet permettrait un meilleur avenir à l'archipel.
Elle s'imaginait un monde où les ondes seraient partout, et où quiconque pourrait transmettre ce qu'il veut grâce à l'aide des radios, rencontrer des gens d'ailleurs." (Il rigole) "Pet.ite Jean a toutes les chances de réaliser son rêve !"

* [...J'imagine qu'elle n'est plus là ?] -> mort
* [Lui poser une autre question] -> disquaire_question

= mort 
"Oui, elle est morte d'une grave maladie, et avec nos moyens de l'époque, nous n'avions pas de quoi la sauver. Le colis que tu viens me délivrer contient ses notes de carnet sur COLLAPS-30.
Je les ai lues quand je bossais avec elle. Elle se nommait Elisabeth Van-Kerk. Ces notes sont restées longtemps cachées en attendant qu'une meilleure version (la tienne) soit réalisée, par peur d'espionnage de l'ancien régime. 
Bref, ton destrier est sa plus belle preuve de son empreinte sur le monde."

* [Lui poser une autre question] -> disquaire_question

= peur

(Il rigole à pleine gorge avant de prendre une pause dramatique) 

"Oh, tu sais, j'ai perdu bien plus dans ma recherche. C'est un risque que je prends avec plaisir. Si mes oreilles finissent usées, je l'accepterai.
Le silence me terrorise, il m'horripile, et dans un coin comme celui-là, du silence, il y en a partout. Le bruit, le son est la seule chose qui me garde compagnie aujourd'hui."

* [Dit comme ça, c'est un peu triste] -> tristesse
* [Lui poser une autre question] -> disquaire_question

= tristesse

(Il rigole de plus belle)

"Bien sûr qu'il y a un peu de tristesse dans ça ! On est sur une petite île qui a été inondée par l'eau après avoir été ravagée par la guerre. Les bombardements, les tirs, les cris, les pleurs formaient périodiquement une triste mélodie, puis revenait le silence plombant. 
Avant que le Syndicat trouve un arrangement avec le gouvernement, la terreur régnait sur l'archipel, ce qui a aussi donné lieu à de violents conflits."

* [L'ancien régime ?] -> regime
* [Lui poser une autre question] -> disquaire_question

= regime

"Gallia était un archipel dirigé par un gouvernement autoritaire, qui a fini par progressivement quitter les lieux suite à un violent conflit contre le Syndicat. Cela a abouti à ce qu'il organise les îles et les gère, mais accompagné d'un gouvernement de transition en attendant que le Syndicat trouve mieux.
L'ancien régime appliquait toutes sortes de lois autoritaires afin de garder la population bien docile. Toute contestation populaire était fortement réprimée." (Il rigole) "Aucun des habitants de cette île ne pourrait vivre une vie aussi tranquille s'il était encore là.
Aujourd'hui, je profite du fait que le Syndicat soit laxiste pour faire ce que je n'aurais jamais pu faire avant : jouer et vivre avec les sons et les ondes."

* [Lui poser une autre question] -> disquaire_question

= carton
(Boogie Love esquisse un sourire de fierté) 

"Tous ces cartons sont principalement mes vinyles. Mais il y a aussi beaucoup de babioles. Tu sais, le magasin n'est pas bien grand et il n'y a pas grand endroit où stocker tout ça, hahaha.
J'ai eu l'occasion de beaucoup voyager autour de l'archipel avec les ingénieurs du Syndicat. Je trouvais ça important de profiter de cette chance pour garder un souvenir du maximum de gens que je rencontrais et des bizarreries que je trouvais.
Le colis que tu viens m'apporter est justement un colis très important pour moi, hahaha."

* [...Je peux savoir ce qu'il contient ?] -> verite 
* [Lui poser une autre question] -> disquaire_question

= verite

"J'accepte de te dire la nature exacte de ce colis en échange d'un souvenir venant de toi.
Quelque chose qui a du sens pour toi et que tu me dises pourquoi. En échange, je te dis la vérité sur ce colis que j'attends."

* [Lui donner un souvenir] -> souvenir
* [Lui poser une autre question] -> disquaire_question

= souvenir 

(Après une courte hésitation, Meli sort avec confiance un CD de l'avion)

"...Ajoutez ça à votre collection musicale. C'est une compilation de musiques que j'aime beaucoup que j'avais faite il y a longtemps pour... une amie, mais je n'en ai plus besoin aujourd'hui... L'avoir toujours avec moi, je crois que ça me fait un peu souffrir.
Alors je préfère que ce soit vous qui l'ayez. J'espère que ça vous plaira."

* [Écouter son histoire] -> histoire
* [Lui poser une autre question] -> disquaire_question

= histoire

(Boogie Love accepte le cadeau, s'éclaircit la voix et prend un ton mélancolique)

"C'est le carnet de ma femme, Eleone von Kerk, l'inventrice du protocole COLLAPS. Celui qui a permis de donner plus d'indépendance au Syndicat, un protocole simple permettant la communication entre les îles.
Elle est morte pendant une violente répression de la part du gouvernement de transition. Bref, une longue histoire, mais surtout la femme de ma vie. Ce carnet contient ses notes. Ils avaient été conservés par le Syndicat comme secret d'État, elle me les avait légués.
Elle ne m'avait jamais offert de souvenir. Elle voulait que si elle partait la première, je récupère ce journal."

* [Lui poser une autre question] -> disquaire_question

= conclusion_disquaire
~ visitedIsland +=1 
~ knowledgeD = true
(Tu lui remets son colis) 

"Meli, c'est ton nom, c'est ça ?
Reviens me voir si jamais tu ne sais pas quoi faire de ta vie. Je te montrerai comment utiliser les radios. Je suis persuadé que ça pourrait te plaire."

(Tu le remercies et retournes à ton avion)
* [Retourner dans l'avion] -> vol

=== ferme ===

(Tu arrives sur une île, avec un moulin, une petite ferme, et un enclos de vaches. Un vieil homme est assis sur une chaise devant la ferme, il te fixe avec méfiance)

Oh, vous devez être un des chiens de garde du Syndicat ! Je vous fais pas confiance, restez bien à votre place et vous avez pas intérêt à toucher à mes vaches ! Oui m'sieur, ma p'tiote !

-> ferme_question

= ferme_question
Tu as des colis à livrer et des missions à remplir.  
Pas sûr qu'il faille trop traîner ici…

*[Lui dire qu'il a une belle ferme] -> belle_ferme
*[Lui demander de quoi il se méfie] -> mefiance
*{knowledgeB == false and knowledgeMB == true} [Lui demander où est Pet.ite Jean] -> jean
*{knowledgeMF == false} [Lui demander comment vont ses vaches] -> vache
*{knowledgeMF == true} [Lui demander s'il y a des aliens parmi ses vaches] -> vache
*[Tiens ton colis] -> conclusion_ferme

= belle_ferme

T'as pas tort de le dire ! Elle a résisté à beaucoup de choses ma petite ferme ! Elle a résisté même quand la montée des eaux a commencé à arriver. Les différents habitants étaient persuadés que j'étais un illuminé de rester, ils disaient que je me laisserais submerger. Ma ferme a même servi à protéger des vaillants soldats de la résistance !
Ils se sont fait avoir par les ondes que vous diffusez partout qui provoquent la montée des eaux !

*[La résistance ?] -> resistance 
*[Lui poser une autre question] -> ferme_question

= resistance
(Il crache sur le sol et te regarde avec les sourcils froncés)

Alors on vous apprend rien de l'histoire de notre île au syndicat ! Il y a quelques années de ça, quand le gouvernement de transition nous menait la vie trop dure, une petite bande de résistants s'est formée et menait la lutte depuis ici pour se débarrasser de l'autorité du gouvernement de transition. Ça a permis l'indépendance de l'archipel.

*[Pourquoi vous avez aidé le syndicat ?] -> ennemis
*[Lui poser une autre question] -> ferme_question

=ennemis

Je déteste le syndicat, je suis persuadé qu'il cache des choses avec les ondes ! Mais l'ancien régime a fait bien plus de mal à la population de Yves-les-Flots. La résistance était composée majoritairement de petites gens venus des îles alentour ! Je pouvais pas collaborer avec ces pourris du gouvernement.

*[Lui poser une autre question] -> ferme_question

= mefiance 

De quoi je me méfie ? Des ondes ! Des tours ! De toutes ces machines qui nous parasitent le cerveau ! Et puis tous les jeunes s'enrôlent dans le syndicat en pensant faire quelque chose de grand, mais je sais qu'eux, ils sont prêts à collaborer avec les anciens pouvoirs. ILS NE SONT PAS DE CONFIANCE !

*[Lui promettre de ne jamais négocier avec qui que ce soit] -> negociation
*[Lui poser une autre question] -> ferme_question

= negociation

(Il esquisse un léger sourire)

Merci, gamine. Meli, c'est ça ton nom ? Fais gaffe au syndicat ! Je suis sûr que tu es une de ces jeunes avec plein de rêves patriotiques dans la tête, qui rêve d'un grand archipel interconnecté ! Avec plein d'ondes partout qui nous surveillent en permanence secrètement !

*[Lui dire que vous n'êtes qu'un cœur brisé] -> amour
*[Lui poser une autre question] -> ferme_question

=amour

(Il a l'air toujours de se méfier)

Les jeunes d'aujourd'hui s'enrôlent pour un tout et un rien ! Tu me rappelles la mère de Pet.ite Jean, elle était tellement charmée par les discours du sénile Boogie-Love qu'elle a décidé d'aller à la capitale travailler pour ces traîtres du syndicat ! 
Aujourd'hui elle travaille pour l'ennemi ! Mais j'éduque le.a Pet.ite Jean à ne pas se faire avoir par ce genre de discours ! 

*[Lui poser une autre question] -> ferme_question

= jean

(Il réfléchit 5 secondes) 

Sûrement dans le bosquet pas loin. En général iel aime bien rester dans son coin, jouer avec ses engins, ces trucs. Le.a pet.ite est malin.e, très débrouillard.e. Iel est très renfermé.e, et n'aime pas beaucoup parler alors je le.a laisse tranquille.
Et en vérité je suis un peu comme lui, je le.a comprends bien, on a signé un contrat alors je sais pas trop où iel est.

*[Un contrat ?] -> contrat
*[Lui poser une autre question] -> ferme_question

= contrat 

Je le laisse faire ce qu'iel veut tant qu'iel est ici, et je l'aide à avoir ce dont iel a besoin en terme de colis. Et iel vient me voir et un jour iel trouvera une solution pour que Yves-les-Flots redevienne une île comme elle l'était par le passé. 
Même si je n'ai pas confiance en la radio et toutes ces choses, j'ai confiance en le.a pet.ite. Quoi qu'iel fasse, ça sera pour le bien de tous, j'en suis convaincu.

*[Lui poser une autre question] -> ferme_question

= vache

{knowledgeMF == false :
    Vous ne me croirez jamais... mais il y a une de mes vaches qui est un alien. Je l'ai vue, un soir orageux, une de mes vaches était en train de parler avec un talkie-walkie. Avant que j'aie le temps de réaliser, je suis tombé dans les pommes. À mon réveil, plus aucune vache ne se comportait de manière étrange.
- else:
    J'ai toujours su que je finirais par rencontrer quelqu'un qui me croit ! Une de mes vaches est un alien ! Je l'ai vue, un soir orageux, une de mes vaches était en train de parler avec un talkie-walkie. Avant que j'aie le temps de réaliser, je suis tombé dans les pommes. À mon réveil, plus aucune vache ne se comportait de manière étrange.
}
*[Une vache qui parle ? Ça a l'air cool] -> cool 
*[Lui poser une autre question] -> ferme_question

= cool

Je suis convaincu que cette vache communiquait avec des aliens. Des êtres venus d'ailleurs qui essayent d'apprendre le plus possible sur les habitants de Yves-les-Flots. Pet.ite Jean est aussi sûr.e que moi d'avoir vu ces aliens. Mais iel est persuadé.e qu'elle s'envolait dans une soucoupe volante.

Je sais que personne ne me croit, mais je vous jure qu'un jour je prouverai l'existence de ces vaches !
*[Lui poser une autre question] -> ferme_question

= conclusion_ferme
~ visitedIsland +=1 
~ knowledgeMF = true
(Tu lui donnes le colis, il te remercie en abaissant son chapeau. Alors que tu pars, il te fait un signe de main. Tu remarques qu'une des vaches te regarde étrangement, mais tu as juste le temps de cligner des yeux qu'elle a déjà arrêté...)

Merci gamine pour les engrais, repasse manger, je te ferai quelque chose qui n'a pas été contaminé par les ondes, un vrai repas ! 

(Tu le remercies et tu t'en vas)

*[Retourner dans l'avion] -> vol

=== interlude ===
// Interlude - se déclenche après avoir visité deux îles
"De retour au hangar principal, Meli prend un moment pour souffler. 
La radio grésille doucement. Meryl veut surement prendre des nouvelles, savoir comment tu vas"

* [Répondre à la radio] -> interlude_radio
* [L'ignorer et continuer sa mission] -> interlude_refused

= interlude_refused
~ interlude_finished = true

"Meli fait le choix d'ignorer l'appel et continuer sa mission elle n'as pas la tete a ça" -> vol
-> vol

= interlude_radio
"Ici Meryl. Comment ça se passe, Meli ? Les habitants ne sont pas trop difficiles ?"

* ["non ils sont géniaux pour l'instant"] -> les_habitants
* { knowledgeD == true and knowledgeF == true } [...Meryl...je peux en savoir plus sur l'histoire du syndicat ?] -> syndic
* { knowledgeF == true and knowledgeB == true } [ ...mais au juste c'est quoi le programme COLLAPS ? ] -> COLLAPS
{ knowledgeMB == false and knowledgeMBI and knowledgeMD == false and knowledgeMF == false:
    * ["J'ai encore du mal à comprendre ce qui se passe ici."] -> meryl_sermont
}
* [ conclure ] -> interlude_fin

= syndic
# elle reviens sur l'histoire du syndicat

* [posez d'autre question ] -> interlude_radio
* [ il est temps de partir ] -> interlude_fin

= COLLAPS

# elle reviens sur le programme COLLAPS
* [posez d'autre question ] -> interlude_radio
* [ il est temps de partir ] -> interlude_fin

= les_habitants
"ceux que j'ai rencontrée ont eue beaucoup de chose a me raconter, a vrai dire...je crois que je m'attache a eux...et c'est surement réciproque car je suis tout bonnement génial.
{knowledgeBI == true} ...j'avoue j'ai un peu craqué en parlant a huguette et karim ce n'est pas très profesionnelle de ma part, mais il savent mettre en confiance... au final la rupture est plus sensible que je l'imaginais.
{knowledgeB == true } ...j'aime bien peti.te jean, je comprend pas tout ce qu'iel raconte mais je l'ai trouvé très agréable, fait un peu peur avec ces histoire de nous remplacer mais bon il faut toujours croire en l'avenir.
{knowledgeD == true} ... Boogie-love est tout bonnement mon idole, si cet archipel étais pas tout bonnement entrain de couler, je pense que je viendrais l'aider a géré et etendre la porté de sa radio pira-....hm l'aidez a tenir son disquaire plutot
{knowledgeF == true} ... Moi j'aime trop ce genre de petit vieux franchement ! et je comprend son ressentiment, je fais ma mission pour aider ces gens ! et sa relation avec son petit fils me touche beaucoup franchement !

*{knowledgeBI == true} [raconter le craquage a meryl au stade ou on est] -> craquage
*{knowledgeB == true} [tout mon amour pour peti.te jean] -> amour
*{knowledgeD == true} [parler de Boogie-love] -> boogie
*{knowledgeF == true} [parler de la relation avec le petit fils] -> relation
* [conclure] -> interlude_fin

= craquage

# ici elle reviens sur son craquage

* [reparlez des habitants ] -> les_habitants
* [ posez d'autre question ] -> interlude_radio
* [ il est temps de partir ] -> interlude_fin

= amour

# ici elle reviens sur ce que pet.ite jean la raconté elle parle de son enfance
* [reparlez des habitants ] -> les_habitants
* [ posez d'autre question ] -> interlude_radio
* [ il est temps de partir ] -> interlude_fin
= boogie 

# ici elle reviens sur son obsession pour boogielove
* [reparlez des habitants ] -> les_habitants
* [ posez d'autre question ] -> interlude_radio
* [ il est temps de partir ] -> interlude_fin
= relation

# elle raconte la relation entre les 2, la famille éloigné , comment la ville a changé
* [reparlez des habitants ] -> les_habitants
* [ posez d'autre question ] -> interlude_radio
* [ il est temps de partir ] -> interlude_fin

= meryl_sermont

# meryl lui fait la leçon 

* [ mal de coeur ] -> coeur
* [ nostalgie ] -> nostalgie 
* [reparlez des habitants ] -> les_habitants
* [ posez d'autre question ] -> interlude_radio
* [ il est temps de partir ] -> interlude_fin

= coeur

#test
* [ continuez a se faire sermonnez] -> meryl_sermont
* [reparlez des habitants ] -> les_habitants
* [ posez d'autre question ] -> interlude_radio
* [ il est temps de partir ] -> interlude_fin
= nostalgie

* [ continuez a se faire sermonnez] -> meryl_sermont
* [reparlez des habitants ] -> les_habitants
* [ posez d'autre question ] -> interlude_radio
* [ il est temps de partir ] -> interlude_fin

= mission
* [reparlez des habitants ] -> les_habitants
* [ posez d'autre question ] -> interlude_radio
* [ il est temps de partir ] -> interlude_fin

= ending 
#test 

= interlude_fin
"Fais attention à toi. Ces gens ont leurs histoires, leurs blessures... 
Rappelle-toi qu'on est juste là pour livrer des colis, pas pour s'immiscer dans leurs affaires."

"Bon, je te laisse reprendre ta mission. Fin de communication."

* [Retourner à l'avion] -> vol



=== final_ending ===
#test
-> END