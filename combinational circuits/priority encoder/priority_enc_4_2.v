module priority_enc_4_2(D,I);
  input [3:0]D;
  output [1:0]I;
  
  assign I[0] = D[3] | ((~D[2]) & D[1]);
  assign I[1] = D[3] | D[2];
  
endmodule
