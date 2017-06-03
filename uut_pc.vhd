LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY uut_pc IS
END uut_pc;

ARCHITECTURE behavior OF uut_pc IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT pc_8_bit
    PORT(
         pc_clk : IN  std_logic;
         pc_rst : IN  std_logic;
         pc_load : IN  std_logic;
         pc_in : IN  std_logic_vector(7 downto 0);
         pc_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal pc_clk : std_logic := '0';
   signal pc_rst : std_logic := '0';
   signal pc_load : std_logic := '0';
   signal pc_in : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal pc_out : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant pc_clk_period : time := 10 ns;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: pc_8_bit PORT MAP (
          pc_clk => pc_clk,
          pc_rst => pc_rst,
          pc_load => pc_load,
          pc_in => pc_in,
          pc_out => pc_out
        );

   -- Clock process definitions
   pc_clk_process :process
   begin
		pc_clk <= '0';
		wait for pc_clk_period/2;
		pc_clk <= '1';
		wait for pc_clk_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      wait for 100 ns;

      pc_in <= "00001111";
      wait for pc_clk_period*5;
      pc_load <= '1';
      wait for pc_clk_period;
      pc_load <= '0';
      wait for pc_clk_period*3;
      pc_in <= "11110000";
      wait for pc_clk_period*5;
      pc_load <= '1';
      wait for pc_clk_period;
      pc_load <= '0';
      wait for pc_clk_period*3;
      pc_in <= "10101010";
      wait for pc_clk_period*5;
      pc_load <= '1';
      wait for pc_clk_period;
      pc_load <= '0';
      wait for pc_clk_period*3;
      pc_in <= "11111110";
      wait for pc_clk_period*5;
      pc_load <= '1';
      wait for pc_clk_period;
      pc_load <= '0';
      wait for pc_clk_period*3;

      wait for pc_clk_period*10;

      -- insert stimulus here

      wait;
   end process;

END;
