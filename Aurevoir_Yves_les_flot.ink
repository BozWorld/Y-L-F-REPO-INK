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
"C’était la dernière livraison. Il est temps de rentrer... une dernière fois.
le ciel est particulièrement silencieux, on n'entend que le bruit des vagues."
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
"Ici Meryl. Mission accomplie, Meli.
Tu peux rentrer maintenant ! 
Merci pour ton coup de main j'espère que les habitants sont satisfait ! 
Ramène l'avion au hangar et demain c'est repartie pour la capitale !
... Je dois te dire merci, c'étais surement la dernière livraison avant que la montée des eaux...
prenne les reste de Yves les flots.
Tout les habitants en son conscient, mais on beaucoup de fierté, leurs répatriement a déjà été planifié.
"

* [Continuer] -> final_conclusion
* [laissez un dernier message] -> last_message

= final_silence
Meryl va surement lui en vouloir mais Meli préfère profiter de l'instant.
Elle repense au habitant de yves les flots. 
C'est île est condamné quoi qu'il arrive, on ne peut rien contre la montée des eaux.
et meme si on pouvais c'est trop tard.
Mais les habitons eue reste, raconte leurs histoire.
Peut etre que pour le petit coeur brisé de Meli ça ira aussi malgré la montée des eaux.

* [Continuer] -> final_conclusion

= last_message
" 1, 2, 1, 2... ICI MELI !
A TOUT LES HABITANTS DE YVES-LES FLOTS !
C'ÉTAIS LES SERVICES DE MELI-AIRLINE ! 
MEME SI MA MISSION EST TERMINEE ! N'HESITÉ PAS A DEMANDER MES SERVICES POUR VOS PROCHAIN VOYAGE !
ET N'OUBLIEZ PAS LE CIEL EST A VOUS ! "

* [Continuer] -> final_conclusion

-> END

= final_conclusion
( quelque mois plus tard )

Meli cours répondre a l'appel de la radio, ça doit être Meryl, c'étais surement ça les étrange bruit dans ses rêves.

"...MELI ! tu répond enfin je t'appelle depuis des heures ! 
j'ai une bonne nouvelles pour toi !!! tu te souviens le Pet.ite Jean que tu avais rencontré avant l'innondation ?
Il est devenue ingénieur sur COLLAPS-50 ! passe le féliciter a l'occasion !
et prépare toi pour ta prochaine mission... Tu quittes l'archipel"

"Merci d'avoir joué a aurevoir Yves les flots."

* [ fin ] -> bye_bye

= bye_bye

L'eau continua de monté sur yves les flots.
Une rumeur cours, que depuis les îles alentour on peut capter une radio pirate.
Passant les sonorité les plus insolite de l'archipel, et partageant les récits les plus loufoques.
tenu par 2 étrange personnage, le docteur Boogie-love et sa mystérieuse acolytes.
Certain raconte que c'est l'âme meme de ce que fut Yves les flots qui s'exprime au travers de cette radio.
Quoi qu'il en soit, il restera de Yves les flot ces gens, et ce qu'il raconteront de leurs vie.

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

Hello, routeur du ciel !!  
Ce manuel est **spécial**, conçu par mes soins pour les besoins des habitants de l’île !  
(Enfin... les 3 résidents officiels. Y a même une quatrième page pour un presque-résident ? 👀)

* [Lire la description de Boogie-Love] -> boogie
* [Lire la description de Pet.ite Jean] -> petite_jean
* [Lire la description du Vieux Jean] -> vieux_jean
* [Lire la description de Karim et Huguette] -> karim_huguette
* [Décoller] -> vol

= boogie
~ knowledgeMF = true

INFORMATION RÉSIDENT : Docteur Boogie-Love est un excentrique... c’est moi !  
Hehehe. J’espère t’avoir surpris·e.  
Je suis fan de musique et j’ai toujours une histoire mystérieuse à raconter !

INFORMATION LIEU : J’habite sur l’île la plus cool.  
Y a des disques partout et une enseigne géante en forme de disque (pas celle en coquille Saint-Jacques — l’autre !).  
C’est là que je tiens mon disquaire "**CRAZY-LOVE**". Des sons comme t’en as jamais entendu !

COLIS À LIVRER : Le colis scellé par le Syndicat, c’est pour moi. Apporte-le, et je te satisferai ta curiosité...

* [Lire la description de Pet.ite Jean] -> petite_jean
* [Lire la description du Vieux Jean] -> vieux_jean
* [Lire la description de Karim et Huguette] -> karim_huguette
* [Décoller] -> vol

= petite_jean
~ knowledgeMB = true

INFORMATION RÉSIDENT : Pet.ite Jean n’est pas résident·e permanent·e.  
Iel vient souvent voir son grand-père (le Vieux Jean).  
Introverti·e, bricoleur·euse, iel a du potentiel. Toujours en train de bidouiller des trucs !

INFORMATION LIEU : Un îlot entouré d’arbres et de matos technique... ah, et un tank !  
Pet.ite Jean y a installé sa cabane.  
Attention : avant, c’était une zone minée... mais iel est encore là, donc ça devrait aller pour toi !

COLIS À LIVRER : (À NE PAS COMMUNIQUER AU SYNDICAT) C’est moi qui le commande pour iel.  
C’est du matos de soudure et d’électronique. Iel est malin·igne : laisse-iel bricoler !

* [Lire la description de Boogie-Love] -> boogie
* [Lire la description du Vieux Jean] -> vieux_jean
* [Lire la description de Karim et Huguette] -> karim_huguette
* [Décoller] -> vol

= vieux_jean
~ knowledgeMF = true

INFORMATION RÉSIDENT : Le plus old-school du coin.  
Aujourd’hui, des vieux aigris comme lui, on en voit plus beaucoup.  
Il tient une ferme, râle tout le temps, mais il est pas méchant. C’est le grand-père de Pet.ite Jean.  
Ses vaches ? Sujet sensible... tu verras !

INFORMATION LIEU : Une île classique : un champ, une ferme, du bétail, un moulin. Simple et rustique.

COLIS À LIVRER : Une lettre de sa fille et un peu d’engrais. Rien d’extraordinaire, mais ça compte.

* [Lire la description de Boogie-Love] -> boogie
* [Lire la description de Pet.ite Jean] -> petite_jean
* [Lire la description de Karim et Huguette] -> karim_huguette
* [Décoller] -> vol

= karim_huguette
~ knowledgeMD = true

INFORMATION RÉSIDENT : Deux anciens soldats.  
Ils vivaient ici avant l’inondation, mais sont partis faire la guerre contre l’ancien régime.  
Ils en sont revenus changés... et probablement bien éméchés 😅

INFORMATION LIEU : Le bistrot "**La Gamberge**". Impossible de le rater :  
y a des chaises et des tables dehors...  
et surtout des drapeaux du Syndicat partout ! Ces gars-là sont convaincus !  
Va boire un coup avec eux.

COLIS À LIVRER : Une lettre et une caisse d’alcool. Les classiques du réconfort.

* [Lire la description de Boogie-Love] -> boogie
* [Lire la description de Pet.ite Jean] -> petite_jean
* [Lire la description du Vieux Jean] -> vieux_jean
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
Il est écrit "CRAZY LOVING PLACE".)  
(Il y a plein de cartons devant la boutique.  
Depuis l'intérieur, une musique très forte résonne.  
Un homme à la coupe étrange et à la dégaine théâtrale sort de la boutique avec un grand sourire.  
Prenant une pause excentrique, il te salue d’un grand geste de la main :)  

"BIENVENUE, ROUTEUSE DES CIEUX !! BIENVENUE DANS MON ANTRE !!!  
J’ESPÈRE QUE TU Y TROUVERAS L’AMOUR DU SON, YO !!"

-> disquaire_question

= disquaire_question
Tu as des colis à livrer et des missions à remplir.  
Pas sûr qu’il faille trop traîner ici…

* {knowledgeMD == false} [...ça c’est de l’introduction] -> intro
* {knowledgeMD == true} [...ça serait pas vous, le manuel ?] -> intro
* [Vous n’avez pas vraiment l’air d’un docteur] -> docteur
* [Vous n’avez pas peur de vous bousiller les oreilles ?] -> peur
* [Vous en avez des cartons] -> carton
* [Lui donner son colis] -> conclusion_disquaire

= intro
{knowledgeMD == false:
    "Yes, YES, YES ! C’est moi, Docteur CRAZY-LOVE !  
    Je suis un peu pris actuellement, j’expérimente de nouvelles ondes !!!  
    Mais j’apprécie que tu aies pris le temps de feuilleter mon manuel, YO !  
    Ça fait un bail qu’on n’a pas vu quelqu’un de ton genre ici.  
    Faut dire qu’il reste pas grand monde de branché dans le coin…  
    MAIS ÇA M’A LAISSÉ LE TEMPS DE BIDOUILLER LE COLLAPS-40, YO !"
- else:
    (Il se met à danser sur le rythme de la musique avant de la couper brutalement.)  
    "Désolé, aviatrice ! J’étais encore en train de tester de nouvelles ondes !!  
    Mais j’apprécie ton bon goût.  
    Ça faisait longtemps qu’on n’avait pas vu un vrai membre du Syndicat ici !  
    La dernière fois qu’on a eu du courrier, c’était pour déposer Pet.ite Jean chez son grand-père.  
    Mais bon, ça m’a laissé le temps de bien préparer le COLLAPS-40, YO !"
}

* [Vous entretenez COLLAPS-40 ?!] -> docteur_robot
* [Lui poser une autre question] -> disquaire_question

= docteur_robot
"Et oui, c’est moi, chère aviatrice !  
Je suis celui qui entretient le COLLAPS-40.  
Bien que je ne sois pas son inventeur, j’ai beaucoup côtoyé son inventrice… hmmm, émotion !  
Aujourd’hui, j’entretiens la radio et l’avion."  

(Il rigole un coup.)  
"Elle m’a fait tomber amoureux du son et des ondes… On a vécu une belle histoire d’amour.  
Depuis, je ne les ai jamais quittés.  
Cette radio est ma meilleure amie ici."

* [Merci pour le travail, il est flambant neuf !] -> neuf
* [Lui poser une autre question] -> disquaire_question

= neuf
(Il esquisse un sourire mélancolique.)  

"Merci, ça me touche.  
Ça me tient à cœur, son inventrice y tenait tellement."  

(Il marque un temps d’arrêt, son ton se brise.)  
"Elle y croyait plus que tout. On a travaillé ensemble à le construire.  
Elle était l’ingénieure principale.  
Elle voyait dans ce projet un avenir meilleur pour l’archipel.  
Elle rêvait d’un monde où les ondes seraient partout, où chacun pourrait transmettre librement ses pensées, rencontrer des gens d’ailleurs."  

(Il rigole doucement.)  
"Pet.ite Jean a toutes les chances de réaliser ce rêve !"

* [...J’imagine qu’elle n’est plus là ?] -> mort
* [Lui poser une autre question] -> disquaire_question

= mort 
"Oui, elle est morte d’une grave maladie.  
Avec nos moyens de l’époque, on n’a pas pu la sauver.  

Le colis que tu m’apportes contient ses notes sur le COLLAPS-30.  
Je les avais déjà lues quand on bossait ensemble.  
Elle s’appelait **Elisabeth Van-Kerk**.  

Ces notes sont restées cachées longtemps, par peur d’espionnage du PPN, le parti au pouvoir.  
Bref… ton destrier est la plus belle preuve de son empreinte sur ce monde."

* [Lui poser une autre question] -> disquaire_question

= docteur
"NON, PAS EXACTEMENT !"  

(Il se met à tousser — crier autant, à son âge, ça laisse des traces.)  

"En vérité, je suis un fan de musique excentrique, hahaha !  
Je décortique les sons et les ondes pour comprendre ce qu’ils cachent, comment les soigner, les entretenir.  
Je m’occupe aussi de la tour radio de Yves-les-Flots, vu que le S.T.C. passe rarement par ici…  
SOIT LA MAJORITÉ DU TEMPS, HAHAHA !  

JE SUIS UN DOCTEUR DU SON, DE L’ONDE !"

* [OH mais c’est vous, le manuel !] -> revelation
* [Lui poser une autre question] -> disquaire_question

= revelation
"Hahaha, et oui !  
Je le mets même régulièrement à jour, notamment pour les commandes pirates de Pet.ite Jean.  
J’entretiens aussi la tour du coin.  

COMME UNE PIRATE DES TEMPS MODERNES… UN PIRATE DES ONDES, TU VOIS ?  
(Il rigole, puis tousse à nouveau. Crier tout le temps ne lui réussit pas.)  
Et c’est le seul son qui vaille ici !"

* [Ça me paraît peu légal, ce que vous faites] -> cops
* [Lui poser une autre question] -> disquaire_question

= cops
"QUI POURRAIT M’ARRÊTER ? JE SUIS TOUT-PUISSANT SUR CES TERRES !  
L’île a été abandonnée par le Syndicat et le gouvernement quand l’inondation a commencé.  
Ils pensaient pas que trois habitants lutteraient autant pour rester ici.  

C’ÉTAIT SANS COMPTER L’AMOUR UNIQUE QUI LIE LES CŒURS MORCELÉS DE YVES-LES-FLOTS !  

(Il tousse encore, mais rigole cette fois.)  
Pas mal celle-là, je devrais la noter, hahaha !  

Ils ont juste mis en place une mission de bénévolat périodique pour nous livrer des colis.  
Mais les lois… ici, elles n’existent plus vraiment.  
Ni toi, ni eux n’avez intérêt à embarquer un vieux fou et un·e gamin·e un peu étrange."

* [C’est pas faux, mais pourquoi vous faites ça ?] -> passion
* [Lui poser une autre question] -> disquaire_question


= passion
(Il esquisse un sourire et se rapproche de toi, prenant une pose dramatique.)  

"Tout simplement parce que j’aime ce son plus que tout.  
J’ai perdu des choses chères dans ma vie… mais il me reste les ondes.  
Elles ne m’ont jamais trahi.  

Je voulais un endroit où les expérimenter librement.  
Et puis… aider les derniers habitants de Yves-les-Flots, ça me donne une raison de rester.  

Le·a gamin·e a du potentiel. Tu verras."

* [Lui poser une autre question] -> disquaire_question

= peur
(Il éclate de rire, puis prend une pose théâtrale.)  

"OH ! SWEETHEART, OUI, JE SAIS QUE C’EST DANGEREUX !  
MA QUÊTE DU SON N’EST PAS SANS RISQUE !  
SI MES OREILLES DOIVENT ÊTRE SACRIFIÉES SUR L’AUTEL DU BRUIT, AINSI SOIT-IL, YO !"  

(Il rigole encore, puis laisse tomber un instant son masque excentrique.)  
"Le silence… il me terrifie.  
Dans un coin comme celui-là, il y en a partout.  
Alors je remplis ce vide. Le son est la seule chose qui me tient encore compagnie."

* [Dit comme ça, c’est un peu triste] -> tristesse
* [Lui poser une autre question] -> disquaire_question

= tristesse
(Il sourit, cette fois sans crier.)  

"Évidemment qu’il y a de la tristesse là-dedans.  
Cette île a été noyée par la guerre avant de l’être par l’eau.  
Les bombardements, les cris, les pleurs… tout ça forme une mélodie que j’entends encore.  
Et puis, après, venait toujours le silence… lourd, étouffant."  

(Il marque un temps d’arrêt, puis fixe Meli avec sérieux.)  
"Mais toi, gamine, tu connais l’histoire de l’archipel ?  
Je parle pas que d’Yves-les-Flots, mais de Gallia en entier.  
Le PPN, tu en as entendu parler ?"

* [Avec plaisir !] -> histoire
* [Lui poser une autre question] -> disquaire_question

= histoire
"Gallia, c’était un archipel colonial.  
L’empire DeFeline régnait, installé bien loin d’ici.  
Ils ont fini par se retirer quand les ressources ont commencé à manquer.  

Le **PPN**, le Parti pour la Nation, né à l’époque coloniale, avait poussé à leur départ.  
Après la guerre contre DeFeline, ce sont eux qui ont pris le pouvoir."

* [Et la vie sous le PPN, c’était comment ?] -> PPN
* [Lui poser une autre question] -> disquaire_question

= PPN
(Boogie-Love marque un temps d’arrêt, surpris par ton intérêt.)  

"Gallia était très pauvre après le départ de DeFeline.  
Le PPN a promis de moderniser l’archipel, de le rendre autonome.  
Ils ont lancé le programme COLLAPS pour relier les îles entre elles.  

Mais en parallèle, ils ont imposé des lois autoritaires.  
Toute contestation était réprimée.  

(Il ricane.)  
"Sous le PPN — et encore plus sous DeFeline — un endroit comme Yves-les-Flots n’aurait jamais pu exister."

* [Et c’est là que le Syndicat entre en scène ?] -> syndicat
* [Lui poser une autre question] -> disquaire_question

= syndicat
"Exactement, tu comprends vite.  

Le Syndicat est né avec l’industrialisation.  
Des ouvriers, des ingénieurs, des scientifiques qui voulaient une organisation plus juste.  

En réalité, il s’est formé presque spontanément : le PPN perdait le contrôle,  
tandis que les avancées techniques de COLLAPS ouvraient de nouvelles possibilités."

* [Et c’est là que ça a dérapé ?] -> tension
* [Lui poser une autre question] -> disquaire_question

= tension
"...Les tensions étaient permanentes entre le PPN et le Syndicat.  
Toujours en opposition, toujours à se défier.  

Ça s’est aggravé quand le PPN a recommencé à traiter avec l’ordre DeFeline.  
Le programme COLLAPS les intéressait trop — et les ressources nécessaires pour le développer encore plus."  

* [COLLAPS a changé l’archipel !] -> COLLAPS
* [Lui poser une autre question] -> disquaire_question

= COLLAPS
(Meli n’a pas tout suivi de l’histoire, mais elle connaît bien le mythe de COLLAPS.)  

"C’est vrai : COLLAPS a changé l’archipel.  

Il a permis aux îles de sortir de la misère,  
d’apaiser les tensions ethniques,  
de créer une interdépendance économique.  

La redistribution des ressources était vitale à notre survie.  
Au début, c’était la fierté du Syndicat. Leur raison d’exister."  

* [Mais ça n’a pas duré.] -> guerre
* [Lui poser une autre question] -> disquaire_question

= guerre
(Boogie-Love ferme les yeux un instant, happé par ses souvenirs.)  

"Oui… puis la guerre civile a éclaté.  

Le PPN, aidé de DeFeline, a lancé une violente répression.  
Le Syndicat a été déclaré organisation terroriste.  

Le moment charnière ?  
Quand le PPN a fait exploser un COLLAPS-30 en plein vol…  
Tous les passagers sont morts."  

(Sa voix se durcit.)  
"Alors le Syndicat s’est rapproché des résistants.  
Et le **PPC**, le Parti pour COLLAPS, est né."

* [Et là, le conflit est devenu global ?] -> PPC

= PPC
(Boogie-Love ouvre grand les yeux, surpris que tu connaisses autant de choses.)  

"Oui. Le PPC était né du feu révolutionnaire.  
Ouvriers, paysans, anciens du Syndicat…  
Tous voulaient renverser le PPN et mettre fin à DeFeline.  

Mais après des années de guerre, le conflit s’enlisait.  
Et la violence s’est exportée jusqu’à Marinette, la capitale de DeFeline.  
Émeutes, grèves, sabotages, assassinats… tout l’empire tremblait.  

Finalement, DeFeline a décidé de se retirer de Gallia.  
Laissant le PPN seul face au Syndicat."

* [Et c’est là que le Syndicat a gagné ?] -> victoire

= victoire
(Boogie-Love sourit amèrement.)  

"Le PPN n’avait plus le choix : ils ont négocié.  

Un partage.  
Le PPN garde la capitale et ses ressources.  
Le Syndicat prend le reste de l’archipel : les tours radio et le programme COLLAPS.  

Politiquement, le PPN dirige encore…  
mais le Syndicat contrôle le travail et la communication.  

Le **PPC** est devenu sa façade démocratique.  
Le **S.T.C.**, son bras armé.  

Aujourd’hui, le Syndicat est l’organisation la plus puissante de Gallia.  
C’est grâce à eux que tu voles dans les cieux…  
et que nous pouvons encore vivre ici, à Yves-les-Flots."

* [Lui poser une autre question] -> disquaire_question

= carton
(Boogie-Love esquisse un sourire de fierté.)  

"TOUS CES CARTONS, C’EST MA VIE, YO ! MES SOUVENIRS, MES ORGUES, MES RELIQUES !  
JE GARDE TOUT ÇA COMME UN TRÉSOR !  

Dans ma jeunesse, j’ai voyagé dans tout l’archipel.  
Je récupérais vinyles et bizarreries partout où je passais.  
Ce magasin n’est même pas assez grand pour tout contenir !"  

(Il rigole à pleins poumons.)  
"J’ai eu la chance de voyager avec les ingénieurs du Syndicat.  
Et le colis que tu m’apportes aujourd’hui… est l’un des plus importants."

* [...Je peux savoir ce qu’il contient ?] -> verite
* [Lui poser une autre question] -> disquaire_question

= verite
"Je t’expliquerai la nature exacte de ce colis…  
à condition que tu me donnes un souvenir en échange.  

Quelque chose qui compte pour toi.  
Et dis-moi pourquoi.  
Alors je t’offrirai ma vérité."

* [Lui donner un souvenir] -> souvenir
* [Lui poser une autre question] -> disquaire_question

= souvenir
(Après une hésitation, Meli sort un CD de l’avion.)  

"...Ajoutez ça à votre collection.  
C’est une compilation de musiques que j’avais faite pour… une amie.  
Mais la garder avec moi, ça me fait souffrir.  
Je veux passer à autre chose.  
Avec vous, ce souvenir sera en sécurité."  

* [Écouter son histoire] -> aurevoir
* [Lui poser une autre question] -> disquaire_question

= aurevoir
(Boogie-Love accepte le CD. Sa voix devient douce, presque fragile.)  

"C’est le carnet de ma femme, **Éléone Van-Kerk**.  
L’inventrice du protocole COLLAPS.  

C’est grâce à elle que le Syndicat a pu gagner en indépendance.  
Un protocole simple, reliant les îles.  

Elle est morte pendant une répression du PPN.  
Elle était… la femme de ma vie.  

Ce carnet contient ses notes.  
Le Syndicat l’avait gardé secret, par peur d’espionnage.  
Mais elle me l’avait légué.  

Relire ces pages…  
c’est comme si elle était encore là.  
C’est le plus beau souvenir que j’aurai jamais d’elle."  

(Il rit doucement, sans excès. Le masque tombe : il est sincère, mais pas triste.)

* [Lui poser une autre question] -> disquaire_question

= conclusion_disquaire
~ visitedIsland +=1 
~ knowledgeD = true
(Tu lui remets son colis.)  

"Meli, c’est ton nom, pas vrai ?  
Si jamais tu ne sais plus quoi faire de ta vie…  
reviens me voir.  
Je t’apprendrai à jouer avec les ondes.  

Je suis sûr que ça te plairait."  

(Tu le remercies et retournes à ton avion.)  

* [Retourner dans l’avion] -> vol


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
Après avoir débarassé le matériel et rangé ses affaires,  
elle s’affale sur une chaise en plastique.  

Le soleil se couche à l’horizon, teintant les îles d’une lueur dorée.  
La radio grésille doucement.  
Meryl veut sûrement prendre des nouvelles, savoir comment tu vas."

* [Répondre à la radio] -> interlude_radio
* [L’ignorer et continuer sa mission] -> interlude_refused


= interlude_radio
"Ici Meryl. Comment ça se passe, Meli ? Les habitants ne sont pas trop difficiles ?"

* ["Non, ils sont géniaux pour l’instant."] -> les_habitants
* { knowledgeD == true and knowledgeF == true } [...Meryl... je peux en savoir plus sur l’histoire du Syndicat ?] -> syndic
* { knowledgeF == true and knowledgeB == true } [...Mais au juste, c’est quoi le programme COLLAPS ?] -> COLLAPS
{ knowledgeMB == false and knowledgeMBI and knowledgeMD == false and knowledgeMF == false:
    * ["J’ai encore du mal à comprendre ce qui se passe ici."] -> meryl_sermont
}
* [Conclure] -> interlude_fin


= interlude_refused
~ interlude_finished = true

"Meli choisit d’ignorer l’appel et reprend sa mission.  
Elle n’a pas la tête à ça." -> vol


= syndic
(Meryl rigole doucement, un peu moqueuse.)  
"Comment t’as réussi à esquiver les formations obligatoires sur le Syndicat ?  
Bon… je résume.  

Le Syndicat des Travailleurs de COLLAPS, ou S.T.C., a été fondé par Beryl et ses camarades,  
qui bossaient dans les usines liées à COLLAPS.  
Leurs inventions et la popularité qu’elles ont eue auprès des habitants ont rendu le Syndicat incontournable.  
Ça a fini par mener à la guerre.  

Et l’histoire s’est écrite… enfin attends, je relis mes notes…  
Bref ! Le Syndicat a triomphé. Mais pour garantir la paix sur l’archipel,  
ils ont accepté de négocier avec le PPN et de partager le pouvoir.  
C’est presque comme si on avait complètement gagné !  
Maintenant, on essaye de consolider tout ça."

* [Poser d’autres questions] -> interlude_radio
* [Il est temps de partir] -> interlude_fin


= COLLAPS
(Tu entends Meryl soupirer, puis des feuilles qu’on remue.)  
"Le programme **COLLAPS** est né il y a quarante ans,  
quand le PPN et Mobulu ont pris le pouvoir.  

Avant ça, l’archipel était dirigé par l’ordre DeFeline, une grande puissance étrangère.  
Ils exploitaient les habitants et épuisaient les ressources.  
Quand ils sont partis, Gallia était exsangue.  

Mobulu a promis de reconstruire l’économie.  
Mais en vérité, ce sont les travailleurs du S.T.C. qui ont créé le système COLLAPS tel qu’on le connaît.  

Un programme technologique révolutionnaire :  
les tours, la radio, et même la série des COLLAPS-40.  
La machine que tu pilotes fonctionne grâce aux ondes,  
elle se recharge toute seule et peut naviguer en localisant les signaux radio de l’archipel !"  

* [Poser d’autres questions] -> interlude_radio
* [Il est temps de partir] -> interlude_fin


= les_habitants
"Ceux que j’ai rencontrés avaient beaucoup à dire.  
À vrai dire… je crois que je m’attache à eux.  
Et c’est sûrement réciproque, vu que je suis, évidemment, géniale."  

{knowledgeBI == true} ... "Bon, j’avoue, j’ai un peu craqué avec Huguette et Karim. Pas très pro, mais ils savent mettre en confiance… et au final, la rupture est plus sensible que je l’imaginais."  
{knowledgeB == true} ... "Pet.ite Jean est vraiment attachant·e. Je comprends pas toujours ce qu’iel raconte, mais iel m’impressionne. Bon, ses histoires de nous remplacer font un peu peur, mais faut bien croire en l’avenir."  
{knowledgeD == true} ... "Boogie-Love est carrément mon idole. Si l’archipel n’était pas en train de couler, je crois que je l’aiderais volontiers à étendre sa radio pira–… euh, à tenir son disquaire."  
{knowledgeF == true} ... "Moi, j’adore ce genre de petits vieux. Je comprends son ressentiment. Sa relation avec son petit-fils m’a beaucoup touchée. C’est pour eux que je veux faire cette mission."  

*{knowledgeBI == true} [Raconter le craquage à Meryl] -> craquage
*{knowledgeB == true} [Tout mon amour pour Pet.ite Jean] -> amour
*{knowledgeD == true} [Parler de Boogie-Love] -> boogie
*{knowledgeF == true} [Parler de sa relation avec son petit-fils] -> relation
* [Conclure] -> interlude_fin


= craquage
(Meli ravale sa salive, un peu honteuse.)  
"...Disons qu’ils m’ont un peu envoûtée, ça a ralenti ma mission.  
Ils m’ont demandé pourquoi j’étais là… et je leur ai dit la vérité.  

Je leur ai parlé de ma rupture avec Melo.  
Que c’était pour ça que j’avais rejoint le Syndicat.  
Malgré leur air de vieux aigris, ils m’ont vraiment aidée.  

C’est un peu ridicule de se confier à des inconnus…  
Mais leurs mots m’ont beaucoup touchée. Je leur en suis reconnaissante."  

* [Reparler des habitants] -> les_habitants
* [Poser d’autres questions] -> interlude_radio
* [Il est temps de partir] -> interlude_fin


= amour
"Pet.ite Jean est un peu renfermé·e… mais je le·a comprends.  
J’étais pas sociable non plus, j’étais obsédée par la musique.  
C’est comme ça que j’ai rencontré Melo, d’ailleurs…  

Bref ! Pet.ite Jean est trop mims.  
Et iel est super malin·igne. Je suis sûre qu’iel deviendra un·e grand·e scientifique du Syndicat."  

# Ici, Meli peut revenir sur ce que Pet.ite Jean lui a raconté de son enfance.

* [Reparler des habitants] -> les_habitants
* [Poser d’autres questions] -> interlude_radio
* [Il est temps de partir] -> interlude_fin


= boogie
(Meli s’anime d’un coup, excitée rien qu’à l’idée d’en parler.)  
"Son disquaire, c’était le bazar complet, des CD partout !  
Son look ? Un vrai délire. Je crois que j’aimerais avoir le même style un jour !  

Mais derrière son excentricité, il vit une vie incroyable…  
et son carnet m’a beaucoup aidée.  
Franchement, j’aimerais bien le revoir pour discuter encore avec lui."  

* [Reparler des habitants] -> les_habitants
* [Poser d’autres questions] -> interlude_radio
* [Il est temps de partir] -> interlude_fin


= relation
(En repensant à l’histoire du Vieux Jean, Meli frissonne un peu.)  
"Le Vieux Jean n’était pas si méchant que ça.  
Il est hostile au Syndicat, mais c’est normal qu’il soit méfiant.  
Une fois qu’on gratte un peu, il devient vite sympa.  

Il a beaucoup vécu… c’est rare de croiser des gens qui ont connu la vie avant la guerre civile.  
Je crois avoir aperçu quelque chose de plus… mais laisse tomber."  

* [Reparler des habitants] -> les_habitants
* [Poser d’autres questions] -> interlude_radio
* [Il est temps de partir] -> interlude_fin


= meryl_sermont
(Tu réalises que ne pas lire le manuel aide pas beaucoup…)  

"Je le savais ! Quand on s’est parlé tout à l’heure, t’avais déjà l’air ailleurs.  
T’es trop tête en l’air, Meli !  
Tu devrais prendre cette mission plus au sérieux : des vies en dépendent.  
Et c’est la réputation du Syndicat qui est en jeu !  

Au lieu de te prendre pour une animatrice radio, concentre-toi sur ta mission !"  

(Meryl marque un silence, puis sa voix devient plus douce.)  
"...Meli. Ça fait longtemps qu’on se connaît.  
Je sais que tu traverses une période difficile.  
Si ça peut t’aider, on peut en parler."  

* [...J’ai un mal de cœur… métaphorique.] -> coeur
* [Je suis un peu mélancolique.] -> nostalgie
* [Reparler des habitants] -> les_habitants
* [Poser d’autres questions] -> interlude_radio
* [Il est temps de partir] -> interlude_fin


= coeur
(Une boule serre la poitrine de Meli, elle se sent stupide.)  
"...Je repense à Melo. Ça fait déjà quatre ans, mais je pense encore à elle.  

Je suis partie parce que la croiser me rendait trop triste.  
Et je suis responsable de la rupture.  

J’ai essayé de lui reparler une fois.  
Elle ne m’en voulait pas… mais je savais plus quoi dire.  
J’étais plus drôle, plus légère comme avant.  

Je me sens tellement idiote.  
J’ai été égoïste, immature.  
Parfois je me demande si je retomberai amoureuse un jour.  
C’est comme si j’avais moi-même arraché mon cœur.  

...Mais je crois que ça ira. Désolée pour le manque de concentration.  
Cette mission m’aide beaucoup.  
C’est ma manière de continuer à aimer."  

(Meli esquisse un sourire triste.)  

* [Reparler des habitants] -> les_habitants
* [Poser d’autres questions] -> interlude_radio
* [Il est temps de partir] -> interlude_fin


= nostalgie
(Meli fixe l’horizon. Le coucher de soleil lui ramène plein de souvenirs.)  

"Devenir pilote pour le S.T.C. m’a fait quitter mon coin de l’archipel.  
J’arrive pas à croire qu’Yves-les-Flots soit ma dernière mission avant de raccrocher.  

C’est comme si je fermais un chapitre de ma vie."  

(Elle pense aux habitants rencontrés, aux paysages, aux sons de chaque île.)  
"...Je n’oublierai jamais tout ça. Ça me rend nostalgique.  

Je pense que quand j’aurai un peu vécu autre chose, peut-être que je reprendrai les clés du moteur.  
Le COLLAPS-40 et son bruit insupportable vont me manquer.  
Je l’ai apprivoisé comme un vrai compagnon de route."  

(Meli sourit avec une pointe de mélancolie.)  

* [Reparler des habitants] -> les_habitants
* [Poser d’autres questions] -> interlude_radio
* [Il est temps de partir] -> interlude_fin


= interlude_fin
"Fais attention à toi, Meli.  
Ces gens ont leurs histoires, leurs blessures…  
N’oublie pas qu’on est là pour livrer des colis, pas pour t’immiscer dans leurs vies."  

"Bon, je te laisse reprendre ta mission. Fin de communication."  

* [Retourner à l’avion] -> vol


=== final_ending ===

#test
-> END