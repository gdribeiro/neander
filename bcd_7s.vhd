library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;

use work.pkg_bcd_numbers.all;

entity bcd_7s is
  port 	(
  		bcd_in			:	in	std_logic_vector(3 downto 0);
  		sete_segmentos	:	out	std_logic_vector(6 downto 0)
	);
end bcd_7s;

architecture funcionalidade of bcd_7s is

begin

	conversor :	process(bcd_in)
		begin

			case bcd_in is
				when I		=> sete_segmentos(6 downto 0) <=     UM;
				when II		=> sete_segmentos(6 downto 0) <=   DOIS;
				when III	=> sete_segmentos(6 downto 0) <=   TRES;
				when IV		=> sete_segmentos(6 downto 0) <= QUATRO; 
				when V		=> sete_segmentos(6 downto 0) <=  CINCO;
				when VI		=> sete_segmentos(6 downto 0) <=   SEIS;
				when VII	=> sete_segmentos(6 downto 0) <=   SETE;
				when VIII	=> sete_segmentos(6 downto 0) <=   OITO;
				when IX		=> sete_segmentos(6 downto 0) <=   NOVE;
				when X		=> sete_segmentos(6 downto 0) <=   DEZ;
				when XI		=> sete_segmentos(6 downto 0) <=   ONZE;
				when XII	=> sete_segmentos(6 downto 0) <=   DOZE;
				when XIII	=> sete_segmentos(6 downto 0) <=   TREZE;
				when XIV	=> sete_segmentos(6 downto 0) <=   QUATORZE;
				when XV		=> sete_segmentos(6 downto 0) <=   QUINZE;
				when O		=> sete_segmentos(6 downto 0) <=   ZERO;
				when others => sete_segmentos(6 downto 0) <=   ZERO;
			end case;

	end process conversor;

end funcionalidade;
