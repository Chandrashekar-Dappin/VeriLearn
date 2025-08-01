module factorial (input [31:0] N, output [63:0] facto);

assign facto= fact(N);

	function automatic [63:0] fact(input [31:0] N);        //automatic does not require if input and return types are of different size ....but required if both are of same size
	begin
	if(N>1)
	fact= N*fact(N-1); // recursion

	else
	fact= 1; 
	end 
endfunction
endmodule


//--------TB

module fact_tb;
	reg [31:0] N;
	wire [63:0] facto;

	factorial dut(N,facto);

initial begin
	
	N= 3;
	#2 N= 4;
	#2 N= 2;
	#2 N=5;
end

initial begin
  $monitor("the factorial of %0d is = %0d",N,facto);
end
  
endmodule


// Output
the factorial of 3 is = 6
the factorial of 4 is = 24
the factorial of 2 is = 2
the factorial of 5 is = 120
