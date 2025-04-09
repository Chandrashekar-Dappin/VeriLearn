module mux_2_1( I0,I1,s,y);
  input I0,I1,s; //input port declaration
  output y;      //output port declaration
  
  assign y = ((~s)&I0) | (s&I1); //assign the logic
  
endmodule
