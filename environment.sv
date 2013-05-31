

class environment extends uvm_env;
`uvm_component_utils(environment)

function new(string name, uvm_component parent = null);
super.new(name, parent);
endfunction


virtual function void build();
super.build();

endfunction


virtual function void connect();
super.connect();
endfunction


endclass
