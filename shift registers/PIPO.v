module pipo_register (
    input clk,
    input reset,              // Synchronous reset
    input load,               // Load control
    input [3:0] parallel_in,  // Parallel input
    output reg [3:0] parallel_out // Parallel output
);

    always @(posedge clk) begin
        if (reset)
            parallel_out <= 4'b0000;         // Clear output on reset
        else if (load)
            parallel_out <= parallel_in;     // Load data when load is high
    end

endmodule


//Testbench


`timescale 1ns / 1ps

module pipo_register_tb;

    reg clk;
    reg reset;
    reg load;
    reg [3:0] parallel_in;
    wire [3:0] parallel_out;

    // Instantiate DUT
    pipo_register uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .parallel_in(parallel_in),
        .parallel_out(parallel_out)
    );

    // Clock generation (10ns period)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        load = 0;
        parallel_in = 4'b0000;

        // Hold reset
        #10; reset = 0;

        // Load 1101
        parallel_in = 4'b1101; load = 1; #10;
        load = 0;

        // No load, change input (ignored)
        parallel_in = 4'b0011; #10;

        // Reset the output
        reset = 1; #10; reset = 0;

        // Load new value
        parallel_in = 4'b1010; load = 1; #10;

        $finish;
    end

    // Monitor signals
    initial begin
        $monitor("Time=%0t | Reset=%b | Load=%b | Parallel In=%b | Parallel Out=%b",
                  $time, reset, load, parallel_in, parallel_out);
    end
  
    initial begin
      $dumpfile("dump.vcd");
      $dumpvars(1,pipo_register_tb);
    end

endmodule
