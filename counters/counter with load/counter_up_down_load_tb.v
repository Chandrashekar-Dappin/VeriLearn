module test;
  
  reg clk,rst,load,up_down;
  reg [5:0] data;
  wire [5:0] count;
  
  counter_up_load dut(clk,rst,count,load,data,up_down);
  
  initial begin
    clk=0;
    rst=1;
    #10 rst=0;
    load=1;
    data=12;
    #10 load=0;
    up_down=1;
    #40 up_down=0;
    #30 up_down=1;
    #100 $finish;
  end
  
  always #2.5 clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
  end
  
endmodule
