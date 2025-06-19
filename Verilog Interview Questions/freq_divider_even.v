module tb;
  reg clk1=0,clk2=0;
  
  always #10 clk1 = ~clk1;
  
  always@(posedge clk1)
    clk2 = ~clk2;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    #100 $finish;
  end
  
endmodule
