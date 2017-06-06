--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:35:21 06/06/2017
-- Design Name:   
-- Module Name:   C:/Users/i861175/ise/cpu/uut_bram.vhd
-- Project Name:  cpu
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: memoryBRAM
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
 
ENTITY uut_bram IS
END uut_bram;
 
ARCHITECTURE behavior OF uut_bram IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT memoryBRAM
    PORT(
         clka : IN  std_logic;
         wea : IN  std_logic_vector(0 downto 0);
         addra : IN  std_logic_vector(7 downto 0);
         dina : IN  std_logic_vector(7 downto 0);
         douta : OUT  std_logic_vector(7 downto 0);
         clkb : IN  std_logic;
         web : IN  std_logic_vector(0 downto 0);
         addrb : IN  std_logic_vector(7 downto 0);
         dinb : IN  std_logic_vector(7 downto 0);
         doutb : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clka : std_logic := '0';
   signal wea : std_logic_vector(0 downto 0) := (others => '0');
   signal addra : std_logic_vector(7 downto 0) := (others => '0');
   signal dina : std_logic_vector(7 downto 0) := (others => '0');
   signal clkb : std_logic := '0';
   signal web : std_logic_vector(0 downto 0) := (others => '0');
   signal addrb : std_logic_vector(7 downto 0) := (others => '0');
   signal dinb : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal douta : std_logic_vector(7 downto 0);
   signal doutb : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clka_period : time := 10 ns;
   constant clkb_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: memoryBRAM PORT MAP (
          clka => clka,
          wea => wea,
          addra => addra,
          dina => dina,
          douta => douta,
          clkb => clkb,
          web => web,
          addrb => addrb,
          dinb => dinb,
          doutb => doutb
        );

   -- Clock process definitions
   clka_process :process
   begin
		clka <= '0';
		wait for clka_period/2;
		clka <= '1';
		wait for clka_period/2;
   end process;
 
   clkb_process :process
   begin
		clkb <= '0';
		wait for clkb_period/2;
		clkb <= '1';
		wait for clkb_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clka_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
