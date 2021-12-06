open Gfile
open Tool
open Graph
open Ford_fulkerson
    
let () =

  (* Check the number of command-line arguments *)
  if Array.length Sys.argv <> 5 then
    begin
      Printf.printf
        "\n ✻  Usage: %s infile source sink outfile\n\n%s%!" Sys.argv.(0)
        ("    🟄  infile  : input file containing a graph\n" ^
         "    🟄  source  : identifier of the source vertex (used by the ford-fulkerson algorithm)\n" ^
         "    🟄  sink    : identifier of the sink vertex (ditto)\n" ^
         "    🟄  outfile : output file in which the result should be written.\n\n") ;
    end ;


  (* Arguments are : infile(1) source-id(2) sink-id(3) outfile(4) *)
  
  let infile = Sys.argv.(1)
  and outfile = Sys.argv.(4)
  
  (* These command-line arguments are not used for the moment. *)
  and _source = int_of_string Sys.argv.(2)
  and _sink = int_of_string Sys.argv.(3)
  in

  (* Open file *)
  let graph = from_file infile in 

  let graph = gmap graph int_of_string in

  (*Algo de Fold Fulkerson *)
  let chemin = path_search graph 0 3 [0] max_int in

  match chemin with
    |None -> Printf.printf "chemin null %!"
    |Some path_res -> let path = path_res in


  let graph = gmap (add_flow_to_path graph path) string_of_int in
  (* Rewrite the graph that has been read. *)
  let () = write_file outfile graph in 

  
  ()