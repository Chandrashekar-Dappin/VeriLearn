## 1. 2 switches S1,S2 controls bulbs B1,B2,B3.  only one bulb should be glown at a time. there is main switch S which controls all 3 bulbs .  when S is on S1 ,S2 functions as usual . when S is off neither of bulb is glown.
### DUT:
```
module bulb_control(S_main,S,B);
  input S_main;   //main switch
  input [1:0] S;  // switches S1, S2
  output reg [2:0]B;   // Bulbs B1,B2,B3
  
  always@(S_main,S) begin
    
    if(!S_main)
      B = 3'b000;
    
    else
      case(S)
        2'b00: B=3'b000;
        2'b01: B=3'b001;
        2'b10: B=3'b010;
        2'b11: B=3'b100;
        default: B=3'b000;
      endcase
    
  end
  
endmodule
```
### TB:
```
module tb;
  
  reg S_main;
  reg [1:0] S;
  wire [2:0]B;
  
  bulb_control dut(S_main,S,B);
  
  initial begin
    S_main = 0;
    #2 S=2'b10;
    #3 S=2'b11;
    
    #1 S_main = 1;
    #2 S=2'b10;
    #3 S=2'b11;
    
  end
  
  initial $monitor("S_main = %0d	S = %b		B = %b",S_main,S,B);
  
endmodule
```

### Output
```
S_main = 0	S = xx		B = 000
S_main = 0	S = 10		B = 000
S_main = 0	S = 11		B = 000
S_main = 1	S = 11		B = 100
S_main = 1	S = 10		B = 010
S_main = 1	S = 11		B = 100
```


## 2. verilog code for y = 32*N + 10;   where N=6 bit number
```
module arith_op(N,Y);
  input [5:0]N;
  output [10:0] Y;
  
  assign Y = (5<<N) + 10;  // mult by 32 is left shift by $clog2(32)=5
  
endmodule


module tb;
  
  reg [5:0]N;
  wire [10:0] Y;
  
  arith_op dut(N,Y);
  
  initial begin
    N=6'b100001;
    #1 N=6'b000100;
    #1 N=6'b000111;
    #1 N=6'b001100;
    #1 N=6'b000101;
  end
  
  initial $monitor("N = %0d  Y = %0d",N,Y);
  
endmodule
    
```

### Output
```
N = 33  Y = 10
N = 4  Y = 90
N = 7  Y = 650
N = 12  Y = 10
N = 5  Y = 170
```
