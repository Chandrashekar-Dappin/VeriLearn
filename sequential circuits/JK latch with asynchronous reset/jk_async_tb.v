module test;
  reg clk,rst,j,k;
  wire q;
  
  jklatch dut(j,k,clk,rst,q);
  
  initial begin
    clk=0;
    rst=1;
    #10 rst=0;
    j=0; k=0;
    #10 k=1;
    #10 j=1; k=0;
    #10 k=1;
    #50 $finish;
  end
  
  initial begin
    $monitor("sim time=%0t, j=%0b, k=%0b, q=%0b",$time,j,k,q);
  end
  
  always #5 clk=~clk;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
  end
  
endmodule
