open Neuron;;
type layer;;

exception Incompatible_Neurons_List;;

val in_size : layer -> int;;
(* rozmiar wejscia *)
val out_size : layer -> int;;
(* rozmiar wyjscia *)
val neurons : layer -> neuron list;;
(* lista neuronow *)
val l_create : (neuron list)->layer;;
(* tworzy warstwe z danej listy neuronow*)
val l_random : int->int->(float->float)->layer;;
(* tworzy losowa warstwe o danym rozmiarze wejscia, wyjscia 
 * i funkcji aktywacji*)
val l_calculate : layer->(float list)->float list;;
(* oblicza wektor wyjsc dla daengo wektora wejscia*)
val l_teach : layer -> float list -> float list -> float -> float -> layer * float list;;
(* dla danych: warstwy, wektora oczekiwanego, wektora wejscia, 
 * stalej uczenia, daje pare: poprawiona warstwa, srednie oczeiwane dane*)

