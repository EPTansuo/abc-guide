// Benchmark "retime" written by ABC on Sat Mar  1 12:45:43 2025

module retime ( clock, 
    a, b, clk,
    z1, z2  );
  input  clock;
  input  a, b, clk;
  output z1, z2;
  reg r1, r2, r3;
  wire new_n17, n12, n16, n20;
  assign z1 = ~a & ~r3;
  assign n12 = r1 & r2;
  assign new_n17 = ~r3 & ~n12;
  assign z2 = b & ~new_n17;
  assign n16 = z1;
  assign n20 = r1;
  always @ (posedge clock) begin
    r1 <= n12;
    r2 <= n16;
    r3 <= n20;
  end
  initial begin
    r1 <= 1'b0;
    r2 <= 1'b0;
    r3 <= 1'b0;
  end
endmodule


