module mux_2_1(sel,I,Y);
  input sel;
  input [1:0] I;
  output Y;
  
  assign Y = (sel) ? I[1] : I[0];
  
endmodule


module mux_4_1(sel,I,Y);
  input [1:0] sel;
  input [3:0] I;
  output Y;
  
  wire y1,y2;
  
  mux_2_1 dut1(sel[0],{I[1],I[0]},y1);
  mux_2_1 dut2(sel[0],{I[3],I[2]},y2);
  mux_2_1 dut3(sel[1],{y2,y1},Y);
  
endmodule



module tb;
  reg [1:0] sel;
  reg [3:0] I;
  wire Y;
  
  mux_4_1 dut(sel,I,Y);
  
  initial begin
    sel = 2'b00;
    repeat(4) begin
    for(int i=0 ; i<16 ; i++) begin
       I = i; #1;
    end
      sel++;
    end
    
  end
  
  
  initial begin
    $monitor("sel = %b I = %b Y = %b",sel,I,Y);
  end
  
endmodule
