library ieee;
use ieee.std_logic_1164.all;

entity example is
end entity;

architecture arch of example is 

    signal A, B, C, D : integer := 0;
    signal E : std_logic;

begin
    process 
    begin
        E <= '0';
        wait for 20 ns;
        E <= '1';
        wait for 20 ns;
    end process;

    p2: process(E) 
    begin 
        A <= 1 after 5 ns; 
        B <= A + 1; 
        C <= B after 10 ns; 
        D <= B after 3 ns; 
        A <= A + 5 after 15 ns; 
        B <= B + 7;
    end process p2; 

end architecture;
