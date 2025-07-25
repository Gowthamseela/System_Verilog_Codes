`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  generator gen;
  monitor mon;
  driver driv;
  scoreboard scb;
  
  mailbox #(transaction)m_gen2driv;
  mailbox #(transaction)m_mon2scb;
  
  virtual and_intf vif;
  
  function new(virtual and_intf vif);
    this.vif=vif;
    
    m_gen2driv=new();
    m_mon2scb=new();
    
    gen=new(m_gen2driv);
    driv=new(vif,m_gen2driv);
    mon=new(vif,m_mon2scb);
    scb=new(m_mon2scb);
  endfunction
  
  task run();
    fork
      gen.run();
      driv.run();
      mon.run();
      scb.run();
    join
  endtask
endclass
  