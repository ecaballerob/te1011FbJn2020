library std;
use std.textio.all;

entity hello_world is
end entity;

architecture arch of hello_world is
begin
    process
        variable l : line;
    begin
        write(l, String'("Hello World!"));
        writeline(output, l);
        wait;
    end process;
end arch ; -- arch