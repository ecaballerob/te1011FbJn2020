library ieee;
use ieee.std_logic_1164.all;

entity mux is
    port (
        x, y : in std_logic_vector(3 downto 0);
        sel : in std_logic;
        res : out std_logic_vector(3 downto 0)
    );
end entity;

architecture arch of mux is
    begin
-- USING PROCESS
        process (sel, x, y)
        begin
-- USING CASE WHEN
--               case sel is
--                    when '0' => res <= x;
--                    when '1' => res <= y;
--                    when others null;
--                end case;

-- USING IF/ELSE
            if sel = '0' then
                res <= x;
            elsif sel = '1' then
                res <= y;
            else
                null;
            end if;
        end process;

        
end architecture arch;