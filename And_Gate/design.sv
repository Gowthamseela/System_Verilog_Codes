// Code your design here

module and_gate(
  input bit [2:0]  a,
  input bit [2:0]  b,
  output [2:0] y
);
  assign y = a & b;
endmodule