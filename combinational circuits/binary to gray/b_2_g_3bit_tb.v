module b_to_g_tb;
  reg [2:0] b;
  wire [2:0] g;
  
  b_to_g dut(b,g);
  
  initial begin
    
    $monitor("time=%0t , b=%b, g=%b",$time,b,g);
    
    b=3'b000; #10;
    b=3'b001; #10;
    b=3'b010; #10;
    b=3'b011; #10;
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,b,g);
  end
  
endmodule
