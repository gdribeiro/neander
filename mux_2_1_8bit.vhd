library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

use work.pkg_general_characteristics.all;
use work.pkg_alu_constant_definitions.all;

--  entity definition
-- it is used in all operations with ULA
entity mux_2_1_8bit is

    Port (
        mux_2_1_sel     : in std_logic;
        mux_2_1_in_a    : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
        mux_2_1_in_b    : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
    	mux_2_1_out     : out std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)   := (others=>'0'));
end mux_2_1_8bit;

architecture Behavioral of mux_2_1_8bit is
    signal sig_mux_2_1_out	:	std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)   := (others=>'0');
begin


mux_2_1_out <= sig_mux_2_1_out;
mux_2_1 : process(mux_2_1_sel, mux_2_1_in_a, mux_2_1_in_b)
begin
    case (mux_2_1_sel) is
        when '0' =>
            sig_mux_2_1_out <= mux_2_1_in_a;
        when others =>
            sig_mux_2_1_out <= mux_2_1_in_b;
    end case;
end process mux_2_1;

end Behavioral;
