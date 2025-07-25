`include "environment.sv" 
class test;
environment env;
  virtual and_intf vif;
  
  function new (virtual and_intf vif);
    this.vif=vif;
  endfunction
  
  task run();
    env=new(this.vif);
    env.run();
    //#60 $finish;
  endtask
endclass
    