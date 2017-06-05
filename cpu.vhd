library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use IEEE.STD_LOGIC_1164.ALL;

use work.pkg_alu_constant_definitions.all;
use work.pkg_general_characteristics.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity cpu is
    Port (
        cpu_clk : in  STD_LOGIC;
        cpu_rst : in  STD_LOGIC;
        mem_addr: in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound);
        mem_out : out  STD_LOGIC_VECTOR (datawidth_upperbound downto datawidth_lowerbound));
end cpu;

architecture Behavioral of cpu is

    COMPONENT memoryBRAM
        PORT (
            clka : IN STD_LOGIC;
            wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addra : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            dina : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
            clkb : IN STD_LOGIC;
            web : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
            addrb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            dinb : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            doutb : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
    END COMPONENT memoryBRAM;

    component pc_8_bit is
        Port (
            pc_clk  : in std_logic;
            pc_rst  : in std_logic; -- enabled when high
            pc_load : in std_logic; -- enabled when high
            pc_inc  : in std_logic; -- enabled when hich
            pc_in   : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
        	pc_out  : out std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)   := (others=>'0'));
    end component pc_8_bit;

    component general_8_bit_register is
        Port (
            register_8_clk  : in std_logic;
            register_8_rst  : in std_logic; -- enabled when high
            register_8_load : in std_logic; -- enabled when high
            register_8_in   : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
        	register_8_out  : out std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)   := (others=>'0'));
    end component general_8_bit_register;

    component  mux_2_1_8bit is
        Port (
            mux_2_1_sel     : in std_logic;
            mux_2_1_in_a    : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
            mux_2_1_in_b    : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
        	mux_2_1_out     : out std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)   := (others=>'0'));
    end component mux_2_1_8bit;

    component  general_2_bit_register is
        Port (
            nz_register_clk  : in std_logic;
            nz_register_rst  : in std_logic; -- enabled when high
            nz_register_load : in std_logic; -- enabled when high
            nz_register_in   : in std_logic_vector (nz_datawidth_upperbound downto nz_datawidth_lowerbound)    := (others=>'0');
        	nz_register_out  : out std_logic_vector (nz_datawidth_upperbound downto nz_datawidth_lowerbound)   := (others=>'0'));
    end component general_2_bit_register ;

    component alu_neander is
        Port (
            alu_input_y    : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
            alu_input_x    : in std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
            alu_operation_result   : out std_logic_vector (datawidth_upperbound downto datawidth_lowerbound)    := (others=>'0');
            alu_nz  : out std_logic_vector(1 downto 0) := (others=>'0');
            alu_select : in std_logic_vector(aluSelectWidth_upperbound downto aluSelectWidth_lowerbound) := (others=>'0'));
    end component alu_neander;

    component neander_cpu is
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
    end component neander_cpu;



    signal sig_ac_out   : std_logic_vector (datawidth_upperbound downto datawidth_lowerbound);
    signal clka, clkb   : std_logic;
    signal wea, web     : std_logic_vector (0 downto 0);
    signal addra, addrb : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal dina, dinb   : STD_LOGIC_VECTOR(7 DOWNTO 0);
    signal douta, doutb : STD_LOGIC_VECTOR(7 DOWNTO 0);

    signal load_rem     : std_logic;
    signal mux_output   : std_logic_vector(datawidth_upperbound downto datawidth_lowerbound);
    signal mux_sel      : std_logic;
    signal pc_inc       : std_logic;
    signal pc_out       : std_logic_vector(datawidth_upperbound downto datawidth_lowerbound);
    signal load_pc     : std_logic;
    signal rdm_out      : std_logic_vector(datawidth_upperbound downto datawidth_lowerbound);
    signal load_wdm     : std_logic;
    signal alu_out      : std_logic_vector(datawidth_upperbound downto datawidth_lowerbound);
    signal load_rdm     : std_logic;
    signal load_ir      : std_logic;
    signal opcode       : std_logic_vector(datawidth_upperbound downto datawidth_lowerbound);
    signal alu_nz       : std_logic_vector(nz_datawidth_upperbound downto nz_datawidth_lowerbound);
    signal alu_select   : std_logic_vector(aluSelectWidth_upperbound downto aluSelectWidth_lowerbound);
    signal load_nz      : std_logic;
    signal nz_out       : std_logic_vector(nz_datawidth_upperbound downto nz_datawidth_lowerbound);
    signal acc_out      : std_logic_vector(datawidth_upperbound downto datawidth_lowerbound);
    signal load_acc     : std_logic;
    signal read_mem     : std_logic;

begin

    clka <= cpu_clk;
    clkb <= cpu_clk;
    addrb <= mem_addr;
    mem_out <= doutb;
    BRAM : memoryBRAM
        PORT MAP (clka => clka, wea => wea, addra => addra, dina => dina, douta => douta, clkb => clkb,
            web => web, addrb => addrb, dinb => dinb, doutb => doutb);

    remm : general_8_bit_register port map (cpu_clk, cpu_rst, load_rem, mux_output, addra);

    mux : mux_2_1_8bit port map (mux_sel, pc_out, rdm_out, mux_output);

    pc  : pc_8_bit port map (cpu_clk, cpu_rst, load_pc, pc_inc, rdm_out, pc_out);

    rdm : general_8_bit_register port map (cpu_clk, cpu_rst, load_rdm, douta, rdm_out);

    wdm : general_8_bit_register port map (cpu_clk, cpu_rst, load_wdm, acc_out, dina);

    acc : general_8_bit_register port map (cpu_clk, cpu_rst, load_acc, alu_out, acc_out);

    ri  : general_8_bit_register port map (cpu_clk, cpu_rst, load_ir, rdm_out, opcode);

    alu : alu_neander port map (rdm_out, acc_out, alu_out, alu_nz, alu_select);

    nz  : general_2_bit_register port map (cpu_clk, cpu_rst, load_nz, alu_nz, nz_out);

    control_unit : neander_cpu
        port map(
        instruction_in  => opcode,
        alu_nz          => alu_nz,
        neander_cpu_rst => cpu_rst,
        neander_cpu_clk => cpu_clk,
        load_ac         => load_acc,
        load_rem        => load_rem,
        load_nz         => load_nz,
        load_rdm        => load_rdm,
        load_wdm        => load_wdm,
        load_ir         => load_ir,
        load_pc         => load_pc,
        inc_pc          => pc_inc,
        sel_alu         => alu_select,
        sel_mux         => mux_sel,
        read_mem        => read_mem,
        write_mem       => wea(0));

end Behavioral;
