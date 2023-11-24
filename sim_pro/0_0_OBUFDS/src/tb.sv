`timescale 1ns / 1ps
module tb();

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
wire clk;
wire rst_n;
assign rst_n = sys_rst_n;
assign clk  = clk_200m;
reg in0;
wire ooo;
wire oob;
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
   .I(in0)    // 1-bit input: Buffer input
);



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
   .OQ(OQ),         // 1-bit output: Serial Output Data，串行数据输出
   .T_OUT(T_OUT),   // 1-bit output: 3-state control output to IOB，三态控制输出到IOB
   .CLK(CLK),       // 1-bit input: High-speed clock，高速时钟
   .CLKDIV(CLKDIV), // 1-bit input: Divided Clock，分频时钟
   .D(D),           // 8-bit input: Parallel Data Input,并行数据输入
   .RST(RST),       // 1-bit input: Asynchronous Reset，异步复位
   .T(T)            // 1-bit input: Tristate input from fabric，输入，内部逻辑的三态输入。是否数据处于三态。
);




endmodule

