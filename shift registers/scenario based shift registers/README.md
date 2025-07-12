### 64 bit arithmetic shift register with sync. load .the shifter can shift both left and right and by 1 or 8 times. write TB and verify it.

### Code:
```
module shift_req_64bit(clk,rst,load,sel,data_in,data_out);
  input clk,rst,load;
  input [1:0] sel;
  input [63:0] data_in;
  output [63:0] data_out;
  
  reg [63:0] mem;
  
  always@(posedge clk) begin
    if(rst)
      mem <= 0;
    
    else if(load)
        mem <= data_in;
    
    else
      case(sel)
        2'b00: mem <= mem >> 1;
        2'b01: mem <= mem >> 8;
        2'b10: mem <= mem << 1;
        2'b11: mem <= mem << 8;
        default: mem <= mem;
      endcase
    
  end
  
  assign data_out = mem;
  
endmodule


module tb;
  
  reg clk,rst,load;
  reg [1:0] sel;
  reg [63:0] data_in;
  wire [63:0] data_out;
  
  
  shift_req_64bit dut(clk,rst,load,sel,data_in,data_out);
  
  initial begin
    clk = 0;
    rst = 1;
    #10 rst = 0;
    
    load = 1;
    data_in = 64'b1100110001;
    sel = 2'b00;
    #10 load = 0;
    
    #40 sel = 2'b10;
    
    #80 sel = 2'b01;
    
    #10 sel = 2'b11;
    
    #200 $finish;
    
  end
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars(1,tb);
  end
  
endmodule

```

### Output

<img width="1408" height="185" alt="image" src="https://github.com/user-attachments/assets/9daade32-3b33-4451-9cfa-51562dabc07b" />
