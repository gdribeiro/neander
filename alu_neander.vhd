library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

use work.pkg_alu_constant_definitions.all;
use work.pkg_general_characteristics.all;


-- Accumalutor entity definition
-- it is used in all operations with alu
entity alu_neander is

    Port (
        alu_input_y    : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
        alu_input_x    : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
        alu_operation_result   : out std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
        alu_nz  : out std_logic_vector(1 downto 0) := (others=>'0');
        alu_select : in std_logic_vector(aluSelectWidth_upperbound downto aluSelectWidth_lowerbound) := (others=>'0'));
end alu_neander;


architecture Behavioral of alu_neander is
    signal sig_out : std_logic_vector (datawidth_upperbound downto datawidth_lowerbound) := (others=>'0');
    signal sig_alu_flag_negative  : out std_logic := '0';
    signal sig_alu_flag_zero  : out std_logic := '0';

begin

alu_operation_result <= sig_out;
alu : process(alu_select, alu_input_x, alu_input_y)
begin

    case( alu_select ) is
        when alu_add => sig_out <= alu_input_x + alu_input_y;

        when alu_and => sig_out <= alu_input_x and alu_input_y;

        when alu_or => sig_out <= alu_input_x and alu_input_y;

        when alu_not_x => sig_out <= alu_input_x;

        when alu_y => sig_out <=  alu_input_y;

        when others => sig_out <= (others=>'0');

    end case;
end process alu;


alu_nz(1) <= alu_flag_negative;
alu_nz : process(sig_out)
begin
    if sig_out(7) = '1' then
        alu_flag_negative <= '1';
        alu_flag_zero <= '0';
    elsif sig_out = ula_zero_output then
        alu_flag_negative <= '0';
        alu_flag_zero <= '1';
    end if;
end process alu_nz;









end Behavioral;
