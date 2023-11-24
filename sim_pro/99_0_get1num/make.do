#仅仅是编译
#https://developer.aliyun.com/article/1051520
#do d.do

quit -sim
vlib ./p_xil_lib

vmap work ./p_xil_lib
vlog -64 -incr -work work "/tools/Xilinx/Vivado/2023.1/data/verilog/src/glbl.v"

vlog -64 -incr -work work  "./src/*.sv"
vlog -64 -incr -work work  "./include/*.sv"

#vlog -64 -incr -work work  "./ip/clk/*.sv"





