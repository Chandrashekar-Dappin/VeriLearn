module n_to_nsqr (n,N);
  input [1:0] n;
  output [3:0] N;
  
  assign N[3] = n[1] & n[0];
  assign N[2] = n[1] & (~n[0]);
  assign N[1] = 0;
  assign N[0] = n[0];
  
endmodule
