// Benchmark "add" written by ABC on Mon Mar  3 11:33:29 2025

module add ( clock, 
    clk, \data_in[0] , \data_in[1] , \data_in[2] ,
    \data_out[0] , \data_out[1] , \data_out[2]   );
  input  clock;
  input  clk, \data_in[0] , \data_in[1] , \data_in[2] ;
  output \data_out[0] , \data_out[1] , \data_out[2] ;
  reg \sum1[0] , \sum2[0] , \sum2[1] , \sum3[0] , \sum3[1] , n51_o2, n37_o2,
    n38_1_o2, n39_o2, n44_o2, n51_o2_o2, n48_o2, n49_o2, n54_o2;
  wire new_n35, new_n36, new_n40, new_n41, new_n42_1, new_n43, new_n45,
    new_n46_1, new_n47, new_n50, new_n52, new_n53, \new_sum1[2]_buf ,
    \new_sum2[2]_buf , n16, n30, n34, n42, n46, n51_i2, n37_i2, n38_1_i2,
    n39_i2, n44_i2, n51_o2_i2, n48_i2, n49_i2, n54_i2;
  assign new_n35 = ~\data_in[0]  & \data_in[1] ;
  assign new_n36 = \data_in[0]  & ~\data_in[1] ;
  assign n37_i2 = ~new_n35 & ~new_n36;
  assign n38_1_i2 = \data_in[0]  & ~n37_i2;
  assign n39_i2 = ~\data_in[0]  & n37_i2;
  assign new_n40 = n38_1_o2 | n39_o2;
  assign new_n41 = \data_in[0]  & \data_in[1] ;
  assign new_n42_1 = \data_in[2]  & ~new_n41;
  assign new_n43 = ~\data_in[2]  & new_n41;
  assign n44_i2 = ~new_n42_1 & ~new_n43;
  assign new_n45 = n37_o2 & ~n44_o2;
  assign new_n46_1 = ~n37_o2 & n44_o2;
  assign new_n47 = ~new_n45 & ~new_n46_1;
  assign n48_i2 = ~n37_o2 & ~new_n47;
  assign n49_i2 = n37_o2 & new_n47;
  assign new_n50 = ~n48_o2 & ~n49_o2;
  assign n51_i2 = ~\data_in[0]  & ~n37_i2;
  assign new_n52 = ~new_n50 & ~n51_o2_o2;
  assign new_n53 = new_n50 & n51_o2_o2;
  assign n54_i2 = new_n52 | new_n53;
  assign \data_out[0]  = \sum3[0] ;
  assign \data_out[1]  = \sum3[1] ;
  assign \data_out[2]  = \new_sum2[2]_buf ;
  assign n16 = \data_in[0] ;
  assign n30 = \sum1[0] ;
  assign n34 = new_n40;
  assign \new_sum1[2]_buf  = n54_o2;
  assign n42 = \sum2[0] ;
  assign n46 = \sum2[1] ;
  assign \new_sum2[2]_buf  = \new_sum1[2]_buf ;
  assign n51_o2_i2 = n51_o2;
  always @ (posedge clock) begin
    \sum1[0]  <= n16;
    \sum2[0]  <= n30;
    \sum2[1]  <= n34;
    \sum3[0]  <= n42;
    \sum3[1]  <= n46;
    n51_o2 <= n51_i2;
    n37_o2 <= n37_i2;
    n38_1_o2 <= n38_1_i2;
    n39_o2 <= n39_i2;
    n44_o2 <= n44_i2;
    n51_o2_o2 <= n51_o2_i2;
    n48_o2 <= n48_i2;
    n49_o2 <= n49_i2;
    n54_o2 <= n54_i2;
  end
  initial begin
    \sum1[0]  <= 1'b0;
    \sum2[0]  <= 1'b0;
    \sum2[1]  <= 1'b0;
    \sum3[0]  <= 1'b0;
    \sum3[1]  <= 1'b0;
    n51_o2 <= 1'b0;
    n37_o2 <= 1'b1;
    n38_1_o2 <= 1'b0;
    n39_o2 <= 1'b0;
    n44_o2 <= 1'b0;
    n51_o2_o2 <= 1'b0;
    n48_o2 <= 1'b0;
    n49_o2 <= 1'b0;
    n54_o2 <= 1'b0;
  end
endmodule


