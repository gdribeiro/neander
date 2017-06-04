library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

use work.pkg_general_characteristics.all;
use work.pkg_alu_constant_definitions.all;

entity adder8 is
    Port (
        x    : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
        y    : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
        c_in : in std_logic := '0';
        o    : out std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
        c_out: out std_logic);
end adder8;

architecture Behavioral of adder8 is

    component full_adder is
    port(
            x       : in std_logic;
            y       : in std_logic;
            c_in    : in std_logic;
            s       : out std_logic;
            c_out   : out std_logic);
    end component full_adder;

    signal sig_x : std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
    signal sig_y : std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
    signal sig_o : std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
    signal c0, c1, c2, c3, c4, c5, c6, c7, c8 : std_logic := '0';
begin

    sig_x <= x;
    sig_y <= y;
    c0 <= c_in;
    o <= sig_o;
    c_out <= c8;

    -- I could've used for to generate all of it, but why when there are only
    -- 8 of it
    adder0 : full_adder
    port map (sig_x(0), sig_y(0), c0, sig_o(0), c1);

    adder1 : full_adder
    port map (sig_x(1), sig_y(1), c1, sig_o(1), c2);

    adder2 : full_adder
    port map (sig_x(2), sig_y(2), c2, sig_o(2), c3);

    adder3 : full_adder
    port map (sig_x(3), sig_y(3), c3, sig_o(3), c4);

    adder4 : full_adder
    port map (sig_x(4), sig_y(4), c4, sig_o(4), c5);

    adder5 : full_adder
    port map (sig_x(5), sig_y(5), c5, sig_o(5), c6);

    adder6 : full_adder
    port map (sig_x(6), sig_y(6), c6, sig_o(6), c7);

    adder7 : full_adder
    port map (sig_x(7), sig_y(7), c7, sig_o(7), c8);

end Behavioral;
