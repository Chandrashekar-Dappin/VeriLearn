## write a functions which performs shifting by 2 positions right ctrl=1 else shifts 2 positions left 
```
module shifting(clk,rst,ctrl,data_in,data_out);
  
  input clk,rst,ctrl;
  input  [3:0] data_in;
  output reg [3:0]data_out;
  
  
  function [3:0] shift(ctrl,[3:0] data);
    if(ctrl)
      shift = data >> 2;
    
    else
      shift = data << 2;
  endfunction
  
  always@(posedge clk) begin
    if(rst)
      data_out <= 0;
    
    else
      data_out <= shift(ctrl,data_in);
    
  end
  
endmodule


module tb;
  
  reg clk,rst,ctrl;
  reg [3:0] data_in;
  wire [3:0] data_out;
  
  shifting dut(clk,rst,ctrl,data_in,data_out);
  
  initial begin
    clk = 0;
    rst =1;
    #10 rst =0;
    ctrl = 1;
    data_in = 4'b1011;
    #20 ctrl = 0;
    data_in = 4'b1011;
    #200 $finish;
  end
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
  end
  
endmodule

```

## Output
<img width="1828" height="282" alt="image" src="https://github.com/user-attachments/assets/9f3fadee-0a42-4f97-bbbe-c9acdfeec04e" />
