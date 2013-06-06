///////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////
///////////  ////////////        //////////////////////////////////
//////////  ///////////////  //////////////////////////////////////
/////////  ///////////////  ///////////////////////////////////////
////////  ///////////////  ////////////////////////////////////////
///////  ///////////////  /////////////////////////////////////////
//////        //////     //////////////////////////////////////////
///////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////


//transactions are the basic data objects that are passed between components

`ifndef GUARD_PACKET
`define GUARD_PACKET


`include "uvm.svh"
import uvm_pkg::*;


class fifo_transaction extends uvm_sequence_item;

rand bit        write;
rand bit        read;

rand bit [7:0]  wr_length;  //write burst size
rand bit [7:0]  rd_length;  //read burst size

rand bit [15:0] wr_data[];  //assosiate array for write data 


//constraint payload_size_c {data.size inside {[1:6]};}

constraint wr_length_c {wr_length inside {[1:255]};}

constraint rd_length_c {rd_length inside {[1:255]};}

function new(string name="");
  super.new(name);
endfunction


//what post_randomization can be set here ????
/*
function void post_randomize();
  if(fcs_kind == GOOD_FCS)
    fcs = 8'b0;
  else
    fcs = 8'b1;
    fcs = cal_fcs();
endfucntion
*/


`uvm_object_utils_begin(fifo_transaction) 
`uvm_field_int(write, UVM_ALL_ON|UVM_NOPACK)
`uvm_field_int(read, UVM_ALL_ON|UVM_NOPACK)
`uvm_field_int(wr_length, UVM_ALL_ON|UVM_NOPACK)
`uvm_field_int(rd_length, UVM_ALL_ON|UVM_NOPACK)
`uvm_field_int(wr_data, UVM_ALL_ON|UVM_NOPACK)
`uvm_object_utils_end 


function void do_pack(uvm_packer packer);
  super.do_pack(packer);
  packer.pack_field_int();
...

endfunction


function void do_unpack(uvm_packer packer);
int sz;
super.do_pack(packer);
...

endfunction


endclass

`endif

