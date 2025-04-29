module test;
  reg [3:0] D;
  wire [1:0] I;
  
  encoder_4_2 dut(D,I);
  
  initial begin
    $monitor("D=%b, I=%b",D,I);
    D=4'b0001;
    #10 D=4'b0010;
    #10 D=4'b0100;
    #10 D=4'b1000;
    
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
  end
  
endmodule
  
