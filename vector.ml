open List;;

let dot v1 v2 = 
   fold_left2 (fun a x1 x2 -> a+.(x1*.x2)) 0. v1 v2;;

let scale k v = 
   map (( *.) k) v;;

let sum v1 v2 = 
   map2 (+.) v1 v2;;

let vec_zero n =
   let rec aux acc i =
      if i>0 then aux (0.::acc) (i-1)
      else acc
   in aux [] n;;
