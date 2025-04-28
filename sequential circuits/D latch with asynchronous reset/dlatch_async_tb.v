module test;
  reg clk,rst,d;
  wire q;
  
  initial begin
    clk=0;
    rst=1;
    #10 rst=0;
    d=0;
    #5 d=1;
    #5 d=0;
  end
  
  initial begin
    $monitor("sim time=%0t, d=%0b, q=%0b",$time,d,q);
  end
  
  always #5 clk=~clk;
  
  
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
  end
  
endmodule
    
        
