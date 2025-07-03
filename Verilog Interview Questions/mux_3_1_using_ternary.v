module mux_3_1(sel,I,y);
  
  input [2:0] I;
  input [1:0] sel;
  output y;
  
  assign y = (sel == 2'b00) ? I[0] : (sel == 2'b01) ? I[1] : (sel == 2'b10) ? I[2] : 1'b0;
  
endmodule


module tb;
  
  reg [2:0] I;
  reg [1:0] sel;
  wire y;
  
  mux_3_1 dut(sel,I,y);
  
  initial begin
    
    //sel = 2'b00;
    for(int i = 0 ; i<2**5 ;i++) begin
      {sel,I} = i;
      #1;
    end
    
  end
  
  initial begin
    $monitor("sel = %b I = %b Y = %b",sel,I,y);
    
  end
  
endmodule


