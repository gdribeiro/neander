library ieee;
use ieee.std_logic_1164.all;

package pkg_general_characteristics is

    -- Variables to make it easier to define Datawidth range
    constant datawidth_lowerbound   : natural := 0;
    constant datawidth_upperbound   : natural := 7;

    constant instrucionWidth_lowerbound   : natural := 0;
    constant instrucionWidth_upperbound   : natural := 3;

    constant nz_datawidth_loweerbound   : natural := 0;
    constant nz_datawidth_upperbound    : natural := 1;

    constant neanderTrue    : std_logic := '1';
    constant neanderFalse   : std_logic := '0';

end pkg_general_characteristics;
