type neuron;;

val dim : neuron -> int;;
(* dim neuron
 * returns neuron's in vector size *)
val weights : neuron -> float list;;
(* weights neuron 
 * returns weigts list of given neuron *)
val fi : neuron -> float -> float;;
(* fi neuron 
 * returns activation function of given neuron*)
val calculate : neuron -> float list -> float;;
(* calculate neuron data_list
 * returns calculation result of given neuron for data_list *)
val teach : neuron -> float -> float list -> float -> float -> neuron*float list;;
(* Neuron's teaching:
 * teach neuron expexted_result data_list teach_const back_prop_const
 * returns pair (corrected_neuron, expected_data)  *)
val create : (float->float)->float list->neuron;;
(* Creates neuron
 * create activaton_function weights_list 
 * returns neuron with given arguments     *)
val random : int->(float->float)->neuron;;
(* Creates random neuron
 * random dim activation_function
 * returns random neuron with given in size    *)
