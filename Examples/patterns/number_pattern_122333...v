module numbers;
  integer i,j;
  
  initial begin
    for(i=1 ; i<=5 ; i=i+1) begin
      for (j=1 ; j<=i ; j=j+1) begin
        $write("%0d ",i);
      end
      $display();
    end
    
  end
  
endmodule



//1 2 2 3 3 3 4 4 4 4 5 5 5 5 5 
