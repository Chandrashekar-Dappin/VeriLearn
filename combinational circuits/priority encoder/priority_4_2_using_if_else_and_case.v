module prio_encoder(D,I);
  input [3:0]D;
  output reg [1:0] I;
  
  always@(D) begin
//     casex(D)
//       4'b1xxx: I=2'b11;
//       4'b01xx: I=2'b10;
//       4'b001x: I=2'b01;
//       4'b0001: I=2'b00;
//       default: I=2'b00;
//     endcase
    
      //using if-else
      if(D[3])
        I=2'b11;
      else if(D[2]) 
        I=2'b10;
      else if(D[1])
        I=2'b01;
      else
        I=2'b00;
      
    
    
  end
  
endmodule



module tb;
  reg [3:0]D;
  wire [1:0]I;
  
  prio_encoder dut(D,I);
      
  initial begin
    $monitor("D = %b I = %b ",D,I);
    
    D = 4'b1011;
    #1 D = 4'b1001;
    #1 D = 4'b1000;
    #1 D = 4'b0010;
    #1 D = 4'b0111;
    #1 D = 4'b0101;
    #1 D = 4'b1010;
    
    
  end
  
endmodule


//output

D = 1011 I = 11 
D = 1001 I = 11 
D = 1000 I = 11 
D = 0010 I = 01 
D = 0111 I = 10 
D = 0101 I = 10 
D = 1010 I = 11
