module tb_clk_div(
    input           i_clk,
    input           rst_n,
    output reg      o_clk
);
parameter DIV_NUM = 2;
reg [31:0] cnt;
always @(posedge i_clk) begin
    if(~rst_n) begin
        cnt<='d0;
        o_clk<=1'b1;
    end
    else if(cnt == DIV_NUM-1) begin
        cnt<='d0;
        o_clk<=~o_clk;
    end
    else begin
        cnt<=cnt+1'b1;
        o_clk<=o_clk;
    end
end
endmodule