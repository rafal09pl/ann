type neuron;;

val dim : neuron -> int;;
(*Neuron dimension - size of in vector*)
val weights : neuron -> float list;;
(*Weights list*)
val fi : neuron -> float -> float;;
(*funkcja aktywaci*)
val calculate : neuron -> float list -> float;;
(*obliczenie wyniku neuronu dla danej listy danych*)
val teach : neuron -> float -> float list -> float -> float -> neuron*float list;;
(* uczenie neuronu dla oczekiwanego wyniku, danych, stalej uczenia i 
 * stalej propagacji wstecznej zwraca 
 * pare (poprawiony neuron, oczekiwane dane) *)
val create : (float->float)->float list->neuron;;
(* tworzy neuron z dana funkcja aktywacji i wektorem wag*)
val random : int->(float->float)->neuron;;
(* tworzy losowy neuron o podanym rozmiarze wejscia*)
