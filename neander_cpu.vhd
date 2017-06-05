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
        alu_nz          : in std_logic_vector(nz_datawidth_upperbound downto nz_datawidth_lowerbound);
        neander_cpu_rst : in std_logic;
        neander_cpu_clk : in std_logic;
        load_ac         : out std_logic;
        load_rem        : out std_logic;
        load_nz         : out std_logic;
        load_rdm        : out std_logic;
        load_wdm        : out std_logic;
        load_ir         : out std_logic;
        load_pc         : out std_logic;
        inc_pc          : out std_logic;
        sel_alu         : out std_logic_vector (aluSelectWidth_upperbound downto aluSelectWidth_lowerbound);
        sel_mux         : out std_logic;
        read_mem        : out std_logic;
        write_mem       : out std_logic);
end neander_cpu;

architecture Behavioral of neander_cpu is

    -- Declares a type instruction and a signal of this type to control the FSM
    type t_instructions is (NOP_i, STA_i, LDA_i, ADD_i, OR_i, AND_i, NOT_i, JMP_i, JN_i, JZ_i, HLT_i);
    signal inst : t_instructions;

    type t_state is (s0, s1, s2, s3, s4, s5, s6, s7, sReadMem, sWriteMem, hltState );
    signal state, nextState, stallState : t_state := s0;

    signal s_load_ac, s_load_rem, s_load_nz, s_load_rdm, s_load_wdm, s_load_ir, s_load_pc,
        s_inc_pc, s_sel_mux, s_read_mem, s_write_mem : std_logic := neanderFalse;
    signal s_sel_alu : std_logic_vector (aluSelectWidth_upperbound downto aluSelectWidth_lowerbound) := "000";
    signal s_alu_nz  : std_logic_vector (nz_datawidth_upperbound downto nz_datawidth_lowerbound) := "00";

begin

    control_process : process (state, inst, s_alu_nz)
    begin
        case ( state ) is
            when s0 =>
                s_load_ac   <= neanderFalse;
                --s_load_rem  <= neanderFalse;
                s_load_nz   <= neanderFalse;
                s_load_rdm  <= neanderFalse;
                s_load_wdm  <= neanderFalse;
                s_load_ir   <= neanderFalse;
                s_load_pc   <= neanderFalse;
                s_inc_pc    <= neanderFalse;
                --s_sel_mux   <= neanderFalse;
                s_read_mem  <= neanderFalse;
                s_write_mem <= neanderFalse;

                s_sel_mux <= neanderFalse;
                s_load_rem <= neanderTrue;
                nextState <= s1;

            when s1 =>
                s_load_ac   <= neanderFalse;
                s_load_rem  <= neanderFalse;
                s_load_nz   <= neanderFalse;
                s_load_rdm  <= neanderFalse;
                s_load_wdm  <= neanderFalse;
                s_load_ir   <= neanderFalse;
                s_load_pc   <= neanderFalse;
                s_sel_mux   <= neanderFalse;
                --s_inc_pc    <= neanderFalse;
                --s_read_mem  <= neanderFalse;
                s_write_mem <= neanderFalse;

                s_read_mem <= neanderTrue;
                s_inc_pc <= neanderTrue;
                stallState <= s2;
                nextState <= sReadMem;

            when s2 =>
                s_load_ac   <= neanderFalse;
                s_load_rem  <= neanderFalse;
                s_load_nz   <= neanderFalse;
                s_load_rdm  <= neanderFalse;
                s_load_wdm  <= neanderFalse;
                --s_load_ir   <= neanderFalse;
                s_load_pc   <= neanderFalse;
                s_inc_pc    <= neanderFalse;
                s_sel_mux   <= neanderFalse;
                s_read_mem  <= neanderFalse;
                s_write_mem <= neanderFalse;

                s_load_ir <= neanderTrue;
                nextState <= s3;

            when s3 =>
                s_load_ac   <= neanderFalse;
                s_load_rem  <= neanderFalse;
                s_load_nz   <= neanderFalse;
                s_load_rdm  <= neanderFalse;
                s_load_wdm  <= neanderFalse;
                s_load_ir   <= neanderFalse;
                s_load_pc   <= neanderFalse;
                s_inc_pc    <= neanderFalse;
                s_sel_mux   <= neanderFalse;
                s_read_mem  <= neanderFalse;
                s_write_mem <= neanderFalse;

                case ( inst ) is
                    when NOT_i =>
                        s_sel_alu <= alu_not_x;
                        s_load_ac <= neanderTrue;
                        s_load_nz <= neanderTrue;
                        nextState <= s0;
                    when JN_i =>
                        if (s_alu_nz(1) = neanderFalse) then
                            s_inc_pc <= neanderTrue;
                            nextState <= s0;
                        end if;
                    when JZ_i =>
                        if (s_alu_nz(0) = neanderFalse) then
                            s_inc_pc <= neanderTrue;
                            nextState <= s0;
                        end if;
                    when NOP_i =>
                        nextState <= s0;
                    when HLT_i =>
                        s_inc_pc <= neanderFalse;
                        nextState <= hltState;
                    when others =>
                        s_sel_mux <= neanderFalse;
                        s_load_rem <= neanderTrue;
                        nextState <= s4;
                end case;

            when s4 =>
                s_load_ac   <= neanderFalse;
                s_load_rem  <= neanderFalse;
                s_load_nz   <= neanderFalse;
                s_load_rdm  <= neanderFalse;
                s_load_wdm  <= neanderFalse;
                s_load_ir   <= neanderFalse;
                s_load_pc   <= neanderFalse;
                s_inc_pc    <= neanderFalse;
                s_sel_mux   <= neanderFalse;
                s_read_mem  <= neanderFalse;
                s_write_mem <= neanderFalse;

                case ( inst ) is
                    when JMP_i =>
                        s_read_mem <= neanderTrue;
                        nextState  <= s5;
                    when JN_i =>
                        if (s_alu_nz(1) = neanderTrue) then
                            s_read_mem <= neanderTrue;
                            nextState <= s5;
                        end if;
                    when JZ_i =>
                        if (s_alu_nz(0) = neanderTrue) then
                            s_read_mem <= neanderTrue;
                            nextState <= s5;
                        end if;
                    when others =>
                        s_read_mem <= neanderTrue;
                        s_inc_pc   <= neanderTrue;
                end case;

            when s5 =>
                s_load_ac   <= neanderFalse;
                s_load_rem  <= neanderFalse;
                s_load_nz   <= neanderFalse;
                s_load_rdm  <= neanderFalse;
                s_load_wdm  <= neanderFalse;
                s_load_ir   <= neanderFalse;
                s_load_pc   <= neanderFalse;
                s_inc_pc    <= neanderFalse;
                s_sel_mux   <= neanderFalse;
                s_read_mem  <= neanderFalse;
                s_write_mem <= neanderFalse;

                case( inst ) is
                    when JMP_i =>
                        s_load_pc <= neanderTrue;
                        nextState <= s0;
                    when JN_i =>
                        if (s_alu_nz(1) = neanderTrue) then
                            s_load_pc <= neanderTrue;
                            nextState <= s0;
                        end if;
                    when JZ_i =>
                        if (s_alu_nz(0) = neanderTrue) then
                            s_load_pc <= neanderTrue;
                            nextState <= s0;
                        end if;
                    when others =>
                        s_sel_mux <= neanderTrue;
                        s_load_rem <= neanderTrue;
                        nextState <= s6;
                end case;

            when s6 =>
                s_load_ac   <= neanderFalse;
                s_load_rem  <= neanderFalse;
                s_load_nz   <= neanderFalse;
                s_load_rdm  <= neanderFalse;
                s_load_wdm  <= neanderFalse;
                s_load_ir   <= neanderFalse;
                s_load_pc   <= neanderFalse;
                s_inc_pc    <= neanderFalse;
                s_sel_mux   <= neanderFalse;
                s_read_mem  <= neanderFalse;
                s_write_mem <= neanderFalse;

                case ( inst ) is
                    when STA_i =>
                        s_load_wdm <= neanderTrue;
                        nextState <= s7;
                    when others =>
                        s_read_mem <= neanderTrue;
                        stallState <= s7;
                        nextState <= sReadMem;
                end case;

            when s7 =>
                s_load_ac   <= neanderFalse;
                s_load_rem  <= neanderFalse;
                s_load_nz   <= neanderFalse;
                s_load_rdm  <= neanderFalse;
                s_load_wdm  <= neanderFalse;
                s_load_ir   <= neanderFalse;
                s_load_pc   <= neanderFalse;
                s_inc_pc    <= neanderFalse;
                s_sel_mux   <= neanderFalse;
                s_read_mem  <= neanderFalse;
                s_write_mem <= neanderFalse;

                case ( inst ) is
                    when STA_i =>
                        s_write_mem <= neanderTrue;
                        stallState <= s0;
                        nextState <= sWriteMem;
                    when LDA_i =>
                        s_sel_alu <= alu_y;
                        s_load_ac <= neanderTrue;
                        s_load_nz <= neanderTrue;
                        nextState <= s0;
                    when ADD_i =>
                        s_sel_alu <= alu_add;
                        s_load_ac <= neanderTrue;
                        s_load_nz <= neanderTrue;
                        nextState <= s0;
                    when OR_i =>
                        s_sel_alu <= alu_or;
                        s_load_ac <= neanderTrue;
                        s_load_nz <= neanderTrue;
                        nextState <= s0;
                    when AND_i =>
                        s_sel_alu <= alu_and;
                        s_load_ac <= neanderTrue;
                        s_load_nz <= neanderTrue;
                        nextState <= s0;
                    when others =>
                        nextState <= s0;
                end case;

            when sReadMem =>
                s_load_ac   <= neanderFalse;
                s_load_rem  <= neanderFalse;
                s_load_nz   <= neanderFalse;
                --s_load_rdm  <= neanderFalse;
                s_load_wdm  <= neanderFalse;
                s_load_ir   <= neanderFalse;
                s_load_pc   <= neanderFalse;
                s_inc_pc    <= neanderFalse;
                s_sel_mux   <= neanderFalse;
                --s_read_mem  <= neanderFalse;
                s_write_mem <= neanderFalse;

                s_load_rdm <= neanderTrue;
                nextState <= stallState;

            when sWriteMem =>
                s_load_ac   <= neanderFalse;
                s_load_rem  <= neanderFalse;
                s_load_nz   <= neanderFalse;
                s_load_rdm  <= neanderFalse;
                s_load_wdm  <= neanderFalse;
                s_load_ir   <= neanderFalse;
                s_load_pc   <= neanderFalse;
                s_inc_pc    <= neanderFalse;
                s_sel_mux   <= neanderFalse;
                s_read_mem  <= neanderFalse;
                --s_write_mem <= neanderFalse;

                nextState <= stallState;

            when hltState =>
                s_inc_pc <= neanderFalse;
                nextState <= hltState;

            when others =>
                nextState <= s0;
        end case;
    end process control_process;


    reset_control_process : process (neander_cpu_clk, neander_cpu_rst)
    begin
        if (neander_cpu_rst = neanderTrue) then
            state <= s0;
        elsif (neander_cpu_clk'event and neander_cpu_clk = neanderTrue) then
            state <= nextState;
        end if;
    end process reset_control_process;


    decoder_process : process(instruction_in)
    begin
        case( instruction_in(7 downto 4) ) is
            when I_NOP => inst <= NOP_i;
            when I_STA => inst <= STA_i;
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

    load_ac <= s_load_ac;
    load_pc <= s_load_pc;
    load_ir <= s_load_ir;
    load_nz <= s_load_nz;
    load_rdm <= s_load_rdm;
    load_wdm <= s_load_wdm;
    load_rem <= s_load_rem;
    inc_pc  <= s_inc_pc;
    sel_alu <= s_sel_alu;
    sel_mux <= s_sel_mux;
    read_mem <= s_read_mem;
    write_mem <= s_write_mem;
    s_alu_nz <= alu_nz;

end Behavioral;
