module star;
  integer i,j;
  
  initial begin
    for(i=0; i<5;i=i+1) begin
      for(j=0; j<5-i ; j=j+1) begin
        $write("* ");   
      end
      $display();
    end
  end
endmodule


