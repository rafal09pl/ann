open Neuron;;
type layer;;

exception Incompatible_Neurons_List;;

val in_size : layer -> int;;
(* in_size layer 
 * returns size of layer's in vector  *)
val out_size : layer -> int;;
(* out_size layer
 * returns size of layer's out vector  *)
val neurons : layer -> neuron list;;
(* neurons layer 
 * returns list of neurons which layer is built with   *)
val l_create : (neuron list)->layer;;
(* l_create neurons 
 * returns layer build with given neurons list   *)
val l_random : int->int->(float->float)->layer;;
(* l_random in_size out_size fi 
 * returns random layer with given in and out size and 
 * actiovation function fi    *)
val l_calculate : layer->(float list)->float list;;
(* Calculation for whole layer
 * l_calculate layer data_list
 * returns list of results for all neurons in layer*)
val l_teach : layer -> float list -> float list -> float -> float -> layer * float list;;
(* Teaching whole layer 
 * l_teach layer expected_vector in_vector teaching_const back_prop_const 
 * returns pair
 * ( corrected_layer, avarage_expected_data )   *)

val l_compatible : layer -> bool;;
(* Checks if neuron list is compatible,
 * which means, all neurons have the same in size  *)


