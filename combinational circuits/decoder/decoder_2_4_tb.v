module decoder_2_4_tb;
  reg [1:0] I;
  wire [3:0] D;
  
  decoder_2_4(I,D);
  
  initial begin
    
    $monitor("time=%0t , I=%0b, D=%0b",$time,I,D);
    
    I=2'b00; #10;
    I=2'b01; #10;
    I=2'b10; #10;
    I=2'b11; #10;
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,I,D);
  end
  
endmodule
