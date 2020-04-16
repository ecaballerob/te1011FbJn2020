library ieee;
use ieee.std_logic_1164.all;

entity mealy is
    port (
        clk, tr : in std_logic;
        p       : out std_logic
    );
end entity;

architecture arch of mealy is

    type state is (stop0, go);
    signal present : state := stop0;
    signal future : state;

begin

    process (clk)
    begin
        if rising_edge(clk) then
            present <= future;
        end if;
    end process;
    
    process (clk, tr, present)
    begin
        case present is
            when stop0 =>
                if tr = '1' and clk = '0' then
                    p <= '1';
                    future <= stop0;
                elsif tr = '0' and clk = '0' then
                    p <= '0';
                    future <= stop0;
                elsif tr = 'X' and clk = '1' then
                    p <= '0';
                    future <= go;
                end if;
            when go =>
                if tr = 'X' and clk = '0' then
                    p <= '0';
                    future <= go;
                elsif tr = 'X' and clk = '1' then
                    p <= '0';
                    future <= stop0;
                end if;
        end case;
    end process;
            
end arch;