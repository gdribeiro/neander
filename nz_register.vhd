library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

use work.pkg_general_characteristics.all;


--  entity definition
-- it is used in all operations with ULA
entity general_2_bit_register is

    Port (
        nz_register_clk  : in std_logic;
        nz_register_rst  : in std_logic; -- enabled when high
        nz_register_load : in std_logic; -- enabled when high
        nz_register_in   : in std_logic_vector (nz_datawidth_upperbound downto nz_datawidth_lowerbound)    := others=>'0';
    	nz_register_out  : out std_logic_vector (nz_datawidth_upperbound downto nz_datawidth_lowerbound)   := others=>'0');

end general_2_bit_register ;

architecture Behavioral of general_2_bit_register is

    signal sig_out : std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := others=>'0';

begin
    -- Assynchronous reset
    if nz_register_rst then
        sig_out <= (others=>'0');
    -- On clock rising edge puts the input value to the register's output
    -- if the load is enabled
elsif (nz_register_clk'event and nz_register_clk = '1') then
        if nz_register_load = '1' then
            sig_out <= nz_register_in;
        else
            sig_out <= sig_out;
        end if;
    end if;
    nz_register_out <= sig_out;

end Behavioral;
