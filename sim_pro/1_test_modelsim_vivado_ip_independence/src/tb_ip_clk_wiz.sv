`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/10/19 10:23:57
// Design Name: 
// Module Name: tb_ip_clk
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module tb_ip_clk_wiz();

reg     sys_clk_p;
reg     sys_clk_n;
reg     sys_rst_n;

wire    clk_200m;      
wire    clk_100m;
wire    clk_100m_180deg;     
wire    clk_25m;   
     

always #5 sys_clk_p = ~sys_clk_p;
always #5 sys_clk_n = ~sys_clk_n;

initial begin
    sys_clk_p = 1'b0;
    sys_clk_n = 1'b1;
    sys_rst_n = 1'b0;
    #100
    sys_rst_n = 1'b1;
end

ip_clk_wiz u_ip_clk_wiz(
    .sys_clk_p        (sys_clk_p        ),
    .sys_clk_n        (sys_clk_n        ),
    .sys_rst_n        (sys_rst_n        ),

    .clk_200m         (clk_200m         ),
    .clk_100m         (clk_100m         ),
    .clk_100m_180deg  (clk_100m_180deg  ),
    .clk_25m          (clk_25m          )  
    );

endmodule

