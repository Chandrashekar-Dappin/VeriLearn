module mux_N_1 #(parameter N = 4) (sel,I,y);
  
  input [N-1:0] I;
  input [$clog2(N)-1:0] sel;
  output y;
  
  assign y = (sel==2'b11) ? I[3] : (sel==2'b10) ? I[2] : (sel==2'b01) ? I[1] : I[0] ;
  
endmodule



module tb;
  
  reg [dut.N-1 : 0] I;
  reg [$clog2(dut.N)-1:0] sel;
  wire y;
  
  mux_N_1 dut (sel,I,y);
  
  initial begin
    
    I = 4'b1110; sel = 2'b00;
    repeat(7)
     #1 sel = sel+1;
    
  end
  
  initial $monitor("I = %b sel = %b Y = %b",I,sel,y);
  
endmodule
  
