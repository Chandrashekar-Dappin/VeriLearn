## if any input is assigned which is in between the evaluation delay of a output...then it does not reflect on output
## Ex:
```
module delay_check(a,b);
  
  input [31:0]a;
  output reg [31:0] b;
  
  always@(a) begin
    #4 b = #3 a;
  end
  
endmodule



module tb;
  reg [31:0]a;
  wire [31:0] b;
  
  delay_check dut(a,b);
  
  initial begin
    
    a=5;
    
    #5 a=8;  //does not reflect
    
    #4 a=15; //reflects as o/p is evaluated at 7ns but it is at 9ns 
    
    #5 a=33; //does not reflect as it's b/w the evaluation i.e 14ns b/w time 9-16
    
    #10 a=12;//reflects as o/p is evaluated at 16ns but it is at 19ns
    
  end
  
  initial $monitor("time :%0t b = %0d  a = %0d",$time,b,a);
  
endmodule
```

## Output
```
time :0 b = x  a = 5
time :5 b = x  a = 8
time :7 b = 5  a = 8
time :9 b = 5  a = 15
time :14 b = 5  a = 33
time :16 b = 15  a = 33
time :24 b = 15  a = 12
time :31 b = 12  a = 12
```
