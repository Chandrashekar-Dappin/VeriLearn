module full_adder(input a,b,cin,output reg sum,carry);
  
  task FA(input a,b,cin,output sum,carry);
    begin
    {carry,sum} = a+b+cin;
    end
  endtask
  
  always@(a,b,cin)
    FA(a,b,cin,sum,carry);
  
endmodule
  


module tb;
  
  reg a,b,cin;
  wire sum,carry;
  
  full_adder( a,b,cin, sum,carry);
  
  initial begin
    
    {a,b,cin} = 3'b101;
    #1 {a,b,cin} = 3'b111;
    #1 {a,b,cin} = 3'b011;
    #1 {a,b,cin} = 3'b110;
    
  end
  
  initial $monitor("a = %b b = %b cin = %b sum = %b carry = %b",a,b,cin,sum,carry);
  
endmodule
  
// output
// a = 1 b = 0 cin = 1 sum = 0 carry = 1
// a = 1 b = 1 cin = 1 sum = 1 carry = 1
// a = 0 b = 1 cin = 1 sum = 0 carry = 1
// a = 1 b = 1 cin = 0 sum = 0 carry = 1

         

    
       
