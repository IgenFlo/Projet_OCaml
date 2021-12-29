open Graph
open Tool
open Printf

(* Crée les noeuds source et puits et les relie où il faut *)
(* let init_biparti graph =
    n_iter graph (fun id ->
        match id with
        |n when (n=0||n=100) -> ();
        |n when (n < 50) -> let graph = new_arc graph 0 id 1 in ()
        |n when (n >= 50) -> let graph = new_arc graph id 100 1 in ()
        |_ -> () );
    graph *)

let init_biparti graph =
    Printf.printf "0 ou 100 %!";
    n_fold graph (fun gr id ->
        match id with
        |n when (n=0||n=100) -> Printf.printf "0 ou 100 %!"; gr
        |n when (n < 50) -> Printf.printf "0 ou 100 %!"; add_arc gr 0 id 1
        |n when (n >= 50) -> Printf.printf "0 ou 100 %!"; add_arc gr id 100 1
        |_ -> Printf.printf "0 ou 100 %!"; gr ) empty_graph
;;