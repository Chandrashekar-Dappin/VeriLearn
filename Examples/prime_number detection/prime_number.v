// Code your design here
module prime_number(number,is_prime);
  input [31:0] number;
  output reg is_prime;
  integer i;
  
  always@(*) begin
    is_prime = 1;
    if(number<=1)
      is_prime = 0;
    
    else
      for(i=2; i<=number/2 ; i=i+1) begin
        if(number%i == 0) 
          is_prime = 0;
          
      end
    
  end
  
endmodule


module Prime_number_tb;
  reg [31:0] number;
  wire is_prime;
  
  prime_number dut(number,is_prime);
  
  initial begin
        $display("Number       | Is Prime");
        number = 2; #10 $display("%d          | %b", number, is_prime);
        number = 4; #10 $display("%d          | %b", number, is_prime);
        number = 11; #10 $display("%d         | %b", number, is_prime);
        number = 15; #10 $display("%d         | %b", number, is_prime);
        number = 29; #10 $display("%d         | %b", number, is_prime);
        number = 1000003; #10 $display("%d         | %b", number, is_prime);  // Prime
        $finish;
  end
  
endmodule
