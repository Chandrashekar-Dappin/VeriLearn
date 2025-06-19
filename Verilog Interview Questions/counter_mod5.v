module counter(clk,rst,count);
  input clk,rst;
  output reg [2:0] count;
  
  always@(posedge clk) begin
    if(rst || count == 4)
      count <= 0;
    
    else
      count <= count+1;
    
  end
  
endmodule



module tb;
  reg clk,rst;
  wire [2:0] count;
  
  counter(clk,rst,count);
  
  initial begin
    clk=0;
    rst=1;
    #13 rst=0;
  end
  
  
  always #4 clk <= ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
    #100 $finish;
  end
  
endmodule

