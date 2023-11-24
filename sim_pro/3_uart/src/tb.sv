`timescale 1ns/1ps

module tb();

parameter CLK_PERIOD = 20;

logic clk;
logic rst_n;
initial begin
    rst_n=1'b0;
    #100
    rst_n=1'b1;
end
//////////////////////////////////////////////定义数组以及初始化
    // /*16个整数的两种形式*/
    // int b1[0:15];
    // int b2[16];
    // /*多维数组*/
    // int b3[0:7][0:3];
    // int b4[8][4];
    // int b5[4]=`{0,1,2,3};
    //对于超过边界的访问，四状态返回X，双状态返回0
    /*初始化数组*/
    //$display("b4[7][3]: %d",b4[7][3]);
initial begin
    clk=0;
    forever begin
        #(CLK_PERIOD/2) clk=~clk;
    end
end
reg [7:0]   data;
wire        tx;
initial begin
    data=8'b0011_1101;
end
integer tbcnt;
reg     en;
always @(posedge clk) begin
    if(!rst_n) begin
        tbcnt<='d0;
        en<=1'b0;
    end    
    else if(tbcnt==20000) begin
        tbcnt<='d0;
        en<=1'b1;
    end
    else begin
        tbcnt<=tbcnt+1'b1;
        en<=1'b0;
    end
end

uart_loop inst_uart_loop(
    input sys_clk_p,
    input sys_clk_n,
    input sys_rst_n,
    output  o_uart_tx,
    input   i_uart_rv
);
// uart_tx inst_uart_tx(
//     .clk(clk),
//     .rst_n(rst_n),
//     .i_data(data),
//     .i_en(en),
//     .o_uart_tx(tx),
//     .o_uart_busy()
// );







reg [3:0] cnt;
always @(posedge clk) begin
    if(~rst_n) begin
        cnt<='d0;
    end
    else if(cnt==4'd4) begin
        cnt<='d0;
    end
    else begin
        cnt<=cnt+1'b1;
    end
end


endmodule



