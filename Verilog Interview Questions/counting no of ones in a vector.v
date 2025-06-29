module counts(N,ones);
  
  input [7:0] N;
  output reg [3:0] ones = 0;
  
  always@(N) begin
    for(int i=0; i<8 ;i++) begin
      if(N[i] == 1)
        ones++;
    end
      
  end
  
endmodule 



module tb;
  
  reg [7:0]N;
  wire [3:0] ones;
  
  counts dut(N,ones);
  
  initial begin
    
    N = 8'b10011111;
    
    #1 $display("no of ones = %0d",ones);
    
  end
  
endmodule
        
