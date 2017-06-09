library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

use work.pkg_alu_constant_definitions.all;
use work.pkg_general_characteristics.all;


entity alu_neander is

    Port (
        alu_input_y             : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
        alu_input_x             : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
        alu_operation_result    : out std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
        alu_nz                  : out std_logic_vector(1 downto 0) := (others=>'0');
        alu_select              : in std_logic_vector(aluSelectWidth_upperbound downto aluSelectWidth_lowerbound) := (others=>'0'));
end alu_neander;

architecture Behavioral of alu_neander is


    component adder8 is
        port(
            x    : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound);
            y    : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound);
            c_in : in std_logic := '0';
            o    : out std_logic_vector (datawidth_upperbound downto datawidth_lowerbound);
            c_out: out std_logic);
    end component adder8;

    signal sig_x :  std_logic_vector (datawidth_upperbound downto datawidth_lowerbound);
    signal sig_y :  std_logic_vector (datawidth_upperbound downto datawidth_lowerbound);
    signal sig_o :  std_logic_vector (datawidth_upperbound downto datawidth_lowerbound);
    signal sig_c_out : std_logic;


    signal sig_out : std_logic_vector (datawidth_upperbound downto datawidth_lowerbound) := (others=>'0');
    signal sig_alu_flag_negative    : std_logic := '0';
    signal sig_alu_flag_zero        : std_logic := '0';


begin

    -- Adder
    sig_x <= alu_input_x;
    sig_y <= alu_input_y;
    adder8_component : adder8
    port map(sig_x, sig_y, '0', sig_o, sig_c_out);

    -- ALU operation select
    alu_operation_result <= sig_out;
    alu : process(alu_select, alu_input_x, alu_input_y, sig_o, sig_out)
    begin
        case ( alu_select ) is
            when alu_add => sig_out <= sig_o;
            when alu_and => sig_out <= alu_input_x and alu_input_y;
            when alu_or => sig_out <= alu_input_x or alu_input_y;
            when alu_not_x => sig_out <= not alu_input_x;
            when alu_y => sig_out <=  alu_input_y;
            when others => sig_out <= (others=>'0');
        end case;
    end process alu;


    alu_nz(0) <= sig_alu_flag_zero;
    alu_nz(1) <= sig_alu_flag_negative;
    alu_nz_process : process(sig_out)
    begin
        case (sig_out(7)) is
            when neanderFalse =>
                if (sig_out = "00000000") then
                    sig_alu_flag_negative <= neanderFalse;
                    sig_alu_flag_zero <= neanderTrue;
                else
                    sig_alu_flag_negative <= neanderFalse;
                    sig_alu_flag_zero <= neanderFalse;
                end if;
            when neanderTrue =>
                sig_alu_flag_negative <= neanderTrue;
                sig_alu_flag_zero <= neanderFalse;
            when others =>
                sig_alu_flag_negative <= neanderFalse;
                sig_alu_flag_zero <= neanderFalse;
        end case;
    end process alu_nz_process;

end Behavioral;
