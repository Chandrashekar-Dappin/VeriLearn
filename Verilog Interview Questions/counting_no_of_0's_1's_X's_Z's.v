
module tb;
  
  reg [7:0] a=8'b1001xzxz;
  reg [3:0] count0 = 0, count1 = 0, countx = 0, countz =0;
  
  initial begin
    
    for(integer i = 0; i<8; i=i+1) begin
      if(a[i] == 0)
        count0 = count0+1;
      else if(a[i] == 1)
        count1 = count1+1;
      else if(a[i] === 1'bx)
        countx = countx+1;
      else
        countz = countz+1;
      
      
      //using case
      // case(a[i])
      //   1'b0: count0 = count0+1;
      //   1'b1: count1 = count1+1;
      //   1'bx: countx = countx+1;
      //   1'bz: countz = countz+1;
      // endcase
      
    end
    
    $display("0's:%0d  1's:%0d  X's:%0d  Z's:%0d",count0,count1,countx,countz);
    
  end
  
endmodule
