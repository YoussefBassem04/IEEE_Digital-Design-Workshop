vlib work
vlog ALU.v ALU_tb.v
vsim -voptargs=+acc work.ALU_DUT
add wave *
run -all
#quit -sim