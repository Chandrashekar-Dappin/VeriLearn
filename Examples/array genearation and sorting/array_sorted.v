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


// 2nd method
module tb;
  
  int a[10] = '{9,8,7,6,5,4,3,2,1,0};
  int temp;
  
  initial begin
    
    for(int i=0; i<10; i++)
      
      for(int j=0; j<i; j++) begin
        
        if(a[j] > a[i]) begin
          temp = a[j];
          a[j] = a[i];
          a[i] = temp;
        end
           
      end
    
    $display(a);
    
  end
  
endmodule
