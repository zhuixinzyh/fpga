#仅仅是编译
#https://developer.aliyun.com/article/1051520
#do d.do

quit -sim
vlib ./modelsim_lib
vlib ./modelsim_lib/work
vlib ./modelsim_lib/msim
vlib ./modelsim_lib/msim/xil_defaultlib

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib

vlog -64 -incr -work xil_defaultlib  "./src/*.sv"

vlog -64 -incr -work xil_defaultlib  "./ip/clk/*.sv"

# compile glbl module
vlog -work xil_defaultlib "./src/glbl.sv"



