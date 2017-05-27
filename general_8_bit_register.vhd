library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;


--  entity definition
-- it is used in all operations with ULA
entity general_8_bit_register is

    Port (
        _register_clk  : in std_logic;
        _register_rst  : in std_logic; -- enabled when high
        _register_load : in std_logic; -- enabled when high
        _register_in   : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := others=>'0';
    	_register_out  : out std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)   := others=>'0');

end general_8_bit_register;

architecture Behavioral of general_8_bit_register is

    signal _sig_out : std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := others=>'0';

begin
    -- Assynchronous reset
    if _register_rst then
        _sig_out <= (others=>'0');
    -- On clock rising edge puts the input value to the register's output
    -- if the load is enabled
    elsif (_register_clk'event and _register_clk = '1') then
        if _register_load = '1' then
            _sig_out <= _register_in;
        else
            _sig_out <= _sig_out;
        end if;
    end if;
    _register_out <= _sig_out;

end Behavioral;
