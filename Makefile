ann.cma: neuron.cmo math.cmo vector.cmo layer.cmo ann.cmo
	ocamlc -a math.cmo vector.cmo neuron.cmo layer.cmo ann.cmo -o ann.cma

ann.cmo: math.cmo neuron.cmo vector.cmo layer.cmo ann.cmi
	ocamlc -c math.cmo vector.cmo neuron.cmo layer.cmo ann.ml

ann.cmi: ann.mli
	ocamlc -c ann.mli

layer.cma: neuron.cmo math.cmo vector.cmo layer.cmo
	ocamlc -a math.cmo vector.cmo neuron.cmo layer.cmo -o layer.cma

layer.cmo: math.cmo neuron.cmo vector.cmo layer.cmi layer.ml
	ocamlc -c math.cmo vector.cmo neuron.cmo layer.ml

layer.cmi: layer.mli
	ocamlc -c layer.mli

neuron.cma: neuron.cmo vector.cmo math.cmo
	ocamlc -a math.cmo vector.cmo neuron.cmo -o neuron.cma

neuron.cmo: math.cmo vector.cmo neuron.cmi neuron.ml
	ocamlc -c math.cmo vector.cmo neuron.ml

neuron.cmi: neuron.mli
	ocamlc -c neuron.mli

math.cmo: math.cmi math.ml
	ocamlc -c math.ml

math.cmi: math.mli
	ocamlc -c math.mli

vector.cmo: vector.cmi vector.ml
	ocamlc -c vector.ml

vector.cmi: vector.mli
	ocamlc -c vector.mli

clean:
	rm *.cmi *.cmo
all:
	rm *.cmi *.cmo *.cma
