module ram(clk,en,we,data_in,addr,data_out);
  input clk,en,we;
  input [7:0] data_in;
  input [2:0] addr;
  output reg [7:0] data_out;
  
  reg [7:0] mem [7:0];
  
  initial begin
    data_out = 8'd0;
  end
  
  always@(posedge clk) begin
    
    if(en)
      if(we)
        mem[addr] <= data_in;
    
      else
        data_out <= mem[addr];
    
    else
      data_out <= data_out;
    
  end
  
endmodule



module tb;
  reg clk,en,we;
  reg [7:0] data_in;
  reg [2:0] addr;
  wire [7:0] data_out;
  
  ram dut(clk,en,we,data_in,addr,data_out);
  
  
  initial begin
    
    clk = 0;
    data_in = 8'd0;
    en = 0;
    we = 0;
    
    #15;
    en = 1; we = 1; addr = 3'd3; data_in = 8'd77;
    
    #10 addr = 3'd5; data_in = 8'd144;
    
    #10 we = 0; addr = 3'd5;
    
    #10 addr = 3'd3;
    
  end
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
    #100 $finish;
  end
  
endmodule
  
    
