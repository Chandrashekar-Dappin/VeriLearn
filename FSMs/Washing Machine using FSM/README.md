![Screenshot 2025-05-18 014622](https://github.com/user-attachments/assets/42a96bc0-9f8f-4e1f-9c63-9fc019a78863)

# Design code
```
module washing_machine (
    input clk,
    input reset,
    input start,
    output reg done_beep
);

    // State Encoding
    parameter IDLE  = 3'd0;
    parameter FILL  = 3'd1;
    parameter WASH  = 3'd2;
    parameter RINSE = 3'd3;
    parameter DRAIN = 3'd4;
    parameter SPIN  = 3'd5;
    parameter DONE  = 3'd6;

    reg [2:0] current_state, next_state;
    reg [15:0] timer;  // Timer in seconds

    // Durations (in seconds)
    parameter FILL_TIME  = 120;
    parameter WASH_TIME  = 1200;
    parameter RINSE_TIME = 600;
    parameter DRAIN_TIME = 180;
    parameter SPIN_TIME  = 300;
    parameter DONE_TIME  = 30;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= IDLE;
            timer <= 0;
            done_beep <= 0;
        end else begin
            case (current_state)
                IDLE: begin
                    done_beep <= 0;
                    timer <= 0;
                    if (start)
                        current_state <= FILL;
                end

                FILL: begin
                    if (timer < FILL_TIME)
                        timer <= timer + 1;
                    else begin
                        timer <= 0;
                        current_state <= WASH;
                    end
                end

                WASH: begin
                    if (timer < WASH_TIME)
                        timer <= timer + 1;
                    else begin
                        timer <= 0;
                        current_state <= RINSE;
                    end
                end

                RINSE: begin
                    if (timer < RINSE_TIME)
                        timer <= timer + 1;
                    else begin
                        timer <= 0;
                        current_state <= DRAIN;
                    end
                end

                DRAIN: begin
                    if (timer < DRAIN_TIME)
                        timer <= timer + 1;
                    else begin
                        timer <= 0;
                        current_state <= SPIN;
                    end
                end

                SPIN: begin
                    if (timer < SPIN_TIME)
                        timer <= timer + 1;
                    else begin
                        timer <= 0;
                        current_state <= DONE;
                    end
                end

                DONE: begin
                    done_beep <= 1;
                    if (timer < DONE_TIME)
                        timer <= timer + 1;
                    else begin
                        timer <= 0;
                        done_beep <= 0;
                        current_state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule
```

# Testbench
```

`timescale 1s/1s

module washing_machine_tb;

    reg clk, reset, start;
    wire done_beep;

    // Instantiate the DUT (Device Under Test)
    washing_machine dut (
        .clk(clk),
        .reset(reset),
        .start(start),
        .done_beep(done_beep)
    );

    // Clock generation: 1 Hz clock (1s period)
    always #0.5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, washing_machine_tb);
        $monitor("Time=%0t | Reset=%b | Start=%b | Done_Beep=%b | State=%0d | Timer=%0d", 
                 $time, reset, start, done_beep, dut.current_state, dut.timer);
    end

    initial begin
        // Initial values
        clk = 0;
        reset = 1;
        start = 0;

        // Hold reset for a few cycles
        #2 reset = 0;

        // Start washing cycle
        #1 start = 1;
        #1 start = 0; // Pulse-style start signal

        // Wait for a full cycle to complete
        #(120+1200+600+180+300+30 + 10); // Add buffer time at the end

        $display("Simulation complete at time %0t", $time);
        $finish;
    end

endmodule
```

# Output
```

```
