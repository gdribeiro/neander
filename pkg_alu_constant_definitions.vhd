library ieee;
use ieee.std_logic_1164.all;

use work.pkg_general_characteristics.all;

package pkg_alu_constant_definitions is

    -- alu operation selection size with 3 digits it is possible
    -- to have 8 different operations
    constant aluSelectWidth_upperbound   : natural := 2;
    constant aluSelectWidth_lowerbound   : natural := 0;

    constant alu_add   : std_logic_vector (aluSelectWidth_upperbound downto aluSelectWidth_lowerbound) := "000";
    constant alu_and   : std_logic_vector (aluSelectWidth_upperbound downto aluSelectWidth_lowerbound) := "001";
    constant alu_or    : std_logic_vector (aluSelectWidth_upperbound downto aluSelectWidth_lowerbound) := "010";
    constant alu_not_x : std_logic_vector (aluSelectWidth_upperbound downto aluSelectWidth_lowerbound) := "011";
    constant alu_y     : std_logic_vector (aluSelectWidth_upperbound downto aluSelectWidth_lowerbound) := "100";

    constant ula_zero_output    : std_logic_vector (datawidth_upperbound downto datawidth_lowerbound) := (others=>'0');

end pkg_alu_constant_definitions;
