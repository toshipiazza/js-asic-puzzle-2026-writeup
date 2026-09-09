// iverilog -DFUNCTIONAL -DUNIT_DELAY=#1 puzzle.v tb.v /path/to/sky130/primitives.v /path/to/sky130/sky130_fd_sc_hd.v -o puzzle
`timescale 1ns / 1ps
module top;
  reg I;
  wire [7:0] O;
  reg clk;
  reg enable;
  reg rst_n;
  wire success;

  puzzle p (
    .I(I),
    .O(O),
    .clk(clk),
    .enable(enable),
    .rst_n(rst_n),
    .success(success));
  always #5 clk = ~clk;

  initial begin
    $dumpfile("input.vcd");
    $dumpvars(0, top);

    I = 0;
    clk = 0;
    enable = 0;
    rst_n = 0;

    #30 rst_n = 1;
    #40 enable = 1;

    send_pkt11(11'b00000000000);
    send_pkt11(11'b00000000000);
    send_pkt11(11'b00000000000);
    send_pkt11(11'b00000000000);
    send_pkt11(11'b00000000000);
    send_pkt11(11'b00000000000);
    send_pkt11(11'b00000000000);
    send_pkt11(11'b00000000000);
    send_pkt11(11'b00000000000);
    send_pkt11(11'b00000000000);
    send_pkt11(11'b00000000000);

    #450 $finish;
  end

  task send_pkt11(input [10:0] pkt);
    integer i;
    begin
      for (i = 10; i >= 0; i = i - 1) begin
        @(negedge clk);
        I = pkt[i];
      end
    end
  endtask
endmodule
