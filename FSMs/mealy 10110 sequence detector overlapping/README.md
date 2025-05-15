# Mealy 10110 sequence detector overlapping
## Design code
```

  module mealy_10110_ov(in_seq, clk,rst,det_out);
    input in_seq,clk,rst;
    output reg det_out;

    reg [2:0] ps,ns;

    parameter idle = 3'b000;
    parameter s1 = 3'b001;
    parameter s10 = 3'b010;
    parameter s101 = 3'b011;
    parameter s1011 = 3'b100;

    always@(posedge clk) begin
      if(rst)
        ps<= idle;

      else
        ps <= ns;

    end


    always@(ps,in_seq) begin
      case(ps)
        idle : if(in_seq) begin
                 ns = s1;
                 det_out = 0;
               end

               else begin
                 ns = idle;
                 det_out = 0;
               end

        s1 : if(in_seq) begin
                 ns = s1;
                 det_out = 0;
               end

               else begin
                 ns = s10;
                 det_out = 0;
               end

        s10 : if(in_seq) begin
                 ns = s101;
                 det_out = 0;
               end

               else begin
                 ns = idle;
                 det_out = 0;
               end

        s101 : if(in_seq) begin
                 ns = s1011;
                 det_out = 0;
               end

               else begin
                 ns = s10;
                 det_out = 0;
               end

        s1011 : if(in_seq) begin
                 ns = s1;
                 det_out = 0;
               end

               else begin
                 ns = s10;
                 det_out = 1;
               end

        default : begin
                    ns = idle;
                    det_out = 0;
        end

      endcase

    end

  endmodule

```

## Testbench
```
  module mealy_10110_ov_tb;
    reg clk,rst,in_seq;
    wire det_out;

    mealy_10110_ov dut(in_seq, clk,rst,det_out);


    initial begin
      clk=0;
      rst=1;
      #8  rst=0;
      in_seq = 1;
      #10 in_seq = 0;
      #10 in_seq = 1;
      #10 in_seq = 1;
      #10 in_seq = 0;
      #10 in_seq = 1;
      #10 in_seq = 1;
      #10 in_seq = 0;
      #10 in_seq = 1;

      #20 $finish;

    end

    always #5 clk=~clk;

    initial begin
      $monitor("in_seq = %b \t det_out = %b ", in_seq,det_out);
    end

    initial begin
      $dumpfile("dumpfile.vcd");
      $dumpvars(1,mealy_10110_ov_tb);
    end

  endmodule
```

## Output
```
in_seq = x 	 det_out = x 
in_seq = x 	 det_out = 0 
in_seq = 1 	 det_out = 0 
in_seq = 0 	 det_out = 0 
in_seq = 1 	 det_out = 0 
in_seq = 0 	 det_out = 1 
in_seq = 0 	 det_out = 0 
in_seq = 1 	 det_out = 0 
in_seq = 0 	 det_out = 1 
in_seq = 0 	 det_out = 0 
in_seq = 1 	 det_out = 0 
```

![Screenshot 2025-05-15 152913](https://github.com/user-attachments/assets/f99409d0-4d7d-413f-bb35-00ab550fa8e3)

