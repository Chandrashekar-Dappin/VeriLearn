# Alternative code
```
`timescale 1s/1s
module washing_machine (
  input clk,
  input rst,
  input start,
  output reg [10:0] count  // fixed range
);

  reg [2:0] PS, NS;

  // FSM states
  parameter idle  = 3'b000;
  parameter fill  = 3'b001;
  parameter wash  = 3'b010;
  parameter rinse = 3'b011;
  parameter drain = 3'b100;
  parameter spin  = 3'b101;
  parameter done  = 3'b110;

  // State register
  always @(posedge clk) begin
    if (rst)
      PS <= idle;
    else
      PS <= NS;
  end

  // Next state logic
  always @(*) begin
    NS = PS;  // Default to stay in same state
    case (PS)
      idle  : if (start)      NS = fill;
      fill  : if (count == 119)  NS = wash;
      wash  : if (count == 1199) NS = rinse;
      rinse : if (count == 599)  NS = drain;
      drain : if (count == 179)  NS = spin;
      spin  : if (count == 299)  NS = done;
      done  : if (count == 29)   NS = idle;
    endcase
  end

  // Counter logic
  always @(posedge clk) begin
    if (rst)
      count <= 0;
    else if (PS != NS)  // If state is changing, reset count
      count <= 0;
    else
      count <= count + 1;
  end

endmodule
```
