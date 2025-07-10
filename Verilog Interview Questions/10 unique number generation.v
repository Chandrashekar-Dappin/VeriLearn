module unique_number;
  
  integer rec[0:9];
  integer i,temp,num,index=0;
  
  initial begin
    $monitor("num=%0d",num);
    
    while(index!=10) begin
      temp = {$random}%201;
      
      begin:loop
        
        for(i=0; i<index; i=i+1)
          if(rec[i]==temp)
            disable loop;
        
        rec[index] = temp;
        index=index+1;
        num=temp;
        #2;
        
      end
      
    end
    
  end
  
endmodule
