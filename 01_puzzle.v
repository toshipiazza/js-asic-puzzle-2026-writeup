module puzzle (I, O, clk, enable, rst_n, success);
  input I;
  input clk;
  input enable;
  input rst_n;
  output success;
  output wire [7:0] O;

  wire last_round;
  wire end_of_round;
  wire running;
  wire check_solution;
  wire [3:0] col;
  wire [3:0] row;

  module_0 m0 (
    .clk(clk),
    .enable(enable),
    .rst_n(rst_n),
    .end_of_round(end_of_round),
    .last_round(last_round),
    .check_solution(check_solution), // output
    .running(running)); // output

  module_1 m1 (
    .clk(clk),
    .rst_n(rst_n),
    .running(running),
    .col(col), // output
    .end_of_round(end_of_round)); // output

  module_2 m2 (
    .clk(clk),
    .end_of_round(end_of_round),
    .running(running),
    .row(row), // output
    .rst_n(rst_n),
    .last_round(last_round)); // output

  wire [3:0] reg7;
  module_7 m7 (
    .col(col),
    .row(row),
    .reg7(reg7)); // output

  wire check5;
  module_3 m3 (
    .clk(clk),
    .I(I),
    .rst_n(rst_n),
    .running(running),
    .col(col),
    .check5(check5)); // output

  wire check3;
  module_4 check_two_bits_per_round (
    .clk(clk),
    .I(I),
    .rst_n(rst_n),
    .end_of_round(end_of_round),
    .running(running),
    .check3(check3)); // output
  
  wire check4;
  module_8 m8 (
    .clk(clk),
    .rst_n(rst_n),
    .I(I),
    .col(col),
    .running(running),
    .check4(check4)); // output

  wire check1;
  module_9 m9 (
    .clk(clk),
    .I(I),
    .rst_n(rst_n),
    .running(running),
    .reg7(reg7),
    .check1(check1));

  wire got_all_ones;
  wire got_all_zero;
  wire check2;
  module_5 m5 (
    .clk(clk),
    .I(I),
    .rst_n(rst_n),
    .running(running),
    .got_all_ones(got_all_ones), // output
    .got_all_zero(got_all_zero), // output
    .check2(check2)); // output

  wire hint;
  wire write_output;
  module_6 m6 (
    .clk(clk),
    .rst_n(rst_n),
    .check_solution(check_solution),
    .check1(check1),
    .check2(check2),
    .check3(check3),
    .check4(check4),
    .check5(check5),
    .hint(hint), // output
    .write_output(write_output), // output
    .success(success)); // output

  module_output o1 (
    .clk(clk),
    .I(I),
    .running(running),
    .success(success),
    .hint(hint),
    .got_all_ones(got_all_ones),
    .got_all_zero(got_all_zero),
    .write_output(write_output),
    .rst_n(rst_n),
    .O(O)); // output
endmodule
