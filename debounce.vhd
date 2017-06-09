
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity debounce is
	port(
		b   : in std_logic;
		clk : in std_logic;
		db  : out std_logic);
end debounce;

architecture Behavioral of debounce is
    signal sdb : std_logic := '0';
    type s_button is (b0, b1);
    signal s_b : s_button;

begin

    db <= sdb;
    Process(clk)
    begin
        if (clk'event and clk = '1') then
            case( s_b ) is
                when b0 =>
                    if (b = '1') then
                        sdb <= '1';
                        s_b <= b1;
                    end if;
                when b1 =>
                    sdb <= '0';
                    if (b = '0') then
                        s_b <= b0;
                    end if;
            end case;
        end if;
    end process;
end Behavioral;
