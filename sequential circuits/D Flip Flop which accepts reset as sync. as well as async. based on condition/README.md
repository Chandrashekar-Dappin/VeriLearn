## DFF which accepts reset as sync. as well as async. based on condition
```
module dff_sync_async(clk,rst,set_rst,d,async_rst,sync_rst,q);
  
  input clk,rst,set_rst,d;
  output async_rst,sync_rst;
  output reg q;
  
  assign async_rst = (!set_rst) && rst;   // async_rst=1 when set_rst=0;
  assign sync_rst = (set_rst) && rst;     // sync_rst=1 when set_rst=1;
  
  always@(posedge clk or async_rst) begin
    if(async_rst)
      q <= 0;
    
    else if(sync_rst)
      q <= 0;
    
    else
      q <= d;
    
  end
  
endmodule




module tb;
  
  reg clk,rst,set_rst,d;
  wire async_rst,sync_rst,q;
  
  dff_sync_async dut(clk,rst,set_rst,d,async_rst,sync_rst,q);
  
  initial begin
    
    clk = 0;
    rst = 1;
    
    #13 set_rst = 0;
    
    #20 rst = 0;
    
    d = 1;
    #10 d = 0;
    #10 d = 1;
    
//     #40 set_rst = 1;
    
//     d = 1;
//     #10 d = 0;
//     #10 d = 1;
    #50 $finish;
    
  end
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
  end

  
endmodule
```

