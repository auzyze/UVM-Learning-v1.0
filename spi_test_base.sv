class spi_test_base extends uvm_test;
  `uvm_component_utils(spi_test_base)
  
  //------------------------
  //component memebers
  //------------------------
  
  //environment object
  spi_env m_env;
  
  //configuration objects
  spi_env_config  m_env_cfg;
  apb_agent_config  m_apb_cfg;
  spi_agent_config  m_spi_cfg;
  
  //------------------------
  //methods
  //------------------------
  
  //standards UVM methods
  extern function new(string name = "spi_test_base", uvm_component parent = null);
  extern function void build_phase (uvm_phase phase);
  
  //configuration methods, virtual, for overriding
  extern virtual function void configure_env (spi_env_config cfg);//argument type is "spi_env_config"
  
  extern virtual function void configure_apb_agent (apb_agent_config cfg);// call this function in build_phase
  
  endclass: spi_test_base
  
  
  function spi_test_base::new ();
    super.new();
  endfunction
  
  //build the env, create env configuration
  function void spi_test_base::build_phase(uvm_phase phase);
    
    
    //-------------------------------------------------------------
    //create memory space for configuration object "m_env_cfg",
    //and then call a vrtuall function to configure this object,
    //this configuration object will control attributes of env
    //-------------------------------------------------------------
    
      
    //create env configuration object
    m_env_cfg = spi_env_config::type_id::create("m_env_cfg");
    
    //call function to configure the env
    configure_env (m_env_cfg);
    
  
    //------------------------------------------------------------
    //how to use configuration values in env?
    //maybe in build function of env, confure env through $cast(config, obj);
    //------------------------------------------------------------
    
    //creat configuration objects for other components
    m_apb_cfg = apb_agent_config::type_id::create("m_apb_cfg");
    
    //call virtual methods to configure
    configure_apb_agent(m_apb_cfg);
    
    endfunction
    
    //-------------------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------
    //body of the virtual configure methods delcared above
    
    function void spi_test_base::configre_env (spi_env_config cfg);
      cfg.has_functional_coverage = 1;
      cfg.has_reg_scoreboard = 0;
      cfg.has_spi_scoreboard = 1;
    endfunction
    //--------------------------------------------------------------
    //"has_*" should be data members in spi_env_config class
    //--------------------------------------------------------------
    
    //how to override the above method in extension of test base class???
    //-------------------------------------------------------------------------------------
    //-------------------------------------------------------------------------------------
  
  
  
endclass: spi_test_base
  
