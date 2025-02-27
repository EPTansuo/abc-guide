module case1(
	input wire clk,
	input wire[3:0]  a,
	input wire[3:0]  b,
	input wire[3:0]  c,
	output wire[8:0] d
								
);

reg [3:0] a_reg;
reg [3:0] b_reg;
reg [3:0] c_reg;

reg [7:0] a_b_reg;
reg [8:0] a_b_c_reg;


always@(posedge clk) begin
	a_reg <= a;
	b_reg <= b;
	c_reg <= c;
	a_b_reg <= a_reg + b_reg;
	a_b_c_reg <= a_b_reg + c_reg;  
end

assign d = a_b_c_reg;


endmodule
