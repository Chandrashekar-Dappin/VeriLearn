## case : 0,1,x,z,? are treated individually
## casez : 0,1,x treated individually ........ z,? treated as don't care
## casex : 0,1 treated individually ........ x,z,? treated as don't care

## NOTE : in casez we can pass z and ? from inputs also and write it in casez alternatives also..it takes both side
```
module casee(sel,out);
  
  input [1:0] sel;
  output reg [2:0] out;
  
  always@(sel)
    casez(sel)
      2'b00 : out = 1;
      2'b01 : out = 2;
      2'b10 : out = 3;
      2'b11 : out = 4;
      default : out = 0;
      
    endcase
  
endmodule


module tb;
  
  reg [1:0] sel;
  wire [2:0] out;
  
  casee dut(sel,out);
  
  initial begin
    
    sel = 2'b00;
    #1 sel = 2'b1x;
    #1 sel = 2'bz0;
    #1 sel = 2'b10;
    #1 sel = 2'bz1;        // out = 2 as it treats z as don't care
  end
  
  initial $monitor(" sel = %b out = %0d",sel,out);
  
endmodule
```

## Output
```
 sel = 00 out = 1
 sel = 1x out = 0
 sel = z0 out = 1
 sel = 10 out = 3
 sel = z1 out = 2         
```

## NOTE : in casex we can pass x, z and ? from inputs also and write it in casex alternatives also..it takes both side
```
module casee(sel,out);
  
  input [1:0] sel;
  output reg [2:0] out;
  
  always@(sel)
    casex(sel)
      2'b0x : out = 1;
      2'b0? : out = 2;
      2'bz1 : out = 3;
      2'b1x : out = 4;
      default : out = 0;
      
    endcase
  
endmodule





module tb;
  
  reg [1:0] sel;
  wire [2:0] out;
  
  casee dut(sel,out);
  
  initial begin
    
    sel = 2'b00;
    #1 sel = 2'b1x;
    #1 sel = 2'bz0;
    #1 sel = 2'b10;
    #1 sel = 2'bz1;
  end
  
  initial $monitor(" sel = %b out = %0d",sel,out);
  
endmodule
```

## Output
```
 sel = 00 out = 1
 sel = 1x out = 3
 sel = z0 out = 1
 sel = 10 out = 4
 sel = z1 out = 1
```
