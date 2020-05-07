library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity systemx_textout_tb is
end entity;

architecture arch of systemx_textout_tb is
    component systemX is
        port(
            abc : in std_logic_vector(2 downto 0);
            f : out std_logic
        );
    end component;

    signal abc : std_logic_vector(2 downto 0);
    signal f : std_logic;

begin
    UUT : systemX port map (abc, f);

    process
        file fout : TEXT open WRITE_MODE is "output.txt";
        variable current_line : line;

    begin

        write(current_line, string'("Inicio del Test (Entrada=ABC, Salida=F)"));
        writeline(fout, current_line);

        abc <= "000"; wait for 125 ns;

        write(current_line, string'("ABC="));
        write(current_line, abc);
        write(current_line, string'(", F="));
        write(current_line, f);
        writeline(fout, current_line);

        abc <= "001"; wait for 125 ns;

        write(current_line, string'("ABC="));
        write(current_line, abc);
        write(current_line, string'(", F="));
        write(current_line, f);
        writeline(fout, current_line);

        abc <= "010"; wait for 125 ns;

        write(current_line, string'("ABC="));
        write(current_line, abc);
        write(current_line, string'(", F="));
        write(current_line, f);
        writeline(fout, current_line);

        abc <= "011"; wait for 125 ns;

        write(current_line, string'("ABC="));
        write(current_line, abc);
        write(current_line, string'(", F="));
        write(current_line, f);
        writeline(fout, current_line);

        wait;


    end process;


end arch ; -- arch