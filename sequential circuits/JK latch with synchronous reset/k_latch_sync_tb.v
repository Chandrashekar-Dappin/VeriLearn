
module tb;
  reg j,k,clk,rst;
  wire q;
  
  jk_latch_async dut(j,k,clk,rst,q);
  
  initial begin
    clk=0;
    rst=1;
    #12 rst=0;
    j=0; k=0;
    #5 j=0; k=1;
    #7 j=1; k=0;
    rst=1;
    #4 rst=0;
    #4 j=1; k=1;
    
    #10 $finish;
  end
  
  always #5 clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
  end
  
endmodule
