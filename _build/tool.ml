open Graph

let clone_nodes (gr: 'a graph) = 
    n_fold gr (fun graph id -> new_node graph id) (empty_graph);;

let gmap gr f =
    e_fold gr (fun graph id1 id2 lbl -> new_arc graph id1 id2 (f lbl)) (clone_nodes gr);;

let add_arc gr id1 id2 n =
    match find_arc gr id1 id2 with
        |None -> new_arc gr id1 id2 n
        |Some a -> new_arc gr id1 id2 (a+n)