module decoder_2_4 (I,D);
  input [1:0] I;
  output [3:0] D;
  
  assign D[0] = (~I[1]) & (~I[0]);
  assign D[1] = (~I[1]) & (I[0]);
  assign D[2] = (I[1]) & (~I[0]);
  assign D[3] = (I[1]) & (I[0]);
  
endmodule
