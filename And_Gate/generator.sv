class generator;
  transaction trans;
  mailbox #(transaction)gen2driv;
  
  function new(mailbox #(transaction)gen2driv);
    $display("generator is created");
    this.gen2driv=gen2driv;
  endfunction
  
  task run();
    trans=new();
    repeat(5)begin
      trans.a= $random();
      trans.b=$random();
      $display("generator: a=%0b b=%0b y=%0b",trans.a,trans.b,trans.y);
      gen2driv.put(trans);
      #10;
    end
    //#1000;$finish;
  endtask
endclass
    