`timescale 1ns / 1ps
`include "./include/define.sv"
`include "./include/func_calc_bw.sv"


module tb();
reg clk_500m;//T=2NS
reg clk_250m;//T=4NS
reg clk_100m;//T=10NS
reg clk_50m ;//T=20NS
reg clk_10m ;//T=100NS
reg clk_1m  ;//T=1000NS
reg rst_n;
reg clk;
initial begin
clk_500m = 1'b1;
clk_250m = 1'b1;
clk_100m = 1'b1;
clk_50m  = 1'b1;
clk_10m  = 1'b1;
clk_1m   = 1'b1;
rst_n    = 1'b1;
#100
rst_n    = 1'b1;
    fork
        forever #1   clk_500m = ~clk_500m;
        forever #2   clk_250m = ~clk_250m;
        forever #5   clk_100m = ~clk_100m;
        forever #10  clk_50m  = ~clk_50m ;
        forever #50  clk_10m  = ~clk_10m ;
        forever #500 clk_1m   = ~clk_1m  ;
    join
end
assign clk = clk_250m;


endmodule

