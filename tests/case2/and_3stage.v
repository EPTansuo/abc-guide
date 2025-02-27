module and_3stage(
			 input wire clk,
  		 input wire[3:0] in, 
			 output wire out);

reg[3:0] in_reg;

// stage 1
always@(posedge clk) begin
	in_reg <= in;
end


reg [1:0] and2_reg;

// stage 2
always@(posedge clk) begin
	and2_reg[0] <= in_reg[0] & in_reg[1];
	and2_reg[1] <= in_reg[2] & in_reg[3];
end


reg and4_reg;

// stage 3
always@(posedge clk) begin
	and4_reg <= and2_reg[0] & and2_reg[1];
end

assign out = and4_reg;

endmodule

