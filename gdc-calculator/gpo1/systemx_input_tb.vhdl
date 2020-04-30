library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity systemx_input_tb is
end entity;

architecture arch of systemx_input_tb is

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

        file fin : TEXT open READ_MODE is "input_test.txt";
        --file fout : TEXT open WRITE_MODE is "output.txt";

        variable current_read_line : line;
        variable current_read_field1 : string(1 to 7);
        variable current_read_field2 : std_logic_vector(2 downto 0);
        variable current_write_line : line;

    begin
        
        while (not endfile(fin)) loop

            readline(fin, current_read_line);
            read(current_read_line, current_read_field1);
            read(current_read_line, current_read_field2);

            ABC <= current_read_field2;
            wait for 125 ns;
            
            write(current_write_line, current_read_field1);
            write(current_write_line, string'(" "));
            write(current_write_line, current_read_field2);

            write(current_write_line, string'(" "));

            write(current_write_line, string'("Salida de  UUT: F="));
            write(current_write_line, F);
            writeline(output, current_write_line);
            
        end loop ;         
        
        wait;
    end process;


end arch ; -- arch