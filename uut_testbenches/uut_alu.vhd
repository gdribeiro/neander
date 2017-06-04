LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;

ENTITY uut_alu IS
END uut_alu;

ARCHITECTURE behavior OF uut_alu IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT alu_neander
    PORT(
         alu_input_y : IN  std_logic_vector(7 downto 0);
         alu_input_x : IN  std_logic_vector(7 downto 0);
         alu_operation_result : OUT  std_logic_vector(7 downto 0);
         alu_nz : OUT  std_logic_vector(1 downto 0);
         alu_select : IN  std_logic_vector(2 downto 0)
        );
    END COMPONENT;


   --Inputs
   signal alu_input_y : std_logic_vector(7 downto 0) := (others => '0');
   signal alu_input_x : std_logic_vector(7 downto 0) := (others => '0');
   signal alu_select : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal alu_operation_result : std_logic_vector(7 downto 0);
   signal alu_nz : std_logic_vector(1 downto 0);
   -- No clocks detected in port list. Replace <clock> below with
   -- appropriate port name

   constant clock_period : time := 10 ns;
   signal clock : std_logic;

BEGIN

	-- Instantiate the Unit Under Test (UUT)
   uut: alu_neander PORT MAP (
          alu_input_y => alu_input_y,
          alu_input_x => alu_input_x,
          alu_operation_result => alu_operation_result,
          alu_nz => alu_nz,
          alu_select => alu_select
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

      -- ADD
      alu_input_y <= "01010101";
      alu_input_x <= "10101010";
      alu_select <= "000";
      wait for clock_period*2;
      -- AND
      alu_input_y <= "01010101";
      alu_input_x <= "10101010";
      alu_select <= "001";
      wait for clock_period*2;
      -- OR
      alu_input_y <= "01010101";
      alu_input_x <= "10101010";
      alu_select <= "010";
      wait for clock_period*2;
      -- NOT X
      alu_input_y <= "01010101";
      alu_input_x <= "10101010";
      alu_select <= "011";
      wait for clock_period*2;
      -- Y
      alu_input_y <= "01010101";
      alu_input_x <= "10101010";
      alu_select <= "100";
      wait for clock_period*2;

      wait;
   end process;

END;
