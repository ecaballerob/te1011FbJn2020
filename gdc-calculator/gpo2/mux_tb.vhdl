library ieee;
use ieee.std_logic_1164.all;

entity mux_tb is
end entity;

architecture arch of mux_tb is
    signal x, y : std_logic_vector(3 downto 0);
    signal sel : std_logic;
    signal res : std_logic_vector(3 downto 0);

    --- USING COMPONENT / PORT MAP

    COMPONENT mux is
        port (
        x, y : in std_logic_vector(3 downto 0);
        sel : in std_logic;
        res : out std_logic_vector(3 downto 0)
        );
    end component mux;

    begin
    -- EXPLICIT
        UUT : mux port map ( 
                            x => x, 
                            y => y,
                            sel => sel,
                            res => res
                         );
    -- IMPLICIT
    -- UTT : mux port map(x, y, sel, res);

    -- UUT :   entity work.mux port map (x => x, y => y, sel => sel, res => res);

    x <= "0101" after 20 ns, "1100" after 40 ns, "1001" after 60 ns, "0110" after 80 ns;
    y <= "1111" after 20 ns, "0000" after 40 ns, "1011" after 60 ns, "1110" after 80 ns;
    
    sel <= '1' after 20 ns, '0' after 40 ns, '1' after 60 ns, '1' after 90 ns;

end architecture;
