module Moore_Fsm(
    input clk,
    input rst,
    input x,
    output z
    );
    parameter s0=3'b000;
    parameter s1=3'b001;
    parameter s2=3'b010;
    parameter s3=3'b011;
    parameter s4=3'b100;
    
     reg [3:0]pst_state,nst_state;
     always@(posedge clk)
     begin
     if(!rst)
     pst_state<=s0;
     else
     pst_state<=nst_state;
     end
     always@(pst_state or x)
     begin
     case(pst_state)
     s0:begin
     if(x==0)
     nst_state=s0;
     else
     nst_state=s1;
     end
     s1:begin
     if(x==0)
     nst_state=s2;
     else
     nst_state=s1;
     end
     s2:begin
     if(x==0)
     nst_state=s0;
     else
     nst_state=s3;
     end
     s3:begin
     if(x==0)
     nst_state=s2;
     else
     nst_state=s4;
     end
     s4:begin
     if(x==0)
     nst_state=s2;
     else
     nst_state=s1;
     end
     endcase
     end
     assign z=(pst_state ==s4)?1:0;
endmodule
