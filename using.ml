open Ann;;
open List;;
open Printf;;



let ann = ann_standard_random 3 2 4 tanh;;

let d1 = [1.; 1.; 1.];;
let r1 = [0.5; (-0.5)];;

let d2 = [(-0.5); 0.5; (-0.5)];;
let r2 = [0.; 1.];;


let n_list size elem = 
   let rec aux i acc =
      if i<size then (aux (i+1) (elem::acc) )
      else acc
   in aux 0 [];;

let tl1 = n_list 100 (d1, r1);;
let tl2 = n_list 100 (d2, r2);;




