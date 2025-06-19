module prime(N,is_prime);
  input [31:0] N;
  output is_prime;
  
  assign is_prime = primee(N);
  

  function primee(input [31:0] N);
    primee = 1;
    
    if(N<=1)
      primee = 0;
    
    else
      for(int i=2; i<=N/2 ; i++)
        if(N%i == 0) begin
          primee = 0;
          break;
        end
  endfunction
      
  
endmodule
     
    


module tb;
  reg [31:0] N;
  wire is_prime;
  
  prime dut(N,is_prime);
        
  initial begin
    $monitor("%0d's prime status : %0d" ,N,is_prime);
    N =45;
    #2 N = 7;
    #2 N = 43566;
    #2 N = 13;

  end
  
endmodule
