module test;
  reg clk,rst,t;
  wire q;
  
  tlatch dut(t,clk,rst,q);
  
  initial begin
    clk=0;
    rst=1;
    #10 rst=0;
    t=0;
    #5 t=1;
    #5 t=0;
    #5 t=1;
    #5 t=0;
    #50 $finish;
  end
  
  initial begin
    $monitor("sim time=%0t, t=%0b, q=%0b",$time,t,q);
  end
  
  always #5 clk=~clk;

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
  end
  
endmodule
    
