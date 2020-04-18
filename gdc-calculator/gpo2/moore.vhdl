library ieee;
use ieee.std_logic_1164.all;

entity moore is 
    port (
        timer : in std_logic;
        s     : out std_logic_vector(1 downto 0)
    );
end entity;

architecture arch of moore is
    type state_type is (RED, GREEN, YELLOW);
    signal present_state : state_type := RED;
    signal future_state : state_type;

begin

--- SECUENCIAL
    process (timer)
    begin
    --  if timer = '1' and timer'event then
        if rising_edge(timer) then
            case future_state is
                when RED => present_state <= GREEN;
                when GREEN => present_state <= YELLOW;
                when YELLOW => present_state <= RED;
            end case;
        else
            case future_state is
                when RED => present_state <= RED;
                when GREEN => present_state <= GREEN;
                when YELLOW => present_state <= YELLOW;
            end case;
        end if;
    end process;

--- COMBINACIONAL

    process (present_state)
    begin
        case present_state is 
            when RED => s <= "00";
            when GREEN => s <="01";
            when YELLOW => s <= "10";
        end case;
        future_state <= present_state;
    end process;

end arch ; -- arch