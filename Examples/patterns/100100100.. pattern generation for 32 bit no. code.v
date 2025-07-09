module tb;
  
  reg [0:31] a;
  
  initial begin
    
    for(integer i=0; i<32; i=i+1) begin
      if(i%3 == 0)
        a[i] = 1;
      else
        a[i] = 0;
      
    end
    
    $display("a = %b",a);
    
  end
  
endmodule


//Output
a = 10010010010010010010010010010010
