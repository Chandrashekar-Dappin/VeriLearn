module star_incerement;
  integer i,j;

  initial begin
    for(i=0 ; i<5 ; i=i+1) begin
      for(j=0 ; j<=i ; j=j+1) begin
        $write("* ");
      end
      $display(""); //for new line
    end
  end

endmodule
