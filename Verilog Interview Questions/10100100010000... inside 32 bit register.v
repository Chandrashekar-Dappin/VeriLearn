module pattern;
  
  reg [0:31] a;
  
  int count;
  
  initial begin
    for(int i=1; i<8; i++) begin
      
      a[count] = 1'b1;
      count++;
      
      for(int j=0; j<i; j++) begin
        a[count] = 1'b0;
        count++;
      end
      
    end
    
    $display(" a = %b",a);
    
  end
  
endmodule

//Output
a = 10100100010000100000100000010000
