module comparator_4bit(a,b,gt,st,eq);
  input [3:0] a,b;
  output reg gt,st,eq;
  
  always@(a,b) begin
    gt=(a>b);
    st=(a<b);
    eq=(a==b);
    
  end
  
endmodule
