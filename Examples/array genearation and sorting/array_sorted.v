module array_1D;
  integer arr[0:9];
  integer i,j,temp;
  
  initial begin
    $display("descending order array");
    
    for(i=0;i<10;i++) begin
      arr[i] = 10-i;
      $display("arr[%0d] = %0d",i,arr[i]);
    end
  
    
    for(i=0;i<10;i++) begin
      for(j=0;j<10-i;j++)begin
        if(arr[j]>arr[j+1]) begin
          temp = arr[j];
          arr[j] = arr[j+1];
          arr[j+1] = temp;
        end
      end
    end
    
    
    $display("ascending order array");
    for(i=0;i<10;i++) begin
      $display("arr[%0d] = %0d",i,arr[i]);
    end
    
  end
    
    
endmodule
