//Half Adder

module half_adder(a,b,s,c);
input a,b;
output s,c;      // declaration of ports

assign s = a ^ b;   
assign c = a & b;

endmodule
