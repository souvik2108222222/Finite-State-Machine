module mealy_fsm (
  output reg out,
  input wire in,
  input wire rst,
  input wire clk
);
  reg [1:0] state;      // Declare state variable
  reg [1:0] next_state; // Declare next_state variable

  always @(posedge clk or posedge rst)
    if (rst)
      state <= 0;
    else
      state <= next_state;

  always @(state, in)
    case (state)
      0: // Idle
        if (in == 1) begin
          next_state = 1;
          out = 0;
        end else
          next_state = 0;
      1: // Waiting for edge
        if (in == 0) begin
          next_state = 0;
          out = 1;
        end else
          next_state = 1;
    endcase

endmodule
