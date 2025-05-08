module funct(a,b,c,d);
  input a,b,c;
  output d;
  
  function andd(x,y,z);
      andd = x & y & z;
  endfunction
      
  assign d = andd(a,b,c);
      
endmodule


//  Test Bench

module test;
  reg a,b,c;
  wire d;
  
  funct dut(a,b,c,d);
  
  initial begin
    a=1; b=1; c=1;
    
    #10 $display(" a = %d | b = %d | c = %d | d = %d ",a,b,c,d);
    
    a=0; b=1; c=0;
    
    #10 $display(" a = %d | b = %d | c = %d | d = %d ",a,b,c,d);
    
  end
  
endmodule

// Output
a = 1 | b = 1 | c = 1 | d = 1 
a = 0 | b = 1 | c = 0 | d = 0 

