module tb;
  
  reg signed [4:0] a;
  reg [4:0] b;
  reg [4:0] y;
  
  initial begin
    
    a = -5'b01011;     // check also for unsigned 
    b = 4'b1;
    y = a >>> b;
    
    $display("a = %b ",a);
    $display("b = %b ",b);
    $display("y = %b ",y);
    
  end
  
  
endmodule

// output
// a = 10101 
// b = 00001 
// y = 11010
