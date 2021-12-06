open Graph
open Tool
open Int

type path_return = 
{
    path : id list;
    min : int
}

let filter_out_arcs list_arcs wip_path =
    List.filter (fun (id, label) -> label > 0 && not (List.mem id wip_path)) list_arcs

let rec path_search graph src dest acu minim =
    let next_arcs = filter_out_arcs (out_arcs graph src) acu in
        (* Printf.printf " src : %d\n%!" src;
        List.iter (fun (id,lbl) -> Printf.printf " id : %d , label : %d\n%!" id lbl) next_arcs; *)
        let rec parcours_arcs list_arcs wip_path =
            match list_arcs with
            |[] -> None
            |(idDest, label) :: rest -> let new_min=(min label minim) in
                if idDest = dest then Some {path=idDest::wip_path;min=new_min}  else let rec_call = path_search graph idDest dest (idDest::wip_path) new_min in
                match rec_call with 
                    | None -> parcours_arcs rest wip_path
                    | Some path_res -> Some path_res
        in
        parcours_arcs next_arcs acu
;;


let rec add_flow_to_path graph path_ret =
	match path_ret.path with
		|[] -> graph
		|idSrc :: idDest :: rest -> let new_graph_avant = add_arc graph idSrc idDest (path_ret.min) in
                                    let res_graph = add_arc new_graph_avant idDest idSrc (- path_ret.min) in
                                    add_flow_to_path res_graph {path_ret with path = idDest::rest}
        |id::rest -> graph                             
;;

(* let ford_fulkerson = assert false;; *)