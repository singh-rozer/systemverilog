//Design
module alt_pulse(clk,p_req,pulse);
  input clk;
  input [7:0] p_req;
  output reg pulse;
  
  reg temp;
  
  always@(posedge clk)begin
    for(int i = 0; i < p_req; i++)begin
      pulse <= 1;
      if(pulse)
        pulse <= 0;
    end
  end
endmodule

//Testbench
module tb;
  
  reg clk;
  reg [7:0] p_req;
  wire pulse;
  
  alt_pulse DUT(clk,p_req,pulse);
  
  always begin
    #5 clk = ~clk;
  end
  
  initial
    begin
      clk = 0;
      #5;
      p_req = 20;
      #100;
      $finish();
    end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0);
  end
endmodule
