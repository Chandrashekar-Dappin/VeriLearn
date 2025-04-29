module decoder_2_4(I,D);
  
  input [1:0] I;
  output reg [3:0] D;
  
  always@(I) begin
    case(I)
      2'b00 : D=4'b0001;
      2'b01 : D=4'b0010;
      2'b10 : D=4'b0100;
      2'b11 : D=4'b1000;
      default : $display("error");
      
    endcase
    
  end
  
endmodule
  


module test;
  reg [1:0] I;
  wire [3:0] D;
  
  decoder_2_4  dut(I,D);
  
  initial begin
    $monitor("I=%b, D=%b",I,D);
    I=2'b00;
    #10 I=2'b01;
    #10 I=2'b10;
    #10 I=2'b11;
    
    
    
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,test);
  end
  
endmodule
