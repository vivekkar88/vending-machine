module vending_machine_tb;
//inputs
reg clk;
reg[1:0] x;
reg rst;
//output
wire out;
wire[1:0] change;
vending_machine dut(
.clk(clk),
.rst(rst),
  .x(x),
.out(out),
.change(change)
);
initial begin
//initialise inputs
$dumpfile("vending_machine.vcd");
$dumpvars(0,vending_machine_tb);
rst = 1;
clk = 0;
#6 rst = 0;
x = 2;
#19 x = 2;
#25 $finish;
end
always #5 clk = ~clk;
endmodule
