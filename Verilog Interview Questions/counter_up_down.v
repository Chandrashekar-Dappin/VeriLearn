module counter(clk,rst,ctrl,count);
  input clk,rst,ctrl;
  output reg [2:0] count;
  
  always@(posedge clk) begin
    if(rst) begin
      count <= 0;
    end
    
    else if(ctrl)
      count <= count+1;

    
    else
      count <= count-1;
    
  end
  
endmodule



module tb;
  reg clk,rst,ctrl;
  wire [2:0] count;
  
  counter(clk,rst,ctrl,count);
  
  initial begin
    clk=0;
    rst=1;
    #13 rst=0;
    ctrl = 0;
    #14 ctrl = 1;
    #30 ctrl = 0;
  end
  
  
  always #2 clk <= ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
    #100 $finish;
  end
  
endmodule
