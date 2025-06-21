module fibonacci;
  reg [31:0] fib[10];
  
  initial begin
    fib[0] = 0;
    fib[1] = 1;
    
    for (int i=2; i<10; i++) 
      fib[i] = fib[i-1] + fib[i-2];
    
    $display("fibonacci series :");
    for(int i=0; i<10; i++) begin
      $display("fib[%0d] = %0d",i,fib[i]);
    end
    
    end
  
endmodule
