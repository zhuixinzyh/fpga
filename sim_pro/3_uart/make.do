#仅仅是编译
#https://developer.aliyun.com/article/1051520
#do d.do

quit -sim
#在路径下创建一个work文件夹
vlib ./lib
vlib ./lib/work

#在 modelsim 的Library窗口创建work目录，并映射到实际的物理目录
vmap work ./lib/work

#vlog编译指令
#编译设计文件和仿真文件。-work用于指定编译存放的库目录。一般默认也是work.
vlog -work work "./include/*.sv"
vlog -work work "./src/*.sv"
#vlog -work work "./src/*.v"