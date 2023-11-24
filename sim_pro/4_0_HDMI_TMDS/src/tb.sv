`timescale 1ns / 1ps
module tb();

reg clk;
reg rst_n;
initial begin
    rst_n = 1'b0;
    #500
    rst_n = 1'b1;
end
initial begin
    clk = 1'b1;
    forever begin
        #5 clk = ~clk;
    end
end

wire clk_100m;
wire clk_10m;
wire clk_50m;
reg  [31:0] clk_div_cnt;


tb_clk_div #(
    .DIV_NUM(10)
)
inst_tb_clk_div_0(
    .i_clk(clk_100m),
    .rst_n(rst_n),
    .o_clk(clk_10m)
);
tb_clk_div #(
    .DIV_NUM(1)
)
inst_tb_clk_div_1(
    .i_clk(clk_100m),
    .rst_n(rst_n),
    .o_clk(clk_50m)
);
assign clk_100m = clk;
reg in0;
wire ooo;
wire oob;
wire w_serial_data;
wire w_t_out;
reg [3:0]   reg_data2serial;


always @(posedge clk) begin
    if(~rst_n) begin
        in0<=1'b0;
    end
    else begin
        in0<=~in0;
    end
end
OBUFDS OBUFDS_inst_0 (
   .O(ooo),   // 1-bit output: Diff_p output (connect directly to top-level port)
   .OB(oob), // 1-bit output: Diff_n output (connect directly to top-level port)
   .I(w_serial_data)    // 1-bit input: Buffer input
);


always @(posedge clk_50m or negedge rst_n) begin
    if(~rst_n) begin
        reg_data2serial<=4'd1;
    end
    else begin
        reg_data2serial<=reg_data2serial+1'b1;
    end
end
//T_OUT 三态输出可以不接呀，IOB可以理解为输出引脚的逻辑？
OSERDESE3 #(
   .DATA_WIDTH(4),                 // Parallel Data Width (4-8)，只能是4或者8,定义数据转换器的宽度
   .INIT(1'b0),                    // Initialization value of the OSERDES flip-flops，触发器初始化的值
   .IS_CLKDIV_INVERTED(1'b0),      // Optional inversion for CLKDIV，输入时钟是否反转
   .IS_CLK_INVERTED(1'b0),         // Optional inversion for CLK
   .IS_RST_INVERTED(1'b0),         // Optional inversion for RST
   .SIM_DEVICE("ULTRASCALE_PLUS")  // Set the device version for simulation functionality (ULTRASCALE,
                                   // ULTRASCALE_PLUS, ULTRASCALE_PLUS_ES1, ULTRASCALE_PLUS_ES2)//器件类型
)
OSERDESE3_inst (
   .OQ(w_serial_data),         // 1-bit output: Serial Output Data，串行数据输出
   .T_OUT(w_t_out),   // 1-bit output: 3-state control output to IOB，三态控制输出到IOB
   .CLK(clk_100m),       // 1-bit input: High-speed clock，高速时钟
   .CLKDIV(clk_50m), // 1-bit input: Divided Clock，分频时钟
   .D(reg_data2serial),           // 8-bit input: Parallel Data Input,并行数据输入
   .RST(~rst_n),       // 1-bit input: Asynchronous Reset，异步复位
   .T(1'b0)            // 1-bit input: Tristate input from fabric，输入，内部逻辑的三态输入。是否数据处于三态。 
);




endmodule

