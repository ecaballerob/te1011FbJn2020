library ieee;
use ieee.std_logic_1164.all;

entity systemX is
    port(
        abc : in std_logic_vector(2 downto 0);
        f : out std_logic
    );
end entity;

architecture arch of systemX is
begin
    process (abc)
    begin
        case abc is
            when "000" | "010" | "110" => f <= '1';
            when others => f <= '0';
        end case;
    end process;

end arch ; -- arch