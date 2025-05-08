module fibonacci;
  reg [31:0] fib [0:14];
  integer i;
  
  initial begin
    fib[0] = 0;
    fib[1] = 1;
    
    for(i=2; i<15 ; i++) begin
      fib[i] = fib[i-1] + fib[i-2] ;
    end
    
    $display("fibonacci series");
    for(i=0;i<15;i++)begin
      $display("fib[%0d] = %0d",i,fib[i]);
    end
    
  end
  
endmodule
