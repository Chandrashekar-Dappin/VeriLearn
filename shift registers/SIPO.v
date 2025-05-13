module sipo_shift_register (
    input clk,         // Clock input
    input reset,       // Synchronous reset
    input serial_in,   // Serial data input
    output [3:0] parallel_out // Parallel data output
);

    reg [3:0] shift_reg;

    // Shift logic
    always @(posedge clk) begin
        if (reset)
            shift_reg <= 4'b0000;                   // Clear the register on reset
        else
            shift_reg <= {shift_reg[2:0], serial_in}; // Shift left, load serial_in
    end

    assign parallel_out = shift_reg; // Output entire register content

endmodule



//Testbench
`timescale 1ns / 1ps

module sipo_shift_register_tb;

    reg clk;
    reg reset;
    reg serial_in;
    wire [3:0] parallel_out;

    // Instantiate the DUT
    sipo_shift_register uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .parallel_out(parallel_out)
    );

    // Generate clock: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Initial values
        clk = 0;
        reset = 1;
        serial_in = 0;

        // Reset for a short duration
        #10;
        reset = 0;

        // Input sequence: 1, 0, 1, 1
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;

        // Hold serial_in low and continue clocking
        serial_in = 0; #20;

        $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("Time=%0t | Reset=%b | Serial In=%b | Parallel Out=%b",
                  $time, reset, serial_in, parallel_out);
    end
  
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(1 ,sipo_shift_register_tb);
    end

endmodule
