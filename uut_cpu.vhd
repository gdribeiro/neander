--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:04:12 06/05/2017
-- Design Name:   
-- Module Name:   C:/Users/i861175/ise/cpu/uut_cpu.vhd
-- Project Name:  cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: cpu
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
 
ENTITY uut_cpu IS
END uut_cpu;
 
ARCHITECTURE behavior OF uut_cpu IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT cpu
    PORT(
         cpu_clk : IN  std_logic;
         cpu_rst : IN  std_logic;
         mem_addr : IN  std_logic_vector(7 downto 0);
         mem_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal cpu_clk : std_logic := '0';
   signal cpu_rst : std_logic := '0';
   signal mem_addr : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal mem_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant cpu_clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: cpu PORT MAP (
          cpu_clk => cpu_clk,
          cpu_rst => cpu_rst,
          mem_addr => mem_addr,
          mem_out => mem_out
        );

   -- Clock process definitions
   cpu_clk_process :process
   begin
		cpu_clk <= '0';
		wait for cpu_clk_period/2;
		cpu_clk <= '1';
		wait for cpu_clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for cpu_clk_period*100;
      -- insert stimulus here 


		
		


		wait for cpu_clk_period*100;

      wait;
   end process;

END;
