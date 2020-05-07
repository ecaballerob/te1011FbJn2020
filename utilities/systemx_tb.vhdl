library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity systemx_tb is
end entity;

architecture arch of systemx_tb is
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
        variable current_read_line, current_write_line : line;
        variable current_read_field0 : string(1 to 7);
        variable current_read_field1 : std_logic_vector(2 downto 0);

        file fin : TEXT open READ_MODE is "input_test.txt";

    begin

        readFile : while (not endfile(Fin)) loop
            readline(fin, current_read_line);
            read(current_read_line, current_read_field0);
            read(current_read_line, current_read_field1);

            abc <= current_read_field1;

            wait for 125 ns;

            write(current_write_line, current_read_field0);
            write(current_write_line, string'(" "));
            write(current_write_line, current_read_field1);

            write(current_write_line, string'(" "));

            write(current_write_line, string'("Salida de mi UUT: F="));
            write(current_write_line, f);
            writeline(OUTPUT, current_write_line);

        end loop ; -- readFile

        wait;


    end process;


end arch ; -- arch