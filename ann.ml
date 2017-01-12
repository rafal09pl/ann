open Layer;;
open List;;
type ann =
   { layers : layer list;
     in_size : int;
     out_size : int;
   };;

let layers net = net.layers;;

let ann_in_size net = net.in_size;;

let ann_out_size net = net.out_size;;

let ann_compatible net = 
   let (r, _) = fold_left (fun (acc, ins) lay -> 
      (acc && (l_compatible lay) && (ins = (in_size lay) ), (out_size lay) ) )
      (true, net.in_size) net.layers 
   in r


let ann_calculate net data =
   fold_left (fun d l -> l_calculate l d) data net.layers;;

let calculation_list net data =        (*Lista wynikow dla warstw*)
   tl ( fold_left (fun acc l -> (l_calculate l (hd acc) )::acc) [data] net.layers );;



let ann_create l_list =
   {
      layers= l_list;
      in_size= in_size (hd l_list);
      out_size= out_size (hd (rev l_list));
   };;

let ann_standard_random ins outs power afi =
   let ll = [(l_random ins power afi); (l_random power power afi); (l_random power outs afi)] in
   {
      layers = ll;
      in_size = ins;
      out_size = outs;
   };;

let ann_teach net data expected alfa beta =
   let res_list = calculation_list net data in
      let (l_list, _, _) = fold_right
         (fun lay (c_lays, r_list, expect) ->
            let teach_res = l_teach lay (hd r_list) expect alfa beta in
               ( ( (fst teach_res)::c_lays ), (tl r_list), (snd teach_res) ) )
         net.layers ( [], res_list, expected ) in
      ann_create l_list;;


let ann_multi_teach net teaching_list alfa beta = 
   fold_left (fun a h -> ann_teach a (fst h) (snd h) alfa beta) net teaching_list;;



