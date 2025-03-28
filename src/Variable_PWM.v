`timescale 1ns/1ns
module Variable_PWM(
    input [7:0]Dutycycle,
    input clk, reset,
    output reg [7:0] counter,
    output reg pwmout
  );
  
  

  /*initial begin
      counter = 0; //This can be used if the counter value is not being set to LOGIC 0 initially in the RTL view
  end*/

  //A counter being taken as a reference to compare the dutycycle with it which increaments 100 times at every Posedge of clk
  always @(posedge clk)
  begin
    if (reset)
      counter <=0;
    else
    begin
      if (counter < 99)
        counter <= counter + 8'b1;

      else
        counter <= 0;
    end
  end

  always @(posedge clk)
    if (reset)
      pwmout <=1'b0;
    else
    begin
      if(counter < Dutycycle)
        pwmout <= 1'b1;

      else if (counter == 99)
        pwmout <= 1'b1;

      else
        pwmout <= 1'b0;

    end
endmodule
