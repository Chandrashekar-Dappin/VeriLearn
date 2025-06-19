module prime(N,is_prime);
  input [31:0] N;
  output reg is_prime;
  
  task primee(input [31:0] N,output is_prime);
    
    is_prime = 1;
    
    if(N<=1)
      is_prime=0;
    
    else
      for(int i=2; i<=N/2 ; i++) begin
        if(N%i == 0) begin
          is_prime=0;
          break;
        end
      end
    
   
  endtask
    
  
   always@(N) begin
     primee(N,is_prime);
     $display("%0d's prime status is : %0d",N,is_prime);
   end
  
endmodule
     
    


module tb;
  reg [31:0] N;
  wire is_prime;
  
  prime dut(N,is_prime);
        
  initial begin
    N =45;
    #2 N = 7;
    #2 N = 14;
    #2 N = 13;
    

  end
  
endmodule
