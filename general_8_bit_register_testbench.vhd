LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY general_8_bit_register_testbench IS
END general_8_bit_register_testbench;

ARCHITECTURE behavior OF general_8_bit_register_testbench IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT general_8_bit_register
    PORT(
         register_8_clk : IN  std_logic;
         register_8_rst : IN  std_logic;
         register_8_load : IN  std_logic;
         register_8_in : IN  std_logic_vector(7 downto 0);
         register_8_out : OUT  std_logic_vector(7 downto 0));
    END COMPONENT;


   --Inputs
   signal register_8_clk : std_logic := '0';
   signal register_8_rst : std_logic := '0';
   signal register_8_load : std_logic := '0';
   signal register_8_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal register_8_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant register_8_clk_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: general_8_bit_register PORT MAP (
          register_8_clk => register_8_clk,
          register_8_rst => register_8_rst,
          register_8_load => register_8_load,
          register_8_in => register_8_in,
          register_8_out => register_8_out
        );

   -- Clock process definitions
   register_8_clk_process :process
   begin
		register_8_clk <= '0';
		wait for register_8_clk_period/2;
		register_8_clk <= '1';
		wait for register_8_clk_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      wait for 100 ns;

      wait for register_8_clk_period*10;

      -- insert stimulus here
      register_8_rst <= '0';

        --for i in 1 to 10 loop
            register_8_in <= "11111111";
            register_8_load <= '1';
            wait for register_8_clk_period*2;
            register_8_load <= '0';
            wait for register_8_clk_period*2;
            register_8_in <= "10101010";
            register_8_load <= '1';
            wait for register_8_clk_period*2;
            register_8_load <= '0';
            wait for register_8_clk_period*2;
            register_8_in <= "00000000";
            register_8_load <= '1';
            wait for register_8_clk_period;
            register_8_load <= '0';
        --end loop;
      wait for register_8_clk_period*10;

      wait;
   end process;

END;
