module factorial(input [31:0] N, output [63:0] fact);
  
  assign fact = facto(N);
  
  function automatic [63:0] facto([31:0] N);
    
    if(N<=1)
      facto = 1;
    
    else
      facto = N*facto(N-1);
    
  endfunction
  
endmodule    
    


module tb;
  reg [31:0] N;
  wire [63:0] fact;
  
  factorial dut(N,fact);
        
  initial begin
    $monitor("%0d's factorial is  : %0d" ,N,fact);
    N =45;
    #2 N = 7;
    #2 N = 21;
    #2 N = 13;

  end
  
endmodule
