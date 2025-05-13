module factorial (input [31:0] N, output [63:0] facto);

assign facto= fact(N);

function automatic [63:0] fact(input [31:0] N);
	begin
	if(N>=1)
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
