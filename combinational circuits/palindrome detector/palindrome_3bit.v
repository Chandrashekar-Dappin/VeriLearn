module palindrome_3bit (a,b,c,y);
  input a,b,c;
  output y;
  
  assign y = ~(a^c);
  
endmodule
