/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////

`ifndef GUARD_INTERFACE
`define GUARD_INTERFACE

/////////////////////////////////////////////////////////////
// INTERFACE OF ASYNC FIFO
/////////////////////////////////////////////////////////////

interface fifo_interface(input bit wr_clock,rd_clock);

parameter setup_time = 5ns;
parameter hold_time = 3ns;

wire  [7:0]     wr_data;
wire            wr_en;

wire            rd_en;
wire  [7:0]     rd_data;

wire            full;
wire            empty;
wire            afull;
wire            aempty;

reg             reset;


//clocking and modport for writing port of ASYNC FIFO
//
clocking cb_w@(posedge wr_clock);
default input #setup_time output #hold_time;
output  wr_data;
output  wr_en;
input   full;
input   afull;
endclocking:cb_w;

modport WR(clocking cb_w, input wr_clock);


//clocking and modport for reading port of ASYNC FIFO
//
clocking cb_r@(posedge rd_clock);
default input #setup_time output #hold_time;
output  rd_data;
output  rd_en;
input   empty;
input   aempty;
endclocking:cb_r;

modport RD(clocking cb_r, input rd_clock);


endinterface:fifo_interface

`endif
