library ieee;
use ieee.std_logic_1164.all;

package pkg_neander_instructions_constants is

    -- Constants definition for instructions
    -- for those who don't want to type 0's and 1's the whole life
    constant I_NOP     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "0000";
    constant I_STA     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "0001";
    constant I_LDA     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "0010";
    constant I_ADD     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "0011";
    constant I_OR     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "0100";
    constant I_AND     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "0101";
    constant I_NOT     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "0110";
    constant I_JMP     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "1000";
    constant I_JN     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "1001";
    constant I_JZ     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "1010";
    constant I_HLT     	: std_logic_vector(instrucionWidth_upperbound downto instrucionWidth_lowerbound) := "1010";

end pkg_neander_instructions_constants;
