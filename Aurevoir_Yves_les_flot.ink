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
* [laissez un dernier message] -> last_message

= final_silence
Les pensées de Meli dérivent vers tous ces gens qu'elle a rencontrés...
Leurs histoires continueront de vivre, même quand l'eau aura tout recouvert.

* [Continuer] -> final_conclusion

= last_message
-> END

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

Hello routeur du ciel !! 
Ce manuel est un manuel **spécial**, conçu par mes soins pour les besoins des habitants de l’île ! 
(Enfin... les 3 résidents officiels. Y a une quatrième page pour un presque-résident ? 👀)

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

INFORMATION RÉSIDENT : Docteur Boogie-Love est un excentrique... c’est moi ! 
Hehehe. J’espère t’avoir surpris·e.
Je suis fan de musique, et j’ai une histoire mystérieuse à raconter !

INFORMATION LIEU : J’habite sur l’île la plus cool.
Y a plein de disques et une enseigne géante en forme de disque (pas celle en forme de coquille Saint-Jacques — l’autre !).
C’est là que je tiens mon disquaire "**CRAZY-LOVE**". des sons comme tu en as jamais entendu !

COLIS À LIVRER : Le colis scellé par le Syndicat, c’est pour moi. Apporte-le et je satisferai ta curiosité...

* [Lire la description de Pet.ite Jean] -> petite_jean
* [Lire la description du Vieux Jean] -> vieux_jean
* [Lire la description de Karim et Huguette] -> karim_huguette
* [Voir les contrôles] -> control
* [Décoller] -> vol

= petite_jean
~ knowledgeMB = true

INFORMATION RÉSIDENT : Pet.ite Jean n’est pas résident·e permanent·e.
Iel vient souvent voir son grand-père (le Vieux Jean). 
Introverti·e, bricoleur·euse, iel a du potentiel.
Toujours en train de bidouiller des trucs !

INFORMATION LIEU : Un îlot entouré d’arbres et de matos technique...ah et un tank !
Pet.ite Jean y a installé sa cabane.
Attention : avant, c’était une zone minée... mais iel est toujours vivant·e, donc ça devrait aller pour toi !

COLIS À LIVRER : (À NE PAS COMMUNIQUER AU SYNDICAT) C’est moi qui le commande pour iel.
Y a du matos de soudure et d’électronique. Iel est malin·igne. Laisse-iel bricoler !

* [Lire la description de Boogie-Love] -> boogie
* [Lire la description du Vieux Jean] -> vieux_jean
* [Lire la description de Karim et Huguette] -> karim_huguette
* [Décoller] -> vol

= vieux_jean

~ knowledgeMF = true

INFORMATION RÉSIDENT : Le plus old-school du coin.
je respecte ce style aujourd'hui des vieux aigris on en voit plus beaucoup.
Il tient une ferme, râle tout le temps, mais il est pas méchant. C’est le grand-père de Pet.ite Jean. 
par rapport a ses vaches c'est un point sensible avec lui...tu verras! 

INFORMATION LIEU : Une île classique : un champ, une ferme, du bétail, un moulin. Simple et rustique.

COLIS À LIVRER : Une lettre de sa fille et un peu d’engrais. Rien de bien fou, mais ça compte.

* [Lire la description de Boogie-Love] -> boogie
* [Lire la description de Pet.ite Jean] -> petite_jean
* [Lire la description de Karim et Huguette] -> karim_huguette
* [Voir les contrôles] -> control
* [Décoller] -> vol

= karim_huguette

~ knowledgeMD = true

INFORMATION RÉSIDENT : Deux anciens soldats.
Ils vivaient ici avant l’inondation mais sont partis faire la guerre contre l’ancien régime.
Revenus changés... et probablement bien éméchés 😅

INFORMATION LIEU : Le bistrot "**La Gamberge**". Impossible de le rater : 
y a des chaises et des tables dehors...
mais surtout des drapeaux du Syndicat partout! c'est gars c'est des convaincus!
Va boire un coup avec eux !

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
    ...Vous etes sur une ile de yveline les flots, elle a pas trop de nom...moi je l'ai renommé Zig-450-GOD KILLER
    C'étais autrefois rattaché a la ferme pas loin, celle de mon grand père le vieux jean maintenant elle est isolé on ne peut venir ici que en barque....
    (tu peux sentir de l'excitation dans ses yeux) ...ou en venant avec le glorieux COLLAPS
    -else:
    … Oui, c’est moi.  
    Désolé·e, j'étais occupé.e a communiquer avec les aliens…je crois ? en tout cas j'essaye de comprendre comment faire ?

}

*[Lui poser une autre question] -> question
*[Comment ça, “aliens” ?] -> alien
*[...Le glorieux COLLAPS ?] -> glorieux

= glorieux

(iel te regarde de haut en bas avec un air jugeur.euse) ...Toi tu déplace avec le COLLAPS-40.
je connais mal toute l'histoire, mais les premier scientifique du syndicat ont été recruté pour travailler sur le programme COLLAPS.
l'ancien ordre en avais besoin pour ces échanges économique ça a finit par se retourner contre eux.
Le syndicat a vite compris comment utiliser les ondes particulières qui y'a sur toute la grande archipel. et crèere les tours radio. 

*[Lui poser une autre question] -> question

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
...je pense qu'ils sont trop timides c'est pour ça qu'ils refusent de discuter

*[Lui poser une autre question] -> question


= robot

...j'aimerai oui.
Malheureusement, je peux pas me transformer en robot… Ma mère s’inquiéterait trop.
moi je ne suis pas comme les vieux, les aliens, les machines et les pronoms ça me fait pas trop peur.
fin si certaines machine peuvent faire peur mais bon je m'éloigne du sujet.
Un jour j'ai promis a ma mère que je deviendrais un cyborg...elle l'a tellement mal pris.
Qu'elle m'a envoyé ici pour des vacances en espérant que j'oublie ces histoires.
Elle penserai que le coté anti syndicat de grand-père l'aiderai.

*[Un robot genre… comme les COLLAPS ?] -> robot_2
*[Lui poser une autre question] -> question


= robot_2
Oui… J’aimerais tellement construire une machine comme COLLAPS-30 ou 40...Mais vivante.  
Une machine intelligente, capable de voler seule à travers l’archipel.  
Avec ça, je pourrais convaincre grand-père que le système radio est génial…  
J’aimerais créer le COLLAPS-50.  
Sauf si, quand je rejoins le Syndicat, il existe déjà.

*[Lui poser d’autres questions] -> question


= tank
Non, les mines, c’était les anciens habitants paranoïaques…  
Il y a longtemps, il y a eu une guerre ici... Je crois que le syndicat l'appelle "la guerre de libération"
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
Et il sait que je bidouille des trucs. Il trouve ça cool même.
À vrai dire c'est surement le seul de la famille à trouver ça cool.

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
À vrai dire j'ai rien contre le syndicat.
...mais si j'étais un robot je crois que je n'aimerai pas trop être dépendant d'un maître qui me forcerait à me détourner de mamission pour ses petits besoins.

*[Lui poser une autre question] -> question


= conclusion
~ visitedIsland += 1
Il est temps de repartir.  
Tu tends le colis à Pet.ite Jean, qui tente d’esquisser un sourire.  
Tu t’apprêtes à décoller quand tu l’entends dire :  
« Merci d’être passée, madame du Syndicat…  
Même si mon grand-père a peur de vous, je te promets — pour te remercier de ne pas me dénoncer — qu’un jour, je créerai un COLLAPS qui te permettra de te reposer. »

Pas sûr que cette promesse te fasse que du bien…  
Mais le gamin est tellement enthousiaste que c’en est contagieux.
Tu décides de ne pas répondre, et tu décolles.
~ knowledgeB = true
*[Retourner dans l’avion] -> vol




=== bistro ===

tu finis par atterir sur un ilot, ou il est disposé quelque tables, et des chaisses proteger par une terasse.
proche d'un batiment qui prend la forme d'un bistro, tu reconnais une enseigne : LE GAMBERGE

sur une table une femme et un homme discute une bouteille face a eue, tu remarques des élèments du syndicat, un peu partout.
Un drapeau du syndicat qui flotte au gré du vent, sur une table grossièrement posé, tu peux voir une statue du leader de la révolution. érigée après la guerre contre l'Ordre défeline.
une affichage de propagande... du Syndicat pendant la guerre contre l’Ordre Défeline est aussi exposé sur l'avant du bistro.

*[Commencer à lui poser des questions] -> bistro_question

= bistro_question
Tu as des colis à livrer et des missions à remplir.  
Pas sûr qu’il faille trop traîner ici…

*[ une bouteille a cet heure?] -> bouteille
* {knowledgeMBI == false} [...c'est une sorte de bistro ici ?] -> bistro_vide
* {knowledgeMBI == true} [...pourquoi un bistro ici ? ] -> bistro_vide
*[...je peux boire avec vous?] -> straightEdge
* {knowledgeMBI == true} [vous bossez pour le syndicat ?] -> syndicat
*[leurs rendre leurs colis] -> conclusion_bistro

= bouteille
« Oh, tu sais, quand t'as plus grand-chose à faire et une bonne amie avec toi, la boisson devient vite une option acceptable. 
Faut bien s'occuper, alors parfois on organise des apéros. » répond Karim.
Huguette renchérit, un peu piquée : « Oh, la gamine, nous juge pas parce que t'as enfilé le costume ! 
Nous aussi on est passés par là — on regardait pas les gens de haut. »

*[La traiter de vieille folle] -> folle

*[Leur poser d'autres questions] -> bistro_question


= folle
Karim éclate de rire. Huguette, après un petit sourire gêné, secoue son ami.

« Hé ! Déjà qu'on manque de respect, t'as pas intérêt à te mettre de son côté !
Foutu révisionniste incapable de tenir un engin ! » dit-elle en le bousculant.

Karim se remet à rire aux éclats.

*[Vous êtes d'anciens membres du Syndicat ?] -> folle_2
*[Leur poser d'autres questions] -> bistro_question


= folle_2
Il se retourne vers toi, tout fier, il pointe le drapeau. Huguette prend la parole.
« Et ouais, gamine — figure-toi qu'on est d'anciens soldats du Syndicat, ehhhh ouais ! 
On est partis quand on était jeunes. 
On a aidé à repousser l’armée de DeFeline.
Après la victoire contre DeFeline, le Parti pour la Nation a pris le pouvoir. On croyait à leurs promesses, mais ça n’a pas duré.»
elle marque un temps d'hésitation. boit un coups et reprend 
«...en tout cas Sois sûr qu'ils ne viendront plus nous embêter !
Maintenant on se la coule douce, on se repose et on repense aux bons vieux temps, quand on se battait contre les fascistes de DeFeline. »
Un sourire nostalgique se dessine sur leurs visages.

*[Leur poser d'autres questions] -> bistro_question
*[...DeFeline ?] -> defeline

= defeline
Huguette repose son verre, le ton plus grave.  
« DeFeline, c'était le chef de l'Ordre — l'ancien régime colonial.  
Ils contrôlaient Gallia comme un port militaire, jusqu'à ce qu'on les chasse.  
On pensait qu'une fois partis, tout irait mieux… »

Karim renchérit :  
Quand on a quitté le front, ils ont lancé ce programme COLLAPS… des avions civils, des tours radio.
Ça semblait beau, mais c’était juste un autre moyen de contrôler les îles. L'influence du S.T.C a ironiquement permis d'endiguer les effets.

Huguette sourit tristement :  
« Heureusement qu'à l'époque, le Syndicat était fort.  
On s'est battus pour que les îles gardent leur liberté. »  

*[Leur poser d'autres questions] -> bistro_question

= bistro_vide
{knowledgeMB == false:
    ... les deux habitant esquissent un grand sourire après vous avoir regardé de haut en bas. la femme parmi les deux prend la parole et dis
    " ça n'a pas bien révisé son brief a ce que je vois hahaha c'est notre bistro...enfin ça l'est devenue on la récupéré."
    -else:
        Karim et Huguette esquissent un sourire, mais paraissent un peu moins à l'aise.

        « À vrai dire, ce n'était pas notre bistro à l'origine — on l'a récupéré. Il appartenait à un ancien résident d'ici. On venait souvent quand on était jeunes, avant de servir pour le Syndicat. Le propriétaire détestait qu'on joue près de sa terrasse avant que tout soit inondé. »
}

*[Le propriétaire est parti ?] -> proprio
*[Leur poser d'autres questions] -> bistro_question


= proprio
« Non, le propriétaire ne serait jamais parti d'ici, pas vraiment. Il tenait trop à son bistro. 
À vrai dire, il tenait beaucoup aux gens du coin. Il faisait le grognon, mais il y tenait.
Il nous l'a dit lui-même quand on l'a croisé avec Karim, continue Huguette. « On est partis avec lui à la guerre contre les soldats de l'ancien ordre. Cette lutte, c'était important pour lui. »
*[J'imagine qu'il est mort au combat.] -> mort
*[Leur poser d'autres questions] -> bistro_question


= mort
« …il est tombé pendant la guerre de libération, quand on a chassé l’armée de DeFeline.
comme beaucoup de nos camarades...
On a décidé de reprendre son bistro, C’était juste après la guerre, pendant la grande inondation… quand tout le monde croyait que la paix durerait.
Même sans habitants, ça nous tenait à cœur de revenir au Gamberge.
Au final, on est jamais repartis, haha. On se la coule douce ici tant que l'eau ne nous a pas submergés. »

*[Leur poser d'autres questions] -> bistro_question


= straightEdge
Les deux esquissent un petit sourire espiègle et t'invitent à t'asseoir à côté d'eux. Huguette pose un verre devant la chaise vide. Tu commences à boire.

« Tu sais, cet alcool est fabriqué par un de nos amis, Simon Levail. Il était dans notre escadron avant la guerre.
Après la guerre, le Syndicat voulait tourner la page… Beaucoup comme Simon se sont recyclés dans la vie civile. »

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
« J'ai connu ça il y a quelques années, hahaha — c'est pas simple. Prends ton temps, gamine. Cette douleur ne disparaîtra pas avec le boulot. 
Tu peux visiter les plus belles îles de l'archipel, lunettes d'aviateur sur le nez, une mission qui te semble noble… mais tout ça peut cacher ta peine.
Prends le temps de te soigner, de cicatriser. »

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
(Tu finis par atterrir sur un îlot où se trouve un bâtiment avec une énorme enseigne en forme de disque.
il est écrit "CRAZY LOVING PLACE")
(Il y a plein de cartons devant la boutique.
Depuis l'intérieur du bâtiment, on peut entendre une musique très forte.
Un homme avec une étrange coupe et une dégaine particulière sort de la boutique avec un grand sourire
prenant une pause excentrique, il te salue d'un grand geste de la main
"BIENVENUE ROUTEUSE DES CIEUX !! BIENVENUE DANS MON ANTRE !!! J ESPERE QUE TU Y TROUVERAS L'AMOUR DU SON YO !!"

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

= intro

{knowledgeMD == false:
    "Yes, YES, YES ! C'est moi, docteur CRAZY-LOVE !
    Je suis un peu pris actuellement, j'essaie encore de nouvelles ondes !!!
    j'apprécie que tu aies pris le temps de lire un peu mon manuel, YO !
    Ça fait un bail qu'on n'a pas vu quelqu'un de ton genre par ici.
    Faut dire qu'il reste pas grand monde de branché dans le coin !
    MAIS CA MA LAISSÉ LE TEMPS DE BIEN BIDOUILLER LE COLLAPS-40 YO !"
- else:
    (Il se met à danser sur le rythme de la musique avant de la couper brutalement)
    "Désolé, aviatrice ! J'étais encore en train d'essayer de nouvelles ondes !!
    Mais j'apprécie ton bon goût.
    Ça faisait longtemps qu'on n'avait pas vu un vrai membre du Syndicat venir ! 
    La dernière fois qu'on a reçu du courrier, c'était en passant déposer Pet.ite Jean chez son grand-père.
    Mais bon, ça m'a laissé le temps de bien préparer le COLLAPS-40 YO !"
}


* [Vous sabotez COLLAPS-40 ?!] -> docteur_robot
* [Lui poser une autre question] -> disquaire_question


= docteur_robot

"Et oui, c'est moi, chère aviatrice !
Je suis celui qui entretient COLLAPS-40.
Bien que je ne sois pas son inventeur, j'ai beaucoup côtoyé son inventrice...hmmm émotion !
J'entretiens aujourd'hui la radio et l'avion."
(Il rigole un coup)
"Elle m'a fait tomber amoureux du son et des ondes...on a vécue une belle histoire d'amour.
Depuis, je ne les aies jamais quittés. Cette radio est ma meilleure amie ici."

* [Merci pour le travail ?] -> neuf
* [Lui poser une autre question] -> disquaire_question

= neuf

(Il esquisse un sourire mélancolique) 

"Merci, ça me touche.
Ça me tient à cœur, son inventrice y tenais beaucoup."
(Il marque un temps d'arrêt, brisant le personnage.)
Elle y tenait plus que tout, et on a travaillé ensemble pour le construire.
Elle était l'ingénieure principale de la construction de cette machine. 
Elle croyait plus que tout que ce projet permettrait un meilleur avenir à l'archipel.
Elle s'imaginait un monde où les ondes seraient partout, et où quiconque pourrait transmettre ce qu'il veut grâce à l'aide des radios, rencontrer des gens d'ailleurs." (Il rigole) "Pet.ite Jean a toutes les chances de réaliser son rêve !"

* [...J'imagine qu'elle n'est plus là ?] -> mort
* [Lui poser une autre question] -> disquaire_question

= mort 
"Oui, elle est morte d'une grave maladie, et avec nos moyens de l'époque, nous n'avions pas de quoi la sauver.
Le colis que tu viens me délivrer contient ses notes de carnet sur COLLAPS-30.
Je les ai lues quand je bossais avec elle. Elle se nommait Elisabeth Van-Kerk.
Ces notes sont restées longtemps cachées en attendant qu'une meilleure version (le programme COLLAPS-40) 
soit réalisée, par peur d'espionnage du PPN le parti au pouvoir. 
Bref, ton destrier est sa plus belle preuve de son empreinte sur le monde."

* [Lui poser une autre question] -> disquaire_question

= docteur

"NON, PAS EXACTEMENT !"
( il se met a tousser, surement que crier dans tout les sens trahit un peu son age avancé )
À vrai dire, je suis un fan de musique excentrique, hahaha.
Je décortique les sons et les ondes pour découvrir ce qu'ils cachent, comment les soigner, les entretenir.
je m'occupe aussi de la tour radio de Yves les flots quand le S.T.C ne passe pas par là
...SOIT LA MAJORITÉ DU TEMPS HAHAHA
JE SUIS UN DOCTEUR DU SON, DE L'ONDE !"

* [OH mais c'est vous le manuel !] -> revelation
* [Lui poser une autre question] -> disquaire_question

= revelation

"Hahaha, et oui !
Je le mets même régulièrement à jour, pour prendre les commandes pirates de Pet.ite Jean.
J'entretiens aussi la tour du coin. 
COMME UNE PIRATE DES TEMPS MODERNE... GENRE UN PIRATE DES ONDES TU COMPREND ?
( il rigole un coups, puis se met a tousser, crier tout le temps ne lui réussit pas beaucoup )
Le seul aussi !"

* [Ça me paraît peu légal ce que vous faites] -> cops
* [Lui poser une autre question] -> disquaire_question

= cops

"QUI POURRAIT M'ARRÊTER ? JE SUIS TOUT-PUISSANT EN CES TERRES !
L'île a été abandonnée par le Syndicat et le gouvernement quand l'inondation a commencé.
Ils ne pensaient pas que trois habitants lutteraient autant pour rester ici.
C ETAIS SANS COMPTER L'AMOUR UNIQUE QUI LIE LES COEURS MORCELÉS DE YVES-LES-FLOTS.
( il tousse encore un coups, mais cette fois il rigole )
je devrais la noter celle la elle est pas mal hahaha.
Ils ont mis en place une mission de bénévolat périodique pour nous livrer des colis.
Mais les lois ne s'appliquent plus vraiment ici. Ils n'ont pas d'intérêt à s'occuper d'une vieille radio usée, et tu n'as que faire de rapporter un vieux excentrique et un·e petit·e un peu étrange."

* [C'est pas faux, mais pourquoi vous faites ça ?] -> passion
* [Lui poser une autre question] -> disquaire_question


= passion

(Il esquisse un sourire et se rapproche de toi en prenant une pose excentrique)

"Tout bonnement parce que j'aime ce son plus que je n'aime autre chose. J'ai perdu quelque chose de cher dans ma vie, mais j'ai toujours le son et les ondes. Je voulais un endroit où je pourrais les travailler tranquillement, et aider les derniers habitants de Yves-les-Flots me plaisait.
Le·a gamin·e a du potentiel."

* [Lui poser une autre question] -> disquaire_question

= peur

(Il rigole à pleine gorge avant de prendre une pause dramatique) 

"OH ! SWEATHEART, JE SAIS QUE C'EST DANGEREUX !
CET QUETE DU SON N'EST PAS SANS RISQUE ! MAIS JE LE PREND AVEC PLAISIR YO !
SI TEL EST MON SORT QUE MES OREILLES SOIENT SACRIFIÉES SUR L'AUTEL DU SON, AINSI SOIT-IL !
( il rigole de plus belle, Meli peut voir qu'il est sincère, mais plus tout jeune. )
"Le silence me terrorise, il m'horripile, et dans un coin comme celui-là, du silence, il y en a partout.
Le bruit, le son est la seule chose qui me garde compagnie aujourd'hui."

* [Dit comme ça, c'est un peu triste] -> tristesse
* [Lui poser une autre question] -> disquaire_question

= tristesse

(Il rigole de plus belle, cet fois il fait le choix de ne pas crier)

"Bien sûr qu'il y a un peu de tristesse dans ça ! 
On est sur une petite île qui a été inondée par l'eau après avoir été ravagée par la guerre.
Les bombardements, les tirs, les cris, les pleurs se rejoues dans le crâne de tout ce qu'ils ont entendu.
puis revenait le silence plombant.
( il réfléchis quelque seconde, et esquisse un sourir, puis regarde Meli avec un air sérieux )
Mais dit moi gamine tu as le temps de t'intéresser a l'histoire de l'archipel ? 
je parles pas de Yves les flot mais de Gallia en général en commençant par le PPN?




* [ Avec plaisir !] -> histoire
* [Lui poser une autre question] -> disquaire_question

= histoire

"Gallia était un archipel colonial, dirigé par l'empire DeFeline localisé sur une autre océans que le notre.
Ils finirent par quitter les lieux quand les ressources commencèrent à manquer.
le PPN un parti qui avais été fondé au temps colonial, avais poussé a les faire partir a l'époque.
ils ont pris le pouvoir après la guerre contre DeFeline.

* [ la vie sous le PPN étais comment ?] -> PPN
* [Lui poser une autre question] -> disquaire_question

= PPN

(boogie love marque un temps d'arrêt, il voit que meli est intéressée )
Gallia était une archipel très pauvre après le départ de DeFeline.
Le PPN promis de moderniser l'archipel tout entière, la rendre autonome.
Ils mirent en place le programme COLLAPS, qui permis de relier les îles entre elles.
Le PPN appliquait toutes sortes de lois autoritaires afin de garder la population bien docile.
Toute contestation populaire était fortement réprimée."
(Il rigole)
"Sous le PPN, ou encore moins le régime DeFeline, un endroit comme Yves-les-Flots n'aurait jamais pu exister.

* [ et c'est la ou le syndicat joue son rôle ?] -> syndicat
* [Lui poser une autre question] -> disquaire_question

= syndicat 

"Excatement tu comprend vite.
Le syndicat est née du contexte de l'industrialisation de l'archipel.
Des ouvriers, des ingénieurs, des scientifiques qui rêvaient d'une organisation meilleures.
A vrai dire le syndicat c'est constituer spontannément par la désorganisation du PPN.
et les avancées croissante qu'avais permit le programme COLLAPS.

* [ j'imagine que c'est la que ça c'est gâté ?] -> tension
* [Lui poser une autre question] -> disquaire_question

= tension

...Tout n'étais que tension entre le PPN et le syndicat.
Le syndicat a toujours été en opposition avec le PPN, et a toujours lutté contre lui.
ça c'est gaté quand le PPN a commencé a retravaillez avec l'ordre DeFeline.
Le programme COLLAPS intéréssé l'ordre DeFeline, et les ressources qui permettais de les créer.
* [COLLAPS a changé l'archipel !] -> COLLAPS
* [Lui poser une autre question] -> disquaire_question

= COLLAPS
( Meli ne sais pas tout de l'histoire de l'archipel, mais elle est traversé par le mythe du COLLAPS )
"c'est vrai, COLLAPS a changé l'archipel.
Les iles ont évolués, et le programme COLLAPS est devenue avec le symbole de l'archipel.
Le programme COLLAPS avais permit de sortir l'archipel entière de la misère.
appaisé les tensions ethnique entre les différentes îles.
crée une interdépendance économique entre les îles.
le partage et la redistributions des ressources étais capitale a la survie de l'archipel.
le syndicat a travaillé a sa base a ça, le programme COLLAPS c'etais leurs fierté.
* [Mais ça n'a pas duré] -> guerre
* [Lui poser une autre question] -> disquaire_question

= guerre

( Boogie Love, marque un temps d'arrêt, il été happé par ses souvenirs )
"Oui, la guerre civile éclata.
Le PPN aidé de l'ordre DeFeline, lança une violente répression contre l'ensemble de l'archipel.
le syndicat fut déclaré organisation terroriste.
le moment charnière fut quand le PPN fit exploser un COLLAPS-30 en plein vol, tuant tout les passagers a bord.
Le syndicat se rapprocha des résistants naissant, le PPC le parti pour COLLAPS.

* [et la le conflit se globalise.] -> PPC

= PPC

( Boogie-love est surpris, il réalise que Meli en sait plus qu'il l'imaginais sur l'archipel )
Oui le PPC étais un parti née du moment révolutionnaire.
il rassemblait des ouvriers, des paysans, des anciens du syndicat.
Le PPC avais pour but de renverser le PPN et l'ordre DeFeline.
Après des années de guerre intense, le conflit s'enlissais...
La violence finit par s'exporter a Marinette la capitale de DeFeline.
des violences émeutes, grèves, sabotages, assassinats secoué tout l'empire.
DeFeline décida de se retirer de Gallia, laissant le PPN seul au pouvoir.

* [et c'est la que le syndicat a gagné ?] -> victoire

= victoire

( Boogie-Love sourit, il voit que le récit officiel est bien connue.    )
le PPN fut forcé de négocier avec le syndicat.
en échange d'un partage : il garde la Capitale, ou se trouve la majorité des ressources.
et le syndicat le reste de l'archipel, le controle des tours radio, et le programme COLLAPS.
Pour l'organisation politique, le PPN garde le pouvoir, mais le syndicat a une grande influence.
le PPC est la face démocratique du syndicat.
le S.T.C le syndicat des travailleur COLLAPS est l'organe "militaire".
Aujourd'hui le syndicat est l'organisation la plus puissante de l'archipel.
C'est grâce a eux que tu peux voler dans les airs de Gallia.
et que nous pouvons toujours vivre ici a Yves-les-Flots."

* [Lui poser une autre question] -> disquaire_question

= carton
(Boogie Love esquisse un sourire de fierté) 

" TOUT CES CARTONS SONT MA VIE, MES SOUVENIR, MES ORGANES YO ! JE CONSERVE TOUT ÇA COMME UN TRÉSOR !
DANS MA JEUNESSE J"AI VOYAGÉ AUTOUR DE L"ARCHIPEL, RÉCUPURANT VINYL ET OBJETS BIZARRES PARTOUT OÙ JE PASSAIS.
CE MAGASIN SERA JAMAIS ASSEZ GRAND POUR CONTENIR SE TRÉSOR !
( il rigole a pleine gorge )
J'ai eu l'occasion de beaucoup voyager autour de l'archipel avec les ingénieurs du Syndicat.
Le colis que tu viens m'apporter est justement un colis très important pour moi."

* [...Je peux savoir ce qu'il contient ?] -> verite 
* [Lui poser une autre question] -> disquaire_question

= verite

"J'accepte de te dire la nature exacte de ce colis en échange d'un souvenir venant de toi.
Quelque chose qui a du sens pour toi et que tu me dises pourquoi.
En échange, je te dit la vérité sur ce colis que j'attends."

* [Lui donner un souvenir] -> souvenir
* [Lui poser une autre question] -> disquaire_question

= souvenir 

(Après une courte hésitation, Meli sort avec confiance un CD de l'avion)

"...Ajoutez ça à votre collection musicale.
C'est une compilation de musiques que j'aime beaucoup que j'avais faite il y a longtemps pour... une amie, mais je n'en ai plus besoin aujourd'hui...
L'avoir toujours avec moi, je crois que ça me fait un peu souffrir.
Et je veux passer autre chose, je pense que avec vous il sera en sécurité.
Alors je préfère que ce soit vous qui l'ayez. J'espère que ça vous plaira."

* [Écouter son histoire] -> aurevoir
* [Lui poser une autre question] -> disquaire_question

= aurevoir

(Boogie Love accepte le cadeau, s'éclaircit la voix et prend un ton mélancolique)

"C'est le carnet de ma femme, Eleone von Kerk, l'inventrice du protocole COLLAPS.
Celui qui a permis de donner plus d'indépendance au Syndicat, un protocole simple permettant la communication entre les îles.
Elle est morte pendant une violente répression de la part du PPN.
Elle étais la femme de ma vie. Ce carnet contient ses notes. 
Ils avaient été conservés par le Syndicat comme secret d'État, elle me les avait légués.
Elle ne m'avait jamais offert de souvenir.
Elle voulait que si elle partait la première, je récupère ce journal.
le carnet étais resté au syndicat longtemps, par peur d'espionnage du PPN.
Ils ont fait le choix de me le rendre aujourd'hui, après tout ce temps.
A vrai dire...Je l'avais déjà lu, elle me le faisais lire quand on travaillais ensemble.
Le relire....c'est un peu comme si elle étais encore là.
ça sera le plus beau souvenir que je n'aurais jamais conservé d'elle."
( il rigole un coups, cet fois le personnage a craqué, il est sincère, mais pas triste.)

* [Lui poser une autre question] -> disquaire_question

= conclusion_disquaire
~ visitedIsland +=1 
~ knowledgeD = true
(Tu lui remets son colis) 

"Meli, c'est ton nom, c'est ça ?
Reviens me voir si jamais tu ne sais pas quoi faire de ta vie.
Je te montrerai comment utiliser les radios.
Je suis persuadé que ça pourrait te plaire."

(Tu le remercies et retournes à ton avion)
* [Retourner dans l'avion] -> vol

=== ferme ===

(Tu arrives sur une île, avec un moulin, une petite ferme, et un enclos de vaches.  
Un vieil homme est assis sur une chaise devant la ferme, il te fixe avec méfiance.)

Oh, vous devez être un des chiens de garde du Syndicat !  
Je vous fais pas confiance, restez bien à votre place et vous avez pas intérêt à toucher à mes vaches !  
Oui m’sieur… ma p’tiote !

-> ferme_question

= ferme_question
Tu as des colis à livrer et des missions à remplir.  
Pas sûr qu’il faille trop traîner ici…

*[Lui dire qu’il a une belle ferme] -> belle_ferme
*[Lui demander de quoi il se méfie] -> mefiance
*{knowledgeB == false and knowledgeMB == true} [Lui demander où est Pet.ite Jean] -> jean
*{knowledgeBI == true} [Lui demander s’il connaissait l’ancien propriétaire du bistro] -> viel_ami
*{knowledgeMF == false} [Lui demander comment vont ses vaches] -> vache
*{knowledgeMF == true} [Lui demander s’il y a des aliens parmi ses vaches] -> vache
*[Tiens ton colis] -> conclusion_ferme

= viel_ami
(Il a l’air surpris que tu poses cette question. Il marque un temps d’arrêt, puis commence :)  
"Oui, c’était un vieil ami à moi.  
À une époque, on faisait les 400 coups ensemble !  
La vie était vraiment dure à l’époque où l’Ordre DeFeline régnait.  
On volait, on se battait contre des gangs rivaux, on buvait, on fumait, on dansait !  
Quand le premier COLLAPS-10 nous a permis de communiquer facilement avec les autres, c’était une vraie révolution !  
Ça a sorti pas mal de monde de la précarité. On a profité de cette transformation de Yves-les-Flots.  
Puis il y a eu la guerre civile."  
(Il cesse de parler, sa voix commence à se casser, mais sa dignité le rattrape.)  
"On a tous les deux aidé les résistants au début.  
On les aidait quand ils passaient, on donnait de fausses informations au gouvernement.  
Mais lui voulait plus, il voulait revivre notre jeunesse quand on faisait les 400 coups.  
Il s’est enrôlé dans le S.T.C. et les résistants."  

*[Comment votre amitié s’est-elle terminée ?] -> fin_ami  
*[Lui poser une autre question] -> ferme_question

= fin_ami
(Il ne bronche pas. Cette question devait forcément arriver. Il reprend :)  
"Je ne l’ai jamais revu.  
Il est l’une des nombreuses victimes du PPN.  
La guerre civile l’a pris.  
On n’avait pas grand-chose, lui et moi… juste cette vie précaire ici.  
Il voulait jouer son rôle dans l’Histoire, moi je voulais rester en vie.  
On s’est dit adieu, on s’est embrassé une dernière fois, et c’est mon dernier souvenir de lui."  
(Le vieux Jean sanglotte en silence, il se tourne pour que tu ne le voies pas.)  
"J’ai refait ma vie, je me suis marié avec une femme et j’ai eu des enfants…  
Mais je n’oublierai jamais cet amour.  
Quand je vois les deux du bistro… je me rappelle de lui."  

*[Lui poser une autre question] -> ferme_question

= belle_ferme
D’abord méfiant à ta remarque, il finit par se détendre un peu.  
"T’as pas tort ! Elle a résisté à beaucoup de choses, ma petite ferme !  
Même quand la montée des eaux a commencé.  
Les habitants pensaient que j’étais un illuminé de rester, ils disaient que je me laisserais submerger.  
Ma ferme a même servi à protéger des vaillants soldats de la résistance !  
Ils se sont fait avoir par les ondes que vous diffusez partout et qui provoquent la montée des eaux !"  

*[La résistance ?] -> resistance  
*[Lui poser une autre question] -> ferme_question

= resistance
(Il crache sur le sol et te regarde en fronçant les sourcils.)  
"Alors on vous apprend rien sur l’histoire de notre île au Syndicat !  
Il y a quelques années, quand le Parti pour la Nation (PPN) nous menait la vie trop dure,  
une petite bande de résistants s’est formée et menait la lutte depuis ici pour se débarrasser du PPN.  
Ça a déclenché une guerre civile."  
(Il marque un temps d’arrêt, il semble se souvenir de choses.)  
"Les résistants ont pris les rênes du Syndicat qui gérait le système COLLAPS.  
Ils étaient prêts à tout pour faire tomber le PPN, soutenu par l’Ordre DeFeline !  
Mais cette guerre s’est enlisée.  
Les révolutionnaires du Syndicat sont devenus de plus en plus violents.  
Constatant l’état de destruction de l’archipel, ils ont établi un partage du pouvoir :  
PPN gère la politique globale, et le S.T.C. gère le système COLLAPS et les travailleurs autour.  
Le PPN vit à la capitale, impose sa politique ailleurs,  
et le Syndicat régit l’organisation du travail sur tout l’archipel."  
(Tu sens que son ton devient plus grave. Il fixe le vide, son visage est marqué par la peine.)  
"…Toutes ces vies perdues, ces jeunes qui se sont battus pour un avenir meilleur…  
Malgré que j’aie aidé le Syndicat, je ne leur ferai jamais confiance !  
Ce n’est qu’une bande de vieilles élites qui ont exploité les pauvres gens comme moi !"  

*[Pourquoi vous avez aidé le Syndicat ?] -> ennemis  
*[Lui poser une autre question] -> ferme_question

= ennemis
"Je déteste le Syndicat, je suis persuadé qu’il cache des choses avec ses ondes !  
Mais le PPN a fait bien plus de mal à la population de Yves-les-Flots.  
La résistance était composée surtout de petites gens venus des îles alentour !  
J’ai connu ces marmots avant qu’ils se prennent pour des révolutionnaires.  
Et j’ai vu tout le mal que le PPN, aidé de l’Ordre DeFeline, a fait.  
Je pouvais pas collaborer avec ces pourris du gouvernement."  

*[Lui poser une autre question] -> ferme_question

= mefiance
"De quoi je me méfie ? Des ondes !  
Des tours ! De toutes ces machines qui nous parasitent le cerveau !  
Et puis tous les jeunes s’enrôlent dans le Syndicat en pensant faire quelque chose de grand.  
Je sais qu’eux, ils sont prêts à collaborer avec les anciens pouvoirs.  
ILS NE SONT PAS DE CONFIANCE !"  

*[Lui promettre de ne jamais négocier avec qui que ce soit] -> negociation  
*[Lui poser une autre question] -> ferme_question

= negociation
(Il esquisse un léger sourire, finalement pas si dur à amadouer.)  
"...Merci, gamine, hahaha.  
Meli, c’est ça ton nom ? Fais gaffe au Syndicat !  
Je suis sûr que t’es une de ces jeunes avec plein de rêves patriotiques dans la tête,  
qui rêve d’un grand archipel interconnecté !  
Avec plein d’ondes partout qui nous surveillent en permanence, hein !"  

*[Lui dire que vous n’êtes qu’un cœur brisé] -> amour  
*[Lui poser une autre question] -> ferme_question

= amour
(Son visage se détend encore plus, il esquisse une moue compatissante avant de reprendre son ton dur.)  
"Les jeunes d’aujourd’hui s’enrôlent pour un tout et un rien !  
Tu me rappelles la mère de Pet.ite Jean.  
Elle était tellement charmée par les discours du sénile Boogie-Love  
qu’elle est allée travailler à la capitale pour ces traîtres du Syndicat !  
Aujourd’hui, elle bosse pour l’ennemi !  
Mais j’éduque le.a Pet.ite Jean à pas se faire avoir par ce genre de discours !"  

*[Lui poser une autre question] -> ferme_question

= jean
(Il réfléchit quelques secondes.)  
"Sûrement dans le bosquet pas loin.  
En général, iel aime bien rester dans son coin, jouer avec ses engins, ses trucs.  
Le.a petit.e est malin.e, très débrouillard.e. Iel est très renfermé.e, parle pas beaucoup, alors je le.a laisse tranquille.  
Et puis en vérité, je suis un peu comme lui, je le.a comprends bien. On a signé un contrat, alors je sais pas trop où iel est."  

*[Un contrat ?] -> contrat  
*[Lui poser une autre question] -> ferme_question

= contrat
"Je le laisse faire ce qu’iel veut tant qu’iel reste ici,  
et je l’aide à avoir ce dont iel a besoin en termes de colis.  
Et iel vient me voir. Un jour, iel trouvera une solution pour que Yves-les-Flots redevienne une île comme avant.  
Même si j’ai pas confiance en la radio et toutes ces choses, j’ai confiance en le.a petit.e.  
Quoi qu’iel fasse, ça sera pour le bien de tous, j’en suis convaincu."  

*[Lui poser une autre question] -> ferme_question

= vache
{knowledgeMF == false:
    "Vous me croirez jamais... mais y a une de mes vaches qui est un alien.  
    Je l’ai vue un soir orageux, en train de parler avec un talkie-walkie.  
    Avant que j’aie le temps de réaliser, je suis tombé dans les pommes.  
    À mon réveil, plus aucune vache se comportait bizarrement."
- else:
    "J’ai toujours su que je finirais par rencontrer quelqu’un qui me croit !  
    Une de mes vaches est un alien !  
    Je l’ai vue un soir orageux, en train de parler avec un talkie-walkie.  
    Avant que j’aie le temps de réaliser, je suis tombé dans les pommes.  
    À mon réveil, plus aucune vache se comportait bizarrement."
}
*[Une vache qui parle ? Ça a l’air cool] -> cool  
*[Lui poser une autre question] -> ferme_question

= cool
"Je suis convaincu que cette vache communiquait avec des aliens.  
Des êtres venus d’ailleurs qui essayent d’en apprendre un max sur les habitants de Yves-les-Flots.  
Pet.ite Jean est aussi sûr.e que moi d’avoir vu ces aliens.  
Mais iel croit qu’elle s’envolait dans une soucoupe volante.  

Je sais que personne me croit, mais je vous jure qu’un jour je prouverai l’existence de ces vaches !"  

*[Lui poser une autre question] -> ferme_question

= conclusion_ferme
~ visitedIsland +=1  
~ knowledgeF = true  
(Tu lui donnes le colis, il te remercie en abaissant son chapeau.  
Alors que tu pars, il te fait un signe de main.  
Tu remarques qu’une des vaches te regarde étrangement, mais tu as juste le temps de cligner des yeux qu’elle a déjà arrêté...)  

"Merci gamine pour les engrais, repasse manger, je te ferai un vrai repas, pas contaminé par vos ondes !"  

(Tu le remercies et tu t’en vas.)  

*[Retourner dans l’avion] -> vol


=== interlude ===
// Interlude - se déclenche après avoir visité deux îles
"De retour au hangar principal, Meli prend un moment pour souffler.
après avoir débarassé le matériel et le rangement.
le couché de soleil commence a pointer son nez, sur une chaise en plastique tu contemps le couché et les iles a l'horizon
La radio grésille doucement.
Meryl veut surement prendre des nouvelles, savoir comment tu vas"

* [Répondre à la radio] -> interlude_radio
* [L'ignorer et continuer sa mission] -> interlude_refused


= interlude_radio

"Ici Meryl. Comment ça se passe, Meli ? Les habitants ne sont pas trop difficiles ?"

* ["non ils sont géniaux pour l'instant"] -> les_habitants
* { knowledgeD == true and knowledgeF == true } [...Meryl...je peux en savoir plus sur l'histoire du syndicat ?] -> syndic
* { knowledgeF == true and knowledgeB == true } [ ...mais au juste c'est quoi le programme COLLAPS ? ] -> COLLAPS
{ knowledgeMB == false and knowledgeMBI and knowledgeMD == false and knowledgeMF == false:
    * ["J'ai encore du mal à comprendre ce qui se passe ici."] -> meryl_sermont
}
* [ conclure ] -> interlude_fin

= interlude_refused

~ interlude_finished = true

"Meli fait le choix d'ignorer l'appel et continuer sa mission elle n'as pas la tete a ça" -> vol

= syndic

( meryl rigole, elle a l'air de se moquer de toi )
Commetn tu as réusit a esquiver les formations obligatoire sur le syndicat ?
bref...hmm par ou commencé. Le syndicat des travailleur de COLLAPS ou S.T.C
fondé par Beryl et les ses camarades qui travaillais pour les usines gérant le COLLAPS
Leurs invention et la popularité au seins des habitants interdépendant de ces travails et leurs création.
On rendu le syndicat incontournable et puissant. ça a finit par culminer sur la guerre
Et l'histoire c'est écrite...euh attend laisse moi relire mes notes...
Le syndicat a été triomphant ! mais soucieux de la pax sur l'archipel
Ils ont accepté de négocier avec le PPN ! et se partager le pouvoir.
C'est presque comme on avais complétement gagner ! et maintenant on essaye de se consolider.

* [posez d'autre question ] -> interlude_radio
* [ il est temps de partir ] -> interlude_fin

= COLLAPS

( elle soupire, tu peux l'entendre chercher quelque chose, tu entend du papier froissé)
le programme COLLAPSE est née il y a 40 ans quand le PPN a et Mobulu ont pris le pouvoir ! 
Avant eue l'île étais Régis par l'ordre Defeline, une grande puissance étrangère.
Elle gérais les ressources de l'île d'une main de fer, et exploitais les habitants.
Elle est partit en ayant épuisé les ressources de l'archipel.
Mobulu promis de moderniser l'archipel, Gallia, de recontruire l'économie de l'archipel.
Mais c'est bien les travailleurs du S.T.C qui créerent ce que le système COLLAPS est aujourd'hui!
Un programme technologique innovant ! ça nous as donnée les tour, cet radio ! 
ET aussi la série des COLLAPS-40 la machine que tu utilises ! elle s'alimente et se recharge grâce au ondes! 
Et elle peut naviguer partout dans l'archipel en localisant les tours et leurs signes radio! 

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

( Meli ravalle sa salive, elle se souviens qu'elle a bu )
"...Disons que ils mon un peu envouté ce qui as ralentit un peu ma mission !
Mais ils mon demandé comment je m'étais retrouvé la, et je leurs aies dit la vérité.
Je leurs aies parlé de a rupture avec Melo.
que c'étais pour ça que j'avais rejoins le syndicat.
malgré leurs air de vieux aigri ils mon aidé.
c'est vrai que c'est un peu ridicule de se confier a des inconnus comme ça...
Mais je leurs remercie leurs mot mon beaucoup touché."

* [reparlez des habitants ] -> les_habitants
* [ posez d'autre question ] -> interlude_radio
* [ il est temps de partir ] -> interlude_fin

= amour

pet.ite jean est un peu renfermée sur soi-meme mais je lea comprend.
j'etais pas vraiment du genre sociable non plus, j'étais obsédé par la musique.
c'est comme ça que j'ai rencontré Melo d'ailleurs, maintenant que j'y penses...
Bref Pet.ite jean étais tout mims ! et iel a l'air très malin! 
Je suis sur qu'iel deviendra un.e grand.e scientifique du syndicat.
# ici elle reviens sur ce que pet.ite jean la raconté elle parle de son enfance

* [reparlez des habitants ] -> les_habitants
* [ posez d'autre question ] -> interlude_radio
* [ il est temps de partir ] -> interlude_fin

= boogie

( elle est soudainement excité a l'idée d'en parler ) 
Son disquaire étais pleins de CD dans tout les sens, c'était un vrai bazar musical !
Il a aussi un look de FOU je crois j'aimerai bien avoir ce look la moi aussi !
Mais il a l'air de vivre une vie de fou en détour-...en écoutant ces vieux CD ! 
Un chic types ! son carnets ma bien aidée d'ailleurs ! 
j'aimerai bien le revoir et rediscuter avec lui un jour !

* [reparlez des habitants ] -> les_habitants
* [ posez d'autre question ] -> interlude_radio
* [ il est temps de partir ] -> interlude_fin

= relation

( en repensant a l'histoire du vieux jean meli ressent un frissons)
Le vieux jean, étais pas si méchant que ça.
...Il est très hostile au Syndicat, mais c'est notre travail de le rassurer.
Quand tu lui as un peu gratter sa coquille il deviens vite sympa.
Il a l'air d'avoir beaucoup vécue aussi...
c'est rare de rencontrer des gens qui ont vécues avant leurs guerres civiles.
je crois avoir vu quelque chose aussi...non laisse tomber.
* [reparlez des habitants ] -> les_habitants
* [ posez d'autre question ] -> interlude_radio
* [ il est temps de partir ] -> interlude_fin

= meryl_sermont

( tu réalises que ne pas lire du tout le manuel aide surement pas...)

"Je me doutais quand on c'est parlais tout a l'heure que avais l'air dissipé !
T'es trop tete en l'air ! tu devrais prendre cet tâches plus au sérieux !
des vies en dépends ! et c'est la réputation du syndicat qui est en jeux !
Au lieux de te prendre pour une animatrice radio, concentre-toi sur ta mission !"
( meryl marque un temps d'arret, elle a l'air de flairer quelque chose )
" Meli...ça fait longtemps on se connais.
Je sais que tu vis une période difficile...si ça peut t'aider.
On peut en discuter ensemble ?"

* [ ...j'ai un mal de coeur...métaphorique ] -> coeur
* [ je suis un peu mélancolique ] -> nostalgie 
* [reparlez des habitants ] -> les_habitants
* [ posez d'autre question ] -> interlude_radio
* [ il est temps de partir ] -> interlude_fin

= coeur

( une boule occupe occupe le coeur de Meli, elle se sent stupide )
"...Je repense a Melo. ça fait déjà 4 ans mais je pense encore a elle.
Je suis parti car la croiser et devoir l'ignorer me rendais triste.
je peux meme pas me trouver de pretexte je suis la responsable de cet rupture...
J'ai essayer a un moment de lui reparler, elle ne m'en veut pas mais je n'ai pas su quoi lui dire.
J'étais plus aussi drole qu'avant..."
( Meli marque un temps d'arret, elle fixe l'horizon , le couchée de soleil et reprend )
"...Je me sens tellement stupide.
J'ai été égoiste, et auto-centrée, je lui ai tout reproché.
j'étais immature...des fois je me demande si je retomberai amoureuse.
c'est comme si je m'étais déchiré le coeur toute seule.
...je crois que ça ira, désolé pour le manque de concentration...
mais cet mission m'aide beaucoup ! je veux aider mon prochain.
c'est ma manière de continuer a aimer."
( Meli esquisse un sourire triste )
* [reparlez des habitants ] -> les_habitants
* [ posez d'autre question ] -> interlude_radio
* [ il est temps de partir ] -> interlude_fin

= nostalgie

( Meli fixe l'horizon et le coucher de soleil, elle repense a tout ces voyages.)
" devenir pilote pour le S.T.C ma amenée a quitté mon coin de l'archipel. 
j'arrives toujours pas a croire que Yves les flots est la dernière mission avant que je rendent les gants.
C'est un peu comme si je fermais un chapitre de ma vie."
( elle repense soudainement aux habitants rencontré, les paysage, les sons de chaque lieu)
"...J'oublierai jamais les gens que j'ai rencontrés...ET ça me rend nostalgique ! 
Je pense que quand j'aurais un peu vécue une autre vie, peut-etre que je reprendrais les clées des moteur !
le COLLAPS-40 et son moteur inssuportable vont me manquer.
j'ai appris a aimer cet machine comme un vrai proche."
( Meli esquisse un sourire et petit rire mélancolique)
* [reparlez des habitants ] -> les_habitants
* [ posez d'autre question ] -> interlude_radio
* [ il est temps de partir ] -> interlude_fin


= interlude_fin

"Fais attention à toi. Ces gens ont leurs histoires, leurs blessures... 
Rappelle-toi qu'on est juste là pour livrer des colis, pas pour s'immiscer dans leurs affaires."

"Bon, je te laisse reprendre ta mission. Fin de communication."

* [Retourner à l'avion] -> vol



=== final_ending ===

#test
-> END