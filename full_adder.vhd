library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

use work.pkg_general_characteristics.all;
use work.pkg_alu_constant_definitions.all;

--  entity definition
-- it is used in all operations with ULA
entity full_adder is
    Port (
        x       : in std_logic;
        y       : in std_logic;
        c_in    : in std_logic;
        s       : out std_logic;
        c_out   : out std_logic);
end full_adder;

architecture Behavioral of full_adder is
    signal sig_s	    :	std_logic := '0';
    signal sig_c_out    :	std_logic := '0';
begin

s <= sig_s;
c_out <= sig_c_out;
full_adder_process : process(x, y, c_in)
begin
    sig_s <= x xor y xor c_in;
    sig_c_out <= (x and y) or (c_in and x) or (c_in and y);
end process full_adder_process;

end Behavioral;
