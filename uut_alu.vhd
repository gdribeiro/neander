LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

use work.pkg_alu_constant_definitions.all;

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

   constant clk_period : time := 10 ns;
   signal clock : STD_LOGIC;

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
   clk_process :process
   begin
		clock <= '0';
		wait for clk_period/2;
		clock <= '1';
		wait for clk_period/2;
   end process;


   -- Stimulus process
   stim_proc: process
   begin
      -- hold reset state for 100 ns.
      wait for 100 ns;

      alu_input_x <= "00001000";
      alu_input_y <= "00001001";
      wait for clk_period;
      alu_select <= alu_and;
      wait for clk_period;

      alu_input_x <= "11011110";
      alu_input_y <= "00100001";
      wait for clk_period;
      alu_select <= alu_or;
      wait for clk_period;

      alu_input_x <= "11111111";
      alu_input_y <= "00000001";
      wait for clk_period;
      alu_select <= alu_y;
      wait for clk_period;





      wait for clk_period*10;

      -- insert stimulus here

      wait;
   end process;

END;
