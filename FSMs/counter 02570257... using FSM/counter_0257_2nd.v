
module count_0257 (
  input clk,
  input rst,
  output reg [2:0] count
);

  // State encoding as parameters
  parameter s0 = 3'b000;
  parameter s2 = 3'b010;
  parameter s5 = 3'b101;
  parameter s7 = 3'b111;

  // Registers for present and next states
  reg [2:0] ps, ns;

  // State register (sequential logic)
  always @(posedge clk or posedge rst) begin
    if (rst)
      ps <= s0; // Go to initial state on reset
    else
      ps <= ns; // Update current state
  end

  // Next-state logic (combinational)
  always @(*) begin
    case (ps)
      s0: ns = s2;
      s2: ns = s5;
      s5: ns = s7;
      s7: ns = s0;
      default: ns = s0;
    endcase
  end

  // Output logic: output is current state
  always @(*) begin
    count = ps;
  end

endmodule


module tb;
  reg clk,rst;
  wire [2:0] count;
  
  count_0257 dut(clk,rst,count);
  
  initial begin
    clk = 0;
    rst = 1;
    #12 rst = 0;
    #100 $finish;
  end
  
  always #5 clk = ~clk;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,tb);
  end
  
endmodule
