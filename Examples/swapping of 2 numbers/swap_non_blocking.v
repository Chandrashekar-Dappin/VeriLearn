module swap;
  reg [3:0] a,b;
  
  
  initial begin
    a=4;     // active region
    b=6;

    a<=b;    // non blocking region   //a=6
    b<=a;                             //b=4
    
    $monitor("a=%d,b=%d",a,b);   //executes at non blocking region
    
  end
endmodule
