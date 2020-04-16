library ieee;
use ieee.std_logic_1164.all;

entity moore is 
    port (
        clk :  in std_logic;
        sem   :  out std_logic_vector(1 downto 0)
    );
end entity;

architecture arch of moore is 

type state is (red, green, yellow);
signal actual : state := red;
signal future : state;

begin

    process (clk)
    begin 
        if actual = red then
            if rising_edge(clk) then
                future <= green;
            else
                future <= red;
            end if;
        elsif actual = green then
            if rising_edge(clk) then
                future <= yellow;
            else
                future <= green;
            end if;
        elsif actual = yellow then
            if rising_edge(clk) then
                future <= red;
            else
                future <= yellow;
            end if;
        end if;
    end process;
    
    process ( future )
    begin
        if future = red then
            sem <= "00";
        elsif future = green then
            sem <= "01";
        elsif future = yellow then
            sem <= "10";
        end if;
        actual <= future;
    end process;

end arch;