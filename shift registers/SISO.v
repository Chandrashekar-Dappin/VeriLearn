module siso_shift_register (
    input clk,         // Clock input
    input reset,       // Synchronous reset
    input serial_in,   // Serial data input
    output serial_out  // Serial data output
);

    reg [3:0] shift_reg;

    // Shift logic
    always @(posedge clk) begin
        if (reset)
            shift_reg <= 4'b0000;                   // Clear the register on reset
        else
          shift_reg <= { serial_in,shift_reg[3:1]}; // Shift MSB and input new bit  Right shift
    end

  assign serial_out = shift_reg[0]; // Output the LSB (or MSB if left shift)

endmodule


//Testbench

`timescale 1ns / 1ps

module siso_shift_register_tb;

    reg clk;
    reg reset;
    reg serial_in;
    wire serial_out;

    // Instantiate the DUT (Design Under Test)
    siso_shift_register uut (
        .clk(clk),
        .reset(reset),
        .serial_in(serial_in),
        .serial_out(serial_out)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize inputs
        clk = 0;
        reset = 1;
        serial_in = 0;

        // Hold reset for a few cycles
        #10;
        reset = 0;

        // Apply serial input bits: 1, 0, 1, 1
        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;

        // Continue shifting with 0s to observe output
        serial_in = 0; #40;

        // Finish simulation
        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t | Reset=%b | Serial In=%b | Serial Out=%b | Shift Reg=%b",
                  $time, reset, serial_in, serial_out, uut.shift_reg);
    end
  
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(1,siso_shift_register_tb);
    end

endmodule
