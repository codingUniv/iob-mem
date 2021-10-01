`timescale 1ns/1ps

module t2p_ram
  #( 
     parameter DATA_W = 8,
     parameter ADDR_W = 6,
     parameter USE_RAM = 1
     ) 
   (
    // Write port
    input                   wclk,
    input                   w_en,
    input [ADDR_W-1:0]      w_addr,
    input [DATA_W-1:0]      data_in,

    // Read port
    input                   rclk,
    input                   r_en,
    input [ADDR_W-1:0]      r_addr,
    output reg [DATA_W-1:0] data_out
    );

   //memory declaration
   reg [DATA_W-1:0]         mem [2**ADDR_W-1:0];

   //write
   always@(posedge wclk)
     if(w_en)
       mem[w_addr] <= data_in;

   //read mode depends on mem implementation, as ram or reg
   generate
      if(USE_RAM)
        always@(posedge rclk)  begin
           if(r_en)
             data_out <= mem[r_addr];
        end
      else //use reg file
        always@* data_out = mem[r_addr];
   endgenerate

endmodule   
