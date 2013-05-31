



class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  
  
  
  my_env env;
  
  function void build;
    super.build();
    begin
      my_config cfg = new;
      cfg.afull_wtrline = 12;
      cfg.aempt_wtrline = 2;
      
      set_config_object("*.*component_needs_to_be_configured*", "cfg", config, 0); // ??????????
    end
    
    env = top::type_id::create("env",this);  // what kind of hierarchy does "top" indicate?
    
  endfunction :build
  

endclass :my_test







