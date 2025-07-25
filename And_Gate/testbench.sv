// Code your testbench here
// or browse Examples
`include "interface.sv"
`include "test.sv"

module and_gate_tb;
  
  and_intf i_intf();
  
  test t1;
  
  and_gate DUT (.a(i_intf.a),.b(i_intf.b),.y(i_intf.y));
  
  initial begin
    t1=new(i_intf);
    t1.run();
    $display("the values at testbench are a=%0b b=%0b y=%0b",i_intf.a,i_intf.b,i_intf.y);
   // #1000 $finish;
  end
  
  initial begin
    #60 $finish;
  end
endmodule
  