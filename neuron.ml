open Vector;;
open List;;
type neuron = {
   dimension : int;
   weights : float list;
   fi : float->float;
}

let dim n = n.dimension;;
let weights n = n.weights;;
let fi n = n.fi;;
let calculate n d =
   n.fi (dot d n.weights);;
let create afi aweights = 
   { dimension = length aweights;
     weights = aweights;
     fi = afi;
   };;
let random in_size afi =
   let aweights = 
      let rec aux acc i =
         if(i>0) then aux ((Math.normalRandom 0.5 0.)::acc) (i-1)
         else acc
      in aux [] in_size
   in create afi aweights;;


let teach n expected data alfa beta =
   let y = calculate n data in 
   let derivative = (Math.derivative n.fi (dot n.weights data) ) in 
   let factor = ( (y-.expected)*. derivative ) in
   let w_gradient = 
      scale factor data
   and d_gradient =
      scale factor n.weights
   in 
   ((create n.fi (sum n.weights (scale (-.alfa) w_gradient))), (sum data (scale (-.beta) d_gradient)));;
