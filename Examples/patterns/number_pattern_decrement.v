module numbers_decrement;
  integer i,j;
  
  initial begin
    for (i=1 ; i<6 ; i=i+1) begin
      for(j=1; j<=6-i ; j=j+1) begin
        $write("%0d ",j);
      end
      
      $display();
    end
    
    end
endmodule
         
