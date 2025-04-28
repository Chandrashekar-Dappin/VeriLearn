module b_to_g (b,g);
  input [2:0] b;
  output [2:0] g;
  
  assign g[2] = b[2];
  assign g[1] = b[2]^b[1];
  assign g[0] = b[1]^b[0];
  
endmodule
