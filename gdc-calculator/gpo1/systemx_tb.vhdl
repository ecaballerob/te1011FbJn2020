library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity systemx_tb is
end entity;

architecture arch of systemx_tb is

    component systemx is
        port (
            ABC : in std_logic_vector(2 downto 0);
            F : out std_logic
        );
    end component;

    signal ABC : std_logic_vector(2 downto 0);
    signal F : std_logic;


begin

    UUT : systemx port map (ABC, F);

    stimulus : process
--        file fout : TEXT open WRITE_MODE is "output.txt";
        variable current_line : line;

    begin
        write(current_line, string'("Inicio del test (Entrada=ABC, Salida=F)"));
        writeline(output, current_line);

        ABC <= "000"; wait for 125 ns;
        write(current_line, string'("ABC="));
        write(current_line, ABC);
        write(current_line, string'("F="));
        write(current_line, F);
        writeline(output, current_line);

        ABC <= "001"; wait for 125 ns;
        write(current_line, string'("ABC="));
        write(current_line, ABC);
        write(current_line, string'("F="));
        write(current_line, F);
        writeline(output, current_line);

        ABC <= "010"; wait for 125 ns;
        write(current_line, string'("ABC="));
        write(current_line, ABC);
        write(current_line, string'("F="));
        write(current_line, F);
        writeline(output, current_line);


        ABC <= "011"; wait for 125 ns;
        write(current_line, string'("ABC="));
        write(current_line, ABC);
        write(current_line, string'("F="));
        write(current_line, F);
        writeline(output, current_line);
        
        ABC <= "100"; wait for 125 ns;
        write(current_line, string'("ABC="));
        write(current_line, ABC);
        write(current_line, string'("F="));
        write(current_line, F);
        writeline(output, current_line);

        wait;
    end process;


end arch ; -- arch