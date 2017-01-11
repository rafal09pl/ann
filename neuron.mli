type neuron;;

val dim : neuron -> int;;
(*Neuron dimension - size of in vector*)
val weights : neuron -> float list;;
(*Weights list*)
val fi : neuron -> float -> float;;
(*Activation function*)
val calculate : neuron -> float list -> float;;
(*Calculation of neuron's result for data list*)
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
