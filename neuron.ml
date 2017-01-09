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
   let w_gradient = 
      scale ( (y-.expected)*. (Math.derivative n.fi (dot n.weights data) ) ) data
   and d_gradient =
      scale ( (y-.expected)*. (Math.derivative n.fi (dot n.weights data) ) ) n.weights
   in 
   ((create n.fi (suma n.weights (scale (-.alfa) w_gradient))), (suma data (scale (-.beta) d_gradient)));;
