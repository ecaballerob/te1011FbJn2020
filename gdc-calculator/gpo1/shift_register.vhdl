library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
    port(
        clk, clr, sdr, sdl : in std_logic;
        mode : in std_logic_vector(1 downto 0);
        parallel : in std_logic_vector(3 downto 0);
        q : out std_logic_vector(3 downto 0)
    );
end entity;

architecture arch of shift_register is
    type state_type is (S0, S1, S2, S3)
    signal present, future : state_type;
    signal qn : std_logic_vector(3 downto 0);

begin
    
    q <= qn;

    -- Sequencial
    process(clr, clk)
    begin
        if clr = '0' then
            qn <= "0000";
        else
            if rising_edge(clk) then
                present <= future;
            end if;
        end if;
    end process;

    --- Combinacional
    process (mode, present)
    begin
        case mode is
            when "00" => 
                qn <= qn;
                future <= S0;
            when "01" =>
                qn <= qn(3 downto 1) & sdr;
                future <= S1;
            when "10" =>
                qn <= sdl & q(2 downto 0);
                future <= S2;
            when "11" =>
                qn <= parallel;
                future <= S3;
        end case;
    end process;


end arch ; -- arch