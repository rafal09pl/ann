open Layer;;

type ann;;

val layers : ann -> layer list;;

val ann_in_size : ann -> int;;

val ann_out_size : ann -> int;;

val ann_calculate : ann -> float list -> float list;;

val ann_create : layer list -> ann;;

val ann_standard_random : int -> int -> int -> (float->float) -> ann;;

val ann_teach : ann -> float list -> float list -> float -> float -> ann;;

val ann_multi_teach : ann -> (float list * float list) list -> float -> float -> ann;;
