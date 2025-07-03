module reverse;
  
  reg [0:7] a,b;
  
  initial begin
    
    a = 8'b10010111;
    $display("a before reverse = %b",a);
    
    for (int i=0; i<8 ;i++)
         b[i] = a[7-i];
    
    $display("a after reverse = %b",b);
         
  end
  
endmodule
