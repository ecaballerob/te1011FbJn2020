library ieee;
use ieee.std_logic_1164.all;

entity ffd is
    port (
        clk, ld, d: in std_logic;
        reset : in std_logic;
        q : out std_logic
    );
end entity;

architecture arch of ffd is
begin
    process (clk, reset)
    begin
        if (reset = '1') then
            q <= '0';
        elsif rising_edge(clk) then
            if ld = '1' then
                q <= d;
            end if;
        end if;
    end process;
    
end arch;

