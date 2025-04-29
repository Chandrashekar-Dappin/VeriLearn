module encoder_4_2(D,I);
  input [3:0] D;
  output reg [1:0] I;
  
  always @ (D) begin
    case(D)
      4'b0001 : I = 2'b00;
      4'b0010 : I = 2'b01;
      4'b0100 : I = 2'b10;
      4'b1000 : I = 2'b11;
      default : $display("error");
    endcase
    
  end
  
endmodule
  
