target=test
fontsize=22
options=-fsynopsys -fexplicit
time=800ns
files= \
		ac1200.vhdl 			\
		ac800.vhdl				\
		packagebcd00.vhdl		\
		bcd00.vhdl				\
		checkCode00.vhdl		\
		coderNibbles00.vhdl		\
		compadd00.vhdl			\
		contIter00.vhdl			\
		contring00.vhdl			\
		init00.vhdl				\
		leeDato00.vhdl			\
		memProg00.vhdl			\
		mux00.vhdl				\
		pc00.vhdl				\
		shift12s00.vhdl			\
		shift8s00.vhdl			\
		sust00.vhdl				\
		test.vhdl				\
		uc00.vhdl

default:
	make validate
	make build
	make simulate
	make display

simulate:
	ghdl -r $(target) --stop-time=$(time) --vcd=sim.vcd &

display:
	gtkwave sim.vcd --rcvar 'fontname_waves Monospac $(fontsize)' --rcvar 'fontname_signals Monospace $(fontsize)' &

validate:
	ghdl -s $(options) $(files)

build:
	ghdl -a $(options) $(files)
	ghdl -e $(options) $(target)

clean:
	rm *.o work-obj* $(target) sim.vcd
