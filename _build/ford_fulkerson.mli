open Graph
open Tool

type path_return = 
{
    path : id list;
    min : int
}

(* Algo de recherche qui renvoie le chemin auquel on ajoute le flot ainsi que le flot à ajouter *)
val path_search : int graph -> id -> id -> id list -> int ->path_return option

(*Ajoute le flot à tous les arcs du chemin *)
val add_flow_to_path : int graph -> path_return -> int graph

(* Renvoie un graphe de flot saturé *)
(* val ford_fulkerson : int graph -> int graph *)
