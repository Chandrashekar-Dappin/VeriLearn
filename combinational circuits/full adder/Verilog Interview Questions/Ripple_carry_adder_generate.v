module full_adder (
    input  a, b, cin,
    output sum, cout
);
  assign sum  = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (cin & a);
endmodule



module ripple_carry_adder_4bit (
    input  [3:0] a, b,
    input        cin,
    output [3:0] sum,
    output       cout
);

  wire [3:0] carry;

  genvar i;
  generate
    for (i = 0; i < 4; i = i + 1) begin : FA_CHAIN
      if (i == 0) begin
        full_adder fa (
          .a(a[i]), .b(b[i]), .cin(cin),
          .sum(sum[i]), .cout(carry[i])
        );
      end else begin
        full_adder fa (
          .a(a[i]), .b(b[i]), .cin(carry[i-1]),
          .sum(sum[i]), .cout(carry[i])
        );
      end
    end
  endgenerate

  assign cout = carry[3];

endmodule

module tb_ripple_carry_adder_4bit;

  reg  [3:0] a, b;
  reg        cin;
  wire [3:0] sum;
  wire       cout;

  ripple_carry_adder_4bit rca (
    .a(a), .b(b), .cin(cin),
    .sum(sum), .cout(cout)
  );

  initial begin
    $display("A    B    Cin | Sum  Cout");
    $display("--------------------------");
    for (int i = 0; i < 16; i++) begin
      for (int j = 0; j < 16; j++) begin
        a = i; b = j; cin = 0; #1;
        $display("%b %b  %b   | %b   %b", a, b, cin, sum, cout);
      end
    end
  end

endmodule
