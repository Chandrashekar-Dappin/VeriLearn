module SISO(clk,rst,serial_in,serial_out);
  input clk,rst,serial_in;
  output serial_out;
  
  reg [3:0] data;
  
  always@(posedge clk) begin
    
    if(rst)
      data = 4'b0000;
    
    else
      data = {serial_in,data[3:1]};
    
  end
  
  assign serial_out = data[0];
  
endmodule




module tb;
  
  reg clk,rst,serial_in;
  wire serial_out;
  
  SISO dut(clk,rst,serial_in,serial_out);
  
  initial begin;
    clk = 1;
    rst = 1;
    #4 rst = 0;
    
    
    serial_in =1;
    #4serial_in=0;
    #4serial_in =1;
    #4serial_in =0;
  end
  
  always #2 clk <= ~clk;
  
  initial begin
    $monitor("time : %0t | reset : %b | serial_in : %b : Serial_out : %b | data : %b",$time,rst,serial_in,serial_out,dut.data);
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
    #100 $finish;
  end
  
  
endmodule
  
