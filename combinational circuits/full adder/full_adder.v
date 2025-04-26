module full_adder(a,b,c,s,cout);
input a,b,c;
output s,cout;      // declaration of ports

assign s = a ^ b ^ c;   
assign cout = (a & b) | (b & c ) | (c & a);

endmodule
