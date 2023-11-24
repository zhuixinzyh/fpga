`timescale 1ns/1ps

module tb();

parameter CLK_PERIOD = 20;

logic clk;
logic rst_n;
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


logic [31:0] a;
logic [31:0] b;
logic [31:0] c;

initial begin
    a=0;
    b=0;
end
/////////////////////////////////////////////////////for foreach 访问数组元素
initial begin
bit[31:0] src[5],dst[5];
for(int i=0;i<$size(src);i++) begin
    src[i]=i;
    $display("src %d is %d\n",i,src[i]);
end
foreach (dst[j]) begin
    dst[j]=src[j]*2;
    $display("dst %d is %d\n",j,dst[j]);
end
end
always @(posedge clk ) begin
    a<=a+2;
    b<=b+3;
end
always @(posedge clk ) begin
    test(clk,a,b,c);
end

task test;
    input clk;
    input int a;
    input int b;
    output int c;
    c=a*b;

    $display("task test : %d %d %d",a,b,c);

endtask


// logic [3:0] a;
// logic [3:0] b;
// logic [7:0] result;

// initial begin
//     clk = 1;
//     rst_n = 0;
//     #100
//     rst_n = 1;
// end
// always begin
//     #10 clk <= ~clk;
// end

// always @(posedge clk ) begin
//     if(!rst_n) begin
//         a <= 4'd1;
//         b <= 4'd1;
//     end
//     else begin
//         a<=a+4'd1;
//         b<=b+4'd2;
//     end
// end
//  mul inst_mul(
//     .a(a),
//     .b(b),
//     .result(result)
//  );
// always @(posedge clk ) begin
//     $display("a*b: %d",result);
// end
endmodule



