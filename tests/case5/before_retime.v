// Benchmark "add" written by ABC on Mon Mar  3 11:33:29 2025

module add ( clock, 
    clk, \data_in[0] , \data_in[1] , \data_in[2] ,
    \data_out[0] , \data_out[1] , \data_out[2]   );
  input  clock;
  input  clk, \data_in[0] , \data_in[1] , \data_in[2] ;
  output \data_out[0] , \data_out[1] , \data_out[2] ;
  reg \sum1[0] , \sum1[1] , \sum1[2] , \sum2[0] , \sum2[1] , \sum2[2] ,
    \sum3[0] , \sum3[1] , \sum3[2] ;
  wire new_n35, new_n36, new_n37, new_n38_1, new_n39, new_n41, new_n42_1,
    new_n43, new_n44, new_n45, new_n46_1, new_n47, new_n48, new_n49,
    new_n50_1, new_n51, new_n52, new_n53, n16, n21, n26, n30, n34, n38,
    n42, n46, n50;
  assign new_n35 = ~\data_in[0]  & \data_in[1] ;
  assign new_n36 = \data_in[0]  & ~\data_in[1] ;
  assign new_n37 = ~new_n35 & ~new_n36;
  assign new_n38_1 = \data_in[0]  & ~new_n37;
  assign new_n39 = ~\data_in[0]  & new_n37;
  assign n21 = new_n38_1 | new_n39;
  assign new_n41 = \data_in[0]  & \data_in[1] ;
  assign new_n42_1 = \data_in[2]  & ~new_n41;
  assign new_n43 = ~\data_in[2]  & new_n41;
  assign new_n44 = ~new_n42_1 & ~new_n43;
  assign new_n45 = new_n37 & ~new_n44;
  assign new_n46_1 = ~new_n37 & new_n44;
  assign new_n47 = ~new_n45 & ~new_n46_1;
  assign new_n48 = ~new_n37 & ~new_n47;
  assign new_n49 = new_n37 & new_n47;
  assign new_n50_1 = ~new_n48 & ~new_n49;
  assign new_n51 = ~\data_in[0]  & ~new_n37;
  assign new_n52 = ~new_n50_1 & ~new_n51;
  assign new_n53 = new_n50_1 & new_n51;
  assign n26 = new_n52 | new_n53;
  assign \data_out[0]  = \sum3[0] ;
  assign \data_out[1]  = \sum3[1] ;
  assign \data_out[2]  = \sum3[2] ;
  assign n16 = \data_in[0] ;
  assign n30 = \sum1[0] ;
  assign n34 = \sum1[1] ;
  assign n38 = \sum1[2] ;
  assign n42 = \sum2[0] ;
  assign n46 = \sum2[1] ;
  assign n50 = \sum2[2] ;
  always @ (posedge clock) begin
    \sum1[0]  <= n16;
    \sum1[1]  <= n21;
    \sum1[2]  <= n26;
    \sum2[0]  <= n30;
    \sum2[1]  <= n34;
    \sum2[2]  <= n38;
    \sum3[0]  <= n42;
    \sum3[1]  <= n46;
    \sum3[2]  <= n50;
  end
endmodule


