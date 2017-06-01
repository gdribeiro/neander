library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

use work.pkg_general_characteristics.all;
use work.pkg_alu_constant_definitions.all;

--  entity definition
-- it is used in all operations with ULA
entity general_8_bit_register is

    Port (
        register_8_clk  : in std_logic;
        register_8_rst  : in std_logic; -- enabled when high
        register_8_load : in std_logic; -- enabled when high
        register_8_in   : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
    	register_8_out  : out std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)   := (others=>'0'));
end general_8_bit_register;

architecture Behavioral of general_8_bit_register is
    signal sig_reg_8_out : std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
begin
register_8_out <= sig_reg_8_out;
reg_8_general: process(register_8_rst, register_8_clk, register_8_load)
begin
    -- Assynchronous reset
    if (register_8_rst = neanderTrue) then
        sig_reg_8_out <= (others=>'0');
    -- On clock rising edge puts the input value to the register's output
    -- if the load is enabled
elsif (register_8_clk'event and register_8_clk = neanderTrue) then
        if register_8_load = neanderTrue then
            sig_reg_8_out <= register_8_in;
        else
            sig_reg_8_out <= sig_reg_8_out;
        end if;
    end if;
end process reg_8_general;
end Behavioral;
