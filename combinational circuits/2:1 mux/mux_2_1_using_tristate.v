module mux_2_1_using_tristate(I,s,y);
  input [1:0] I;
  input s;
  output y;
  
  bufif0 b1 (y,I[0],s);
  bufif1 b2 (y,I[1],s);
  
endmodule
