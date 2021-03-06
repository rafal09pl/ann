open Neuron;;
open List;;
open Vector;;
type layer =
      { in_size : int;
        out_size : int;
        neurons : neuron list;
      };;

exception Incompatible_Neurons_List;;

let in_size l = l.in_size;;

let out_size l = l.out_size;;

let neurons l = l.neurons;;


let in_size_n_list nlist =
   fold_left (fun a h ->
      if a=(dim h) then a
      else raise Incompatible_Neurons_List) (dim (hd nlist)) nlist;;

let l_compatible lay =
   let (r, _) = fold_left (fun (acc, d) h -> (acc && (dim h) = d, dim h) ) 
   (true, lay.in_size) lay.neurons 
   in r;;


let l_create nlist =
   { in_size= in_size_n_list nlist;
     out_size= length nlist;
     neurons= nlist
   };;

let l_random ins outs afi =
   let rec aux acc i =
      if i>0 then aux ((random ins afi)::acc) (i-1)
      else acc
   in l_create (aux [] outs);;

let l_calculate l data =
   fold_left (fun acc h ->
      (calculate h data)::acc) [] l.neurons;;

let l_teach l data expected alfa beta =
   let result_pairs_list =
      fold_left2 (fun acc neu exp ->
         (teach neu exp data alfa beta)::acc) [] l.neurons expected in 
   let (neurons_res_list, exp_data_list) = split result_pairs_list in
   let avg_exp_data =
      let one_of_n = ( 1. /. (float_of_int l.out_size) ) in
         scale one_of_n  ( fold_left sum (vec_zero l.in_size) exp_data_list )
   in (l_create neurons_res_list, avg_exp_data);;

