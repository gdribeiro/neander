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
        nz_register_in   : in std_logic_vector (nz_datawidth_upperbound downto nz_datawidth_lowerbound)    := (others=>'0');
    	nz_register_out  : out std_logic_vector (nz_datawidth_upperbound downto nz_datawidth_lowerbound)   := (others=>'0'));
end general_2_bit_register ;

architecture Behavioral of general_2_bit_register is

    signal sig_out : std_logic_vector (nz_datawidth_upperbound downto nz_datawidth_lowerbound)    := (others=>'0');

begin

    nz_reg : process (nz_register_rst, nz_register_load, nz_register_in, nz_register_clk)
    begin
        if ( nz_register_rst = neanderFalse ) then
            sig_out <= (others=>'0');
        elsif (nz_register_clk'event and nz_register_clk = neanderTrue) then
            if (nz_register_load = neanderTrue) then
                sig_out <= nz_register_in;
            else
                sig_out <= sig_out;
            end if;
        end if;
    end process nz_reg;
    nz_register_out <= sig_out;

end Behavioral;
