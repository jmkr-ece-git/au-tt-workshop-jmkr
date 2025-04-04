/*
 * Copyright (c) 2024 Your Name
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none
`timescale 1ns/1ps

module tt_um_PWM_jmkr (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

assign uio_oe  = 1; //birectional pins set to output
Variable_PWM PWM_0(.Dutycycle(ui_in),.clk(clk), .reset(!rst_n), .counter(uo_out), .pwmout(uio_out[0]));
  // All output pins must be assigned. If not used, assign to 0.
  assign uio_out[7:1] = 0;
  

  // List all unused inputs to prevent warnings
 // wire _unused = &{ena, clk, rst_n, 1'b0};

endmodule
