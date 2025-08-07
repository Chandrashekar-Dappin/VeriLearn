module primee(N,is_prime);
  
  input [31:0] N;
  output is_prime;
  
  assign is_prime = primeee(N);
  
  
  function primeee(input [31:0] N);
    primeee = 1;
    
    if(N<2)
      primeee = 0;
     
      for(integer i=2; i<=N/2; i=i+1)
        if(N%i == 0) begin
          primeee = 0;
        end
    
  endfunction
  
endmodule







module tb;
  
  reg [31:0] N;
  wire is_prime;

  primee dut(N,is_prime);
  
  initial begin
    
    N = 10;
    #1 N = 5;
    #1 N = 7;
    #1 N = 15;
    #1 N = 13;
    
  end
  
  always@(N) begin
    if(is_prime == 0)
      $display("%0d is not a prime number",N);
    else
      $display("%0d is a prime number",N);
  end
  
endmodule

//output
10 is not a prime number
5 is a prime number
7 is a prime number
15 is not a prime number
13 is a prime number
