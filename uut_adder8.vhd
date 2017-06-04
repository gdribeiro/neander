LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY uut_adder8 IS
END uut_adder8;

ARCHITECTURE behavior OF uut_adder8 IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT adder8
    PORT(
         x : IN  std_logic_vector(7 downto 0);
         y : IN  std_logic_vector(7 downto 0);
         c_in : IN  std_logic;
         o : OUT  std_logic_vector(7 downto 0);
         c_out : OUT  std_logic
        );
    END COMPONENT;


   --Inputs
   signal x : std_logic_vector(7 downto 0) := (others => '0');
   signal y : std_logic_vector(7 downto 0) := (others => '0');
   signal c_in : std_logic := '0';

 	--Outputs
   signal o : std_logic_vector(7 downto 0);
   signal c_out : std_logic;
   -- No clocks detected in port list. Replace <clock> below with
   -- appropriate port name

   constant clock_period : time := 10 ns;
   signal clock : std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: adder8 PORT MAP (
          x => x,
          y => y,
          c_in => c_in,
          o => o,
          c_out => c_out
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      wait for 100 ns;

      wait for clock_period*10;

      c_in <= '0';
      x <= "00000000";
      y <= "00111111";
      wait for clock_period*3;

      c_in <= '0';
      x <= "11111110";
      y <= "11111101";
      wait for clock_period*3;

      wait;
   end process;

END;
