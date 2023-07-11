module vending_machine(clk,rst,x,out,change);
  input clk,rst;
  input [1:0] x;
  output reg out;
  output reg [1:0] change;
   parameter s0=2'b00,s1=2'b01,s2=2'b10;
  reg [1:0] ps,ns;
   
  always @(posedge clk)
    begin
     if(rst)
      begin
      ps<=2'b00;
      ns<=2'b00;
      change<=2'b00;
      end
     else
       ps<=ns;
      case(ps)
        s0:
          if(x==0)
            begin 
              ns<=s0;
              out<=0;
              change=2'b00;
            end
        else if(x==2'b01)
             begin
               ns<=s1;
               out<=0;
               change<=2'b00;
             end
        else if(x==2'b10)
             begin
               ns<=s2;
               out<=0;
               change<=2'b00;
             end
        s1:
          if(x==0)
            begin
              ns<=s0;
              out<=0;
              change<=2'b01;
            end
        else if(x==2'b01)
            begin
              ns<=s2;
              out<=0;
              change<=2'b00;
            end
        else if(x==2'b10)
            begin
              ns<=s0;
              out<=1;
              change<=2'b00;
            end
        s2:
          if(x==0)
            begin
              ns<=s0;
              out<=0;
              change<=2'b10;
            end
        else if(x==2'b01)
            begin
              ns<=s0;
              out<=1;
              change<=2'b00;
            end
        else if(x==2'b10)
            begin
              ns<=s0;
              out<=1;
              change<=2'b01;
            end
      endcase
    end
endmodule