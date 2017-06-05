--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:48:30 06/05/2017
-- Design Name:   
-- Module Name:   C:/Users/i861175/ise/cpu/uut_neander_cpu.vhd
-- Project Name:  cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: neander_cpu
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY uut_neander_cpu IS
END uut_neander_cpu;
 
ARCHITECTURE behavior OF uut_neander_cpu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT neander_cpu
    PORT(
         instruction_in : IN  std_logic_vector(7 downto 0);
         alu_nz : IN  std_logic_vector(1 downto 0);
         neander_cpu_rst : IN  std_logic;
         neander_cpu_clk : IN  std_logic;
         load_ac : OUT  std_logic;
         load_rem : OUT  std_logic;
         load_nz : OUT  std_logic;
         load_rdm : OUT  std_logic;
         load_wdm : OUT  std_logic;
         load_ir : OUT  std_logic;
         load_pc : OUT  std_logic;
         inc_pc : OUT  std_logic;
         sel_alu : OUT  std_logic_vector(2 downto 0);
         sel_mux : OUT  std_logic;
         read_mem : OUT  std_logic;
         write_mem : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal instruction_in : std_logic_vector(7 downto 0) := (others => '0');
   signal alu_nz : std_logic_vector(1 downto 0) := (others => '0');
   signal neander_cpu_rst : std_logic := '0';
   signal neander_cpu_clk : std_logic := '0';

 	--Outputs
   signal load_ac : std_logic;
   signal load_rem : std_logic;
   signal load_nz : std_logic;
   signal load_rdm : std_logic;
   signal load_wdm : std_logic;
   signal load_ir : std_logic;
   signal load_pc : std_logic;
   signal inc_pc : std_logic;
   signal sel_alu : std_logic_vector(2 downto 0);
   signal sel_mux : std_logic;
   signal read_mem : std_logic;
   signal write_mem : std_logic;

   -- Clock period definitions
   constant neander_cpu_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: neander_cpu PORT MAP (
          instruction_in => instruction_in,
          alu_nz => alu_nz,
          neander_cpu_rst => neander_cpu_rst,
          neander_cpu_clk => neander_cpu_clk,
          load_ac => load_ac,
          load_rem => load_rem,
          load_nz => load_nz,
          load_rdm => load_rdm,
          load_wdm => load_wdm,
          load_ir => load_ir,
          load_pc => load_pc,
          inc_pc => inc_pc,
          sel_alu => sel_alu,
          sel_mux => sel_mux,
          read_mem => read_mem,
          write_mem => write_mem
        );

   -- Clock process definitions
   neander_cpu_clk_process :process
   begin
		neander_cpu_clk <= '0';
		wait for neander_cpu_clk_period/2;
		neander_cpu_clk <= '1';
		wait for neander_cpu_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for neander_cpu_clk_period*10;

      -- insert stimulus here 
		
		
		

      wait;
   end process;

END;
