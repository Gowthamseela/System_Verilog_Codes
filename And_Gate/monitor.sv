class monitor;
  virtual and_intf vif;
  mailbox #(transaction) mon2scb;
  
  function new(virtual and_intf vif, mailbox #(transaction) mon2scb);
    this.vif = vif;
    $display("monitor is created");
    this.mon2scb = mon2scb;
  endfunction
  
  task run();
    transaction trans = new();
    forever begin 
      #9;
      $display("monitor: a=%0b b=%0b y=%0b", vif.a, vif.b, vif.y);
      trans.a = vif.a;
      trans.b = vif.b;
      trans.y = vif.y;
      mon2scb.put(trans);
      
    end
    //$finish; // Add delay to control the frequency of monitoring
  endtask
endclass


/*
class monitor;
  virtual and_intf vif;
  mailbox #(transaction)mon2scb;
  
  function new(virtual and_intf vif, mailbox #(transaction) mon2scb);
    this.vif=vif;
    $display("monitor is created");
    this.mon2scb=mon2scb;
  endfunction
  
  task run();
    forever begin
      transaction trans;
      trans=new();
      $display("generated monitor outputs are a=%0b b=%0b y=%0b",vif.a,vif.b,vif.y);
      trans.a= vif.a;
      trans.b= vif.b;
      trans.y= vif.y;
      mon2scb.put(trans);
    end
  endtask
endclass
*/