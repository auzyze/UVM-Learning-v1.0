

class my_test extends uvm_test;
  `uvm_component_utils(my_test)
  
  
  
  my_env env;
  
  
  //-----------------------------------------------------------------------
  //use new function or create function?
  //-----------------------------------------------------------------------
  
  
  //funciton new(string name="my_test", uvm_component parent=null);
  //super.new(name, parent);
  //env = new("env",this);
  //endfunction
  
  
  function void build;
    super.build();
    begin
    
      //A test can: 
      //Set the contents of configurations, 
      //which are then used to control the generation of the component hierarchy from the build function
    
      my_config cfg = new;
      
      //set content of configuration, used to configure components with "set_config_object"
      cfg.afull_wtrline = 12;
      cfg.aempt_wtrline = 2;
      
      
      set_config_object("*.*component_needs_to_be_configured*", "cfg", config, 0); // ??????????
    
    end
    
    env = top::type_id::create("env",this);  // what kind of hierarchy does "top" indicate?
    
  endfunction :build
  
  
  virtual task run();
  #3000ns;
  global_stop_request();
  endtask
  

endclass :my_test







