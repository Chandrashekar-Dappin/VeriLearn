module test;
  
  reg clk,rst,load;
  reg [5:0] data;
  wire [5:0] count;
  
  counter_up_load dut(clk,rst,count,load,data);
  
  initial begin
    clk=0;
    rst=1;
    #10 rst=0;
    load=1;
    data=12;
    #10 load=0;
    #100 $finish;
  end
  
  always #2.5 clk=~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
  end
  
endmodule
