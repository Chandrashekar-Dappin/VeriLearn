module even_odd(num,y);
  input [7:0] num;
  output reg y;
  
  function even( [7:0] num);
    begin
      if(num[0] == 0)
        even = 1;
      else
        even = 0;
    end
  endfunction
  
  assign y = even(num);
  
endmodule


//TestBench

module test;
  reg [7:0] num;
  wire y;
  
  even_odd dut(num,y);
  
  initial begin
    
    num=5;
    #5 $display("number = %0d | even status = %b",num,y);
    
    num=8;
    #5 $display("number = %0d | even status = %b",num,y);
    
  end
  
endmodule


//Output
number = 5 | even status = 0
number = 8 | even status = 1
