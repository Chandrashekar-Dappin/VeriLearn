module mux_2_1_using_nand(I,s,y);
  input [1:0] I;
  input s;
  output y;
  wire w1,w2,w3;
  
  nand n1(w1,s);
  nand n2(w2,I[0],w1);
  nand n3(w3,I[1],s);
  nand n4(y,w3,w2);
  
endmodule
