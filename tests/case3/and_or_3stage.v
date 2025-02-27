// I use three NAND gate here. 
// As the De Morgan's Low, there is `AND` and `OR`. 
module and_or_3stage(
			 input wire clk,
  		 input wire[3:0] in, 
			 output wire out);

reg[3:0] in_reg;

// stage 1
always@(posedge clk) begin
	in_reg <= in;
end


reg [1:0] nand2_reg;

// stage 2
always@(posedge clk) begin
	nand2_reg[0] <= ~( in_reg[0] & in_reg[1] );
	nand2_reg[1] <= ~( in_reg[2] & in_reg[3] );
end


reg and_or_reg;

// stage 3
always@(posedge clk) begin
	and_or_reg <= ~( nand2_reg[0] & nand2_reg[1] );
end

assign out = and_or_reg;

endmodule

