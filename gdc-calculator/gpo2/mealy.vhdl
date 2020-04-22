library ieee;
use ieee.std_logic_1164.all;

entity mealy is
    port(
        timer, truck : in std_logic;
        pollution     : out std_logic
    );
end entity;

architecture arch of mealy is
    type state_type is (ST0P, GO);
    signal present_state : state_type := ST0P;
    signal future_state : state_type;
begin

    -- Secuencial
    process (timer) 
    begin
        if timer = '1' and timer'event then
            present_state <= future_state;
        end if;
    end process;

    -- combinacional
    process (truck, present_state)
    begin
        case present_state is
            when ST0P =>
                if truck = '0' then
                    pollution <= '0';
                elsif truck = '1' then
                    pollution <= '1';
                end if;
                future_state <= GO;
            when GO =>
                pollution <= '0';
                future_state <=  ST0P;
        end case;
        
    end process;

end arch;