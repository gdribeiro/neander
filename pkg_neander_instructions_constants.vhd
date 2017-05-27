library ieee;
use ieee.std_logic_1164.all;

package pkg_neander_instructions_constants is

    -- Constants definition for instructions
    -- for those who don't want to type 0's and 1's the whole life
    constant _NOP     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "0000";
    constant _STA     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "0001";
    constant _LDA     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "0010";
    constant _ADD     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "0011";
    constant _OR     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "0100";
    constant _AND     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "0101";
    constant _NOT     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "0110";
    constant _JMP     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "1000";
    constant _JN     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "1001";
    constant _JZ     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "1010";
    constant _HLT     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "1010";

end pkg_neander_instructions_constants;
