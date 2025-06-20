module PISO(clk,rst,parallel_in,load,serial_out);
  input clk,rst,load;
  input [3:0] parallel_in;
  output serial_out;
  
  reg [3:0] data;
  
  always@(posedge clk) begin
    
    if(rst) 
      data = 4'b0000;

    else if(load)
      data <= parallel_in;
    
    else
      data <= {1'b0,data[3:1]};
        
  end
  
  assign serial_out = data[0];
  
endmodule




module tb;
  
  reg clk,rst,load;
  reg [3:0] parallel_in;
  wire serial_out;
  
  PISO dut(clk,rst,parallel_in,load,serial_out);
  
  initial begin;
    clk = 1;
    rst = 1;
    #8 rst = 0;
    
    load = 1;
    parallel_in = 4'b1101;
    #4 load = 0;
  end
  
  always #2 clk <= ~clk;
  
  initial begin
    $monitor("time : %0t | reset : %b | load = %b | parallel_in : %b : Serial_out : %b | data : %b",$time,rst,load ,parallel_in,serial_out,dut.data);
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
    #100 $finish;
  end
  
  
endmodule
