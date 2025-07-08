module prime_detect(input [31:0] N, output reg is_prime);
  
  always@(N) begin
    
    is_prime = 1;
    if(N<=1)
      is_prime = 0;
    
    else
    for(int i=2; i<=N/2; i=i+1)
      if(N%i == 0)begin
        is_prime = 0;
        break;
      end
    
  end
  
endmodule



module tb;
  reg [31:0] N;
  wire is_prime;
  
  prime_detect dut(N,is_prime);
  
  initial begin
    N=12;
    #1 N=19;
    #1 N=7;
    #1 N=15;
    #1 N=17;
    #1 N=1999;
    
  end
  
  initial
    forever@(N,is_prime) begin
      #1;
      if(is_prime == 0)
        $display("%0d not prime",N);
      else
        $display("%0d  prime",N);
    end
  
endmodule
