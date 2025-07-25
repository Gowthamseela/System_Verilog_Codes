class scoreboard;
  mailbox #(transaction)mon2scb;
  
  function new(mailbox #(transaction)mon2scb);
    this.mon2scb = mon2scb;
  endfunction

  task run();
    transaction trans;
    forever begin
      mon2scb.get(trans);
      $display("scoreboard: a=%0b b=%0b y=%0b",trans.a,trans.b,trans.y);
      assert (trans.y === trans.y)     
        else $error("Output mismatch");
      
    end
    //$finish;
  endtask
endclass
     