// Retiming-Based Factorization for Sequential Logic Optimization, Fig. 1.(a)

module retime(
	input a,
	input b,
	input clk, 
	output z1,
	output z2
);

reg r1,r2,r3;
wire r1_in, r2_in, r3_in;
wire g3_out;

always @(posedge clk) begin
	r1 <= r1_in;
	r2 <= r2_in;
	r3 <= r3_in;
end

assign z1 = r2_in;
assign r2_in = ~ (a | r3);
assign r3_in = r1;
assign g3_out = r1_in | r3;
assign r1_in = r2 & r1;
assign z2 = b & g3_out;


endmodule
