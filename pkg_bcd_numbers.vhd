library ieee;
use ieee.std_logic_1164.all;

package pkg_bcd_numbers is

	constant UM     	: std_logic_vector(6 downto 0) := "1111001";
	constant DOIS   	: std_logic_vector(6 downto 0) := "0100100";
	constant TRES   	: std_logic_vector(6 downto 0) := "0110000";
	constant QUATRO 	: std_logic_vector(6 downto 0) := "0011001";
	constant CINCO  	: std_logic_vector(6 downto 0) := "0010010";
	constant SEIS   	: std_logic_vector(6 downto 0) := "0000010";
	constant SETE   	: std_logic_vector(6 downto 0) := "1111000";
	constant OITO   	: std_logic_vector(6 downto 0) := "0000000";
	constant NOVE   	: std_logic_vector(6 downto 0) := "0010000";
	constant DEZ		: std_logic_vector(6 downto 0) := "0001000";
	constant ONZE   	: std_logic_vector(6 downto 0) := "0000011";
	constant DOZE   	: std_logic_vector(6 downto 0) := "1000110";
	constant TREZE  	: std_logic_vector(6 downto 0) := "0100001";
	constant QUATORZE   : std_logic_vector(6 downto 0) := "0000110";
	constant QUINZE 	: std_logic_vector(6 downto 0) := "0001110";
	constant ZERO   	: std_logic_vector(6 downto 0) := "1000000";
	constant ERRO		: std_logic_vector(6 downto 0) := "0101010";
	
	constant I    	: std_logic_vector(3 downto 0) := "0001";
	constant II   	: std_logic_vector(3 downto 0) := "0010";
	constant III  	: std_logic_vector(3 downto 0) := "0011";
	constant IV   	: std_logic_vector(3 downto 0) := "0100";
	constant V    	: std_logic_vector(3 downto 0) := "0101";
	constant VI   	: std_logic_vector(3 downto 0) := "0110";
	constant VII  	: std_logic_vector(3 downto 0) := "0111";
	constant VIII 	: std_logic_vector(3 downto 0) := "1000";
	constant IX   	: std_logic_vector(3 downto 0) := "1001";
	constant X   	: std_logic_vector(3 downto 0) := "1010";
	constant XI   	: std_logic_vector(3 downto 0) := "1011";
	constant XII   	: std_logic_vector(3 downto 0) := "1100";
	constant XIII  	: std_logic_vector(3 downto 0) := "1101";
	constant XIV   	: std_logic_vector(3 downto 0) := "1110";
	constant XV   	: std_logic_vector(3 downto 0) := "1111";
	constant O	  	: std_logic_vector(3 downto 0) := "0000";
	
end pkg_bcd_numbers;