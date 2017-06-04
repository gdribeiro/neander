library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

use work.pkg_alu_constant_definitions.all;
use work.pkg_general_characteristics.all;
use work.pkg_neander_instructions_constants.all;


entity neander_cpu is

    Port (
        instruction_in  : in std_logic_vector(datawidth_upperbound downto datawidth_lowerbound);
        load_ac         : out std_logic;
        load_rem        : out std_logic;
        load_nz         : out std_logic;
        load_rdm        : out std_logic;
        load_ir         : out std_logic;
        load_pc         : out std_logic;
        inc_pc          : out std_logic;
        sel_alu         : out std_logic;
        sel_mux         : out std_logic;

        read_mem        : out std_logic;
        write_mem       : out std_logic);
end neander_cpu;

architecture Behavioral of neander_cpu is

    -- Declares a type instruction and a signal of this type to control the FSM
    type t_instructions is (NOP_i, STA_i, LDA_i, ADD_i, OR_i, AND_i, NOT_i, JMP_i, JN_i, JZ_i, HLT_i);
    signal inst : t_instructions;





begin


























    decoder_process : process(instruction_in)
    begin
        case( instruction_in(7 downto 4) ) is
            when I_NOP => inst <= NOP_i;
            when I_STA => inst <+ STA_i;
            when I_LDA => inst <= LDA_i;
            when I_ADD => inst <= ADD_i;
            when I_OR  => inst <= OR_i;
            when I_AND => inst <= AND_i;
            when I_NOT => inst <= NOT_i;
            when I_JMP => inst <= JMP_i;
            when I_JN  => inst <= JN_i;
            when I_HLT => inst <= HLT_i;

            -- If invalid valued are passed the cpu halts
            when others => inst <= HLT_i;
        end case;
    end process decoder_process;




end Behavioral;
