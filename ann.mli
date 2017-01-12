open Layer;;

type ann;;

val layers : ann -> layer list;;
(* layers ann
 * returns list of layers which network ann is built with *)

val ann_in_size : ann -> int;;
(* ann_in_size ann
 * returns in size of ann *)

val ann_out_size : ann -> int;;
(* ann_ot_size ann
 * returns out size of ann *)

val ann_calculate : ann -> float list -> float list;;
(* Calculation for whole network
 * ann_calculate ann data_list
 * returns result of calculation for network *)

val ann_create : layer list -> ann;;
(* Create network from layers list 
 * ann_create layer_list 
 * returns network built with layers from list  *)

val ann_standard_random : int -> int -> int -> (float->float) -> ann;;
(* Creates random network built with three layers 
 * ann_standard_random in_size out_size power activation_function
 * returns network with given in and out sze. Power is size of
 * first and middle layer. *)

val ann_teach : ann -> float list -> float list -> float -> float -> ann;;
(* Teach function for whole network
 * ann_teach ann data expected_result teach_const back_prop_const
 * returns corrected network  *)

val ann_multi_teach : ann -> (float list * float list) list -> float -> float -> ann;;


val ann_compatible : ann -> bool;;
(* Checks if all layers and connections between them are compatible  *)

