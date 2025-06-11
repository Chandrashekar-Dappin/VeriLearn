```
module factorial(N,fact);
  input [31:0] N;
  output reg[63:0] fact;
  
  always@(N) begin
    fact =1;
    for(int i = 2 ; i<=N; i=i+1) begin
      fact = fact*i;
    end
    
  end
  
endmodule


module tb;
  reg [31:0] N;
  wire [63:0] fact;
  
  factorial dut(N,fact);
  
  initial begin
    N = 0;
    #5 $display("fact of %0d is %0d",N,fact);
  end
  
endmodule

//Output
fact of 5 is 120
```
