library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

use work.pkg_general_characteristics.all;
use work.pkg_alu_constant_definitions.all;

--  entity definition
-- it is used in all operations with ULA
entity read_write_selector is
    Port (
        rdm_clk     : in std_logic;
        rdm_rst     : in std_logic;
        rdm_load    : in std_logic;
        rdm_wr_mem  : in std_logic;
        rdm_rd_mem  : in std_logic;
        rdm_acc_in  : in std_logic_vector(datawidth_upperbound downto datawidth_lowerbound);
        rdm_mem_in  : in std_logic_vector(datawidth_upperbound downto datawidth_lowerbound);
        rdm_mem_out : out std_logic_vector(datawidth_upperbound downto datawidth_lowerbound);
        rdm_acc_out : out std_logic_vector(datawidth_upperbound downto datawidth_lowerbound));
end read_write_selector;

architecture Behavioral of read_write_selector is
    signal sig_mem_out : std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
    signal sig_acc_out : std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
    signal sig_acc_in : std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
    signal sig_mem_in : std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
begin

sig_mem_in <= rdm_mem_in;
sig_acc_in <= rdm_acc_in;



rdm_acc_out <= sig_acc_out;
rdm_wr_process: process(rdm_rst, rdm_clk, rdm_load, rdm_wr_mem)
begin
    if (rdm_rst = neanderTrue) then
        sig_acc_out <= (others=>'0');
    elsif (rdm_clk'event and rdm_clk = neanderTrue) then
        if (rdm_load = neanderTrue) then
            if (rdm_wr_mem = neanderTrue) then
                sig_acc_out <= sig_acc_in;
            else
                sig_acc_out <= sig_acc_out;
            end if;
        end if;
    end if;
end process rdm_wr_process;

rdm_mem_out <= sig_mem_out;
rdm_rd_process: process(rdm_rst, rdm_clk, rdm_load, rdm_rd_mem)
begin
    if (rdm_rst = neanderTrue) then
        sig_mem_out <= (others=>'0');
    elsif (rdm_clk'event and rdm_clk = neanderTrue) then
        if (rdm_load = neanderTrue) then
            if (rdm_rd_mem = neanderTrue) then
                sig_mem_out <= sig_mem_in;
            else
                sig_mem_out <= sig_mem_out;
            end if;
        end if;
    end if;
end process rdm_rd_process;






end Behavioral;
