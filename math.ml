let normalRandom sigma expected=
   Random.self_init();
   let u1 = (Random.float 1.) and u2 = (Random.float 1.) in
   let pi = 4.*. (atan 1.) in
   (sigma*.(sqrt (-2.*.(log u1)))*.(cos (2.*.pi*.u2)))+.expected;;

let derivative f =
   let h = 0.00000001 in
   (function x ->
      ((f (x+.h))-.(f x))/.h);;
