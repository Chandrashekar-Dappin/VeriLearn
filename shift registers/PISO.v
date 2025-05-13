module piso_shift_register (
    input clk,               // Clock input
    input reset,             // Synchronous reset
    input load,              // Load control signal
    input [3:0] parallel_in, // Parallel data input
    output serial_out        // Serial data output
);

    reg [3:0] shift_reg;

    always @(posedge clk) begin
        if (reset)
            shift_reg <= 4'b0000;                  // Clear the register
        else if (load)
            shift_reg <= parallel_in;              // Load parallel input into register
        else
            shift_reg <= {1'b0, shift_reg[3:1]};   // Shift right
    end

    assign serial_out = shift_reg[0]; // LSB shifted out first

endmodule


//Testbench

`timescale 1ns / 1ps

module piso_shift_register_tb;

    reg clk;
    reg reset;
    reg load;
    reg [3:0] parallel_in;
    wire serial_out;

    // Instantiate DUT
    piso_shift_register uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .parallel_in(parallel_in),
        .serial_out(serial_out)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        load = 0;
        parallel_in = 4'b0000;

        #10;
        reset = 0;

        // Load parallel data (e.g., 4'b1011)
        parallel_in = 4'b1011;
        load = 1; #10;
        load = 0;

        // Observe serial output over 4 clock cycles
        #40;

        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t | Reset=%b | Load=%b | Parallel In=%b | Serial Out=%b",
                  $time, reset, load, parallel_in, serial_out);
    end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(1,piso_shift_register_tb);
  end

endmodule
