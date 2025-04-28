module xnor_3input (a,b,c,y);
  input a,b,c;
  output y;
  wire w1,w2;

  mux_2_1 m1 ({c,~c},b,w1);
  mux_2_1 m2 ({~c,c},b,w2);
  mux_2_1 m3({w2,w1},a,y);

endmodule
