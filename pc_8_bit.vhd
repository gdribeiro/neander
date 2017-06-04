library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

use work.pkg_general_characteristics.all;
use work.pkg_alu_constant_definitions.all;

entity pc_8_bit is

    Port (
        pc_clk  : in std_logic;
        pc_rst  : in std_logic; -- enabled when high
        pc_load : in std_logic; -- enabled when high
        pc_inc  : in std_logic; -- enabled when hich
        pc_in   : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
    	pc_out  : out std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)   := (others=>'0'));
end pc_8_bit;

architecture Behavioral of pc_8_bit is
    signal sig_pc_out : std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
begin

pc_out <= sig_pc_out;
pc: process(pc_rst, pc_clk, pc_load, pc_inc)
begin
    if (pc_rst = neanderTrue) then
        sig_pc_out <= (others=>'0');
    elsif (pc_clk'event and pc_clk = neanderTrue) then
        if pc_load = neanderTrue then
            sig_pc_out <= pc_in;
        elsif (pc_inc = neanderTrue) then
            sig_pc_out <= sig_pc_out + 1;
        else
            sig_pc_out <= sig_pc_out;
    end if;
    end if;
end process pc;

end Behavioral;
