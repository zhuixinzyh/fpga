 module iic_drive(
    input logic [3:0] a,
    input logic [3:0] b,
    output  logic [7:0] result
 );
    always_comb begin : mul
        result = a*b;
    end
 endmodule
