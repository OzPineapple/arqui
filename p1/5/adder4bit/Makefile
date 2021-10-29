target=test
fontsize=22

default:
	make validate
	make build
	make simulate

simulate:
	ghdl -r $(target) --vcd=sim.vcd
	gtkwave sim.vcd --rcvar 'fontname_waves Monospac $(fontsize)' --rcvar 'fontname_signals Monospace $(fontsize)'

validate:
	ghdl -s *.vhdl

build:
	ghdl -a *.vhdl
	cat work-obj*
	ghdl -e $(target)

clean:
	rm *.o work-obj* $(target) sim.vcd
