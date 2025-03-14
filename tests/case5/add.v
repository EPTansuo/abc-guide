module add(
    input        clk,
    input  [2:0] data_in,
    output [2:0] data_out
);

reg [2:0] sum1, sum2, sum3;

wire [2:0] comb_logic = data_in + 3'h1;
wire [2:0] stage1 = comb_logic + 3'h2;
wire [2:0] stage2 = stage1 + 3'h2;
wire [2:0] stage3 = stage2 + 3'h1;

always @(posedge clk) begin
    sum3 <= sum2;
    sum2 <= sum1;
    sum1 <= stage3;
end

assign data_out = sum3;

endmodule
