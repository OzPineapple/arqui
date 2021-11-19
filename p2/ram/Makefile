target=test
fontsize=22
options=-fsynopsys -fexplicit --std=08
time=180ns
files=*.vhdl

default:
	make validate
	make build
	make simulate
	make display

simulate:
	ghdl -r $(target) --stop-time=$(time) --vcd=sim.vcd

display:
	gtkwave sim.vcd --rcvar 'fontname_waves Monospac $(fontsize)' --rcvar 'fontname_signals Monospace $(fontsize)'

validate:
	ghdl -s $(options) $(files)

build:
	ghdl -a $(options) $(files)
	ghdl -e $(options) $(target)

clean:
	rm *.o work-obj* $(target) sim.vcd
