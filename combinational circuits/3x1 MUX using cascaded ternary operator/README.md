```
 module mux_3x1 (sel,I,y);
   input [1:0] sel;
   input [2:0] I;
   output  y;
  
   //assign y = (sel == 2'b00) ? I[0] : (sel == 2'b01) ? I[1] : I[2];
  
   assign y = sel[1] ?  (sel[0] ? 1'bx : I[2]) : (sel[0] ? I[1] : I[0]);
  
endmodule
```
