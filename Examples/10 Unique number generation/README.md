```
module unique_numbers;
  integer data[10];
  integer i,index,temp,num;
  
  initial begin
    index = 0;
    
    while(index!=10) begin
      
      temp = {$random}%201;
      
      loop : begin
      for(i=0; i<10; i=i+1) 
        if(data[i] == temp)
          disable loop;
        
        
        data[i] = temp;
        num=temp;
        index=index+1;
        #2;
        
      end
      
    end
    
  end
  
  initial $monitor("num = %0d",num);
  
endmodule
          
```
