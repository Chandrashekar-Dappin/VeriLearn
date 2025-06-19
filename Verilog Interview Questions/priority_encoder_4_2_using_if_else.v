module pririty_enc_4_2(D,I);
  input [3:0]D;
  output reg[1:0]I;
  
  always@(D) begin
    
    if(D[3])
      I = 2'b11;
    
    else if(D[2])
      I = 2'b10;
    
    else if(D[1])
      I = 2'b01;
    
    else if(D[0])
      I = 2'b00;
    
    else
      I = 2'b00;
    
  end
  
endmodule



module tb;
  reg [3:0] D;
  wire [1:0] I;
  
  pririty_enc_4_2 dut(D,I);
  
  initial begin
    $monitor(" D = %b I = %b",D,I);
    D = 4'b0010;
    #1 D = 4'b1001;
    #1 D = 4'b0110;
    #1 D = 4'b0001;
    #1 D = 4'b1111;
    
  end
    
endmodule
