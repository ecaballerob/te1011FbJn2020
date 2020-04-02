library ieee;
use ieee.std_logic_1164.all;

entity ff_d is 
    port(
        d, clk, ld, rst : in std_logic;
        q, q_n : out std_logic
    );
end entity;

architecture arch of ff_d is
begin
    process (clk)    
    begin
        if rst = '1' then
            q <= '0';
            q_n <= '1';
        else 
            if clk = '1' and clk'event then
                if ld = '1' then
                    q <= d;
                    q_n <= not d;
                end if;
            end if;
        end if;
    end process;
end arch;