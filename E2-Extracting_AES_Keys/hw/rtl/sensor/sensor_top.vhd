

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.design_package.all;

library unisim;
use unisim.vcomponents.all;

entity sensor_top is
  generic(
    sens_length        : integer := 128;
    enc_length         : integer := 16;
    initial_delay      : integer := 32;
    fine_delay         : integer := 24
  );
  port(
    clk_ref            : in  std_logic;         
    sys_clk            : in  std_logic;       
    rst_n              : in  std_logic;        
    clk_en_p           : in  std_logic;        
    sensor_clk_i       : in  std_logic;         
    tag_i              : in  std_logic;       
    initial_delay_conf : in  std_logic_vector(initial_delay-1 downto 0);    
    fine_delay_conf    : in  std_logic_vector(4*fine_delay-1 downto 0);   
    tag_o              : out std_logic;    
    delay_line_o       : out std_logic_vector(sens_length - 1 downto 0)   
  );
end sensor_top;

architecture synth of sensor_top is
  component DSPSensor
  port (
    ref_clk             : in    std_logic;
    rst                 : in    std_logic;
    A                   : in    std_logic;
    clk                 : in    std_logic;
    taps_clk            : in    std_logic_vector(4 downto 0);
    taps_A              : in    std_logic_vector(4 downto 0);
    P                   : out   std_logic_vector(47 downto 0)
  );
  end component;

  -- unused
  component BUFG
    port (
      O : out std_logic;
      I : in std_logic 
      );
  end component;
  
  -- unused
  component sensor_mmcm
    generic(PHASE_SHIFT : real :=  10.0);
    port (
      CLK_IN1  : in  std_logic;
      CLK_OUT1 : out std_logic
      );
  end component;
  
  signal delaym_0 :  std_logic_vector(sens_length - 1 downto 0);
  signal rst      :  std_logic := NOT rst_n;
  
  attribute KEEP : string;
  attribute S : string;
  attribute KEEP of delaym_0: signal is "true";
  attribute S of delaym_0: signal is "true";
  
begin
  
  dspSensor0: DSPSensor
  port map(
  ref_clk => clk_ref,
  rst     => rst,
  A       => sys_clk,
  clk     => sensor_clk_i,
  taps_clk  => fine_delay_conf(4*fine_delay-4 downto 4*fine_delay-8),
  taps_A    => fine_delay_conf(4*fine_delay-12 downto 4*fine_delay-16),
  P       => delay_line_o(47 downto 0)
  );

delay_line_o(127 downto 48) <= (others => '0');

end synth;


