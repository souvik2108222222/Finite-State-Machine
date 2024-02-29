module mealy_fsm_tb;
  reg clk;
  reg rst;
  reg in;
  wire out;

  // Instantiate the DUT (Design Under Test)
  mealy_fsm uut (
    .out(out),
    .in(in),
    .rst(rst),
    .clk(clk)
  );

  // Clock generation
  always begin
    #5 clk = ~clk; // Generate a clock signal with a period of 10 time units
  end

  // Stimulus generation
  initial begin
    // Initialize inputs
    clk = 0;
    rst = 0;
    in = 0;

    // Reset and observe initial state
    rst = 1;
    #10 rst = 0;

    // Test case 1: in = 1
    in = 1;
    #10;
    // At this point, out should be 0

    // Test case 2: in = 0
    in = 0;
    #10;
    // At this point, out should be 1

    // Add more test cases as needed

    // Finish simulation
    $finish;
  end

  // Monitor and display
  always @(posedge clk) begin
    $display("Time = %0t, in = %0d, out = %0d", $time, in, out);
  end

endmodule
