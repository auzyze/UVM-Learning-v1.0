//transactions are the basic data objects that are passed between components

`ifndef GUARD_PACKET
`define GUARD_PACKET


`include "uvm.svh"
import uvm_pkg::*;

typedef enum {GOOD_FCS, BAD_FCS} fcs_kind_t;


class packet extends uvm_sequence_item;

rand fcs_kind_t fcs_kind;

rand bit [7:0]  length;
rand bit [7:0]  da;
rand bit [7:0]  sa;
rand bit [7:0]  data[];
rand byte fcs;


constraint payload_size_c {data.size inside {[1:6]};}
constraint length_c {length == data.size}

function new(string name="");
super.new(name);
endfunction


function void post_randomize();
if(fcs_kind == GOOD_FCS)
  fcs = 8'b0;
else
  fcs = 8'b1;
  fcs = cal_fcs();
endfucntion


virtual function byte cal_fcs;
return da^sa^length^data.xor()^fcs;
endfunction



`uvm_object_utils_begain(packet)
//?????????????????
//?????????????????
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

