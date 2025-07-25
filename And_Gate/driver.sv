class driver;
  virtual and_intf vif;
  mailbox #(transaction)gen2driv;
  
  function new(virtual and_intf vif,mailbox #(transaction) gen2driv);
  this.vif=vif;
  $display("driver is created");
  this.gen2driv=gen2driv;
  endfunction
  
  task run();
    transaction trans;
    forever begin
      
      gen2driv.get(trans);
      $display("driver: a=%0b b=%0b y=%0b", trans.a, trans.b, trans.y);
      vif.a<=trans.a;
      vif.b<=trans.b;
      vif.y<=trans.y;
      #10;
    end
    //$finish;
  endtask
endclass
      