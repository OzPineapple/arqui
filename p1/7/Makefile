target=test
fontsize=22

default:
	make validate
	make build
	make simulate

simulate:
	ghdl -r -fsynopsys  $(target) --vcd=sim.vcd
	gtkwave sim.vcd --rcvar 'fontname_waves Monospac $(fontsize)' --rcvar 'fontname_signals Monospace $(fontsize)'

validate:
	ghdl -s -fsynopsys *.vhdl

build:
	ghdl -a -fsynopsys *.vhdl
	cat work-obj*
	ghdl -e -fsynopsys $(target)

clean:
	rm *.o work-obj* $(target) sim.vcd
