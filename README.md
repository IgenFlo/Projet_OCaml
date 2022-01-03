# Projet_OCaml

## Baptiste MARTY & Florian EHR

L'algorithme de Ford_Fulkerson a fonctionné sur plusieurs exemples, il renvoie le graphe de flots avec sur chaque arc le flot et la capacité

Nous avons choisi de construire un graphe biparti pour illustrer une situation où des personnes doivent être réparties chez des hôtes. Le fichier d'entrée décrit les noeuds dont l'identifiant détermine si c'est une personne où un hôte :
 - si 0 < id < 50 : c'est une personne
 - si 50 <= id < 100 : c'est un hôte
et les arcs (de capacité 1) se dirigent des personnes vers les possibles hôtes qui peuvent les accueillir (en fonction des préférences).
Un algorithme vient ensuite initier le graphe biparti en créant un noeud source avec l'identifiant 0 qui est relié à toutes les personnes par des arcs de capacité 1 et le noeud puits avec l'identifiant 100 qui est relié aux hôtes par des arcs de capacité 1 également.
En appliquant l'algorithme sur notre fichier d'exemple graphb.txt, on reçoit bien un graphe biparti comme décrit ci-dessus et en exécutant l'algorithme de Ford_Fulkerson dessus on obtient une répartition possible des personnes chez les hôtes.
