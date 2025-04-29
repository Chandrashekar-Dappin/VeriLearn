module encoder_4_2(D,I);
  input [3:0] D;
  output reg[1:0] I;
  
  always @ (D) begin
    if (D[0]) I=2'b00;
    else if (D[1]) I=2'b01;
    else if (D[2]) I=2'b10;
    else if (D[3]) I=2'b11;
    else I=3'b000;

    
  end
  
endmodule
