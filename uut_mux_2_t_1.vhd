LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY uut_mux_2_t_1 IS
END uut_mux_2_t_1;

ARCHITECTURE behavior OF uut_mux_2_t_1 IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT mux_2_1_8bit
    PORT(
         mux_2_1_sel : IN  std_logic;
         mux_2_1_in_a : IN  std_logic_vector(7 downto 0);
         mux_2_1_in_b : IN  std_logic_vector(7 downto 0);
         mux_2_1_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal mux_2_1_sel : std_logic := '0';
   signal mux_2_1_in_a : std_logic_vector(7 downto 0) := (others => '0');
   signal mux_2_1_in_b : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal mux_2_1_out : std_logic_vector(7 downto 0);
   -- No clocks detected in port list. Replace clock below with
   -- appropriate port name

   constant clock_period : time := 10 ns;
   signal clock : std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: mux_2_1_8bit PORT MAP (
          mux_2_1_sel => mux_2_1_sel,
          mux_2_1_in_a => mux_2_1_in_a,
          mux_2_1_in_b => mux_2_1_in_b,
          mux_2_1_out => mux_2_1_out
        );

   -- Clock process definitions
   clock_process : process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin
      mux_2_1_sel <= '0';
      -- hold reset state for 100 ns.
      wait for 100 ns;



      mux_2_1_in_a <= "00000000";
      mux_2_1_in_a <= "11111111";
      wait for clock_period;
      mux_2_1_sel <= '1';
      wait for clock_period;
      mux_2_1_sel <= '0';


      wait for clock_period*10;

      -- insert stimulus here

      wait;
   end process;

END;
