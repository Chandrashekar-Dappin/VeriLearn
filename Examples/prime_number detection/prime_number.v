module prime_number(N,is_prime);
  input [31:0] N;
  output reg is_prime;
  integer i;
  
  always@(*) begin
    is_prime = 1;
    if(N<=1)
      is_prime = 0;
    
    else
      for(i=2; i<=N/2 ; i=i+1) begin
        if(N%i == 0) 
          is_prime = 0;
      end
    
  end
  
endmodule


module Prime_number_tb;
  reg [31:0] N;
  wire is_prime;
  
  prime_number dut(N,is_prime);
  
  initial begin
    N = 5;
    #5 N = 6;
    #5 N = 7;
    #5 N = 13;
    #5 N = 20;
    #5 N = 1;
  end
  
  initial begin
    forever@(N,is_prime) begin
      if(is_prime == 0 )
        $display("%d is not a prime number",N);
      else
        $display("%d is a prime number",N);
    end
  end
  
endmodule
