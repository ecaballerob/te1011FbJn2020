library ieee;
use ieee.std_logic_1164.all;

entity systemx is
    port (
        ABC : in std_logic_vector(2 downto 0);
        F : out std_logic
    );
end entity;

architecture arch of systemx is
begin
    Systemx_proc : process (ABC)
    begin
        case (ABC) is
            when "000"|"010"|"110" => F <= '1';
            when others => F <= '0';
        end case;
    end process;
end arch ; -- arch