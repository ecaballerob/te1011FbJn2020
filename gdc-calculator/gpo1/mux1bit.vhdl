library ieee;
use ieee.std_logic_1164.all;

entity mux1bit is 
    port(
        x, y : in std_logic;
        sel : in std_logic;
        res : out std_logic);
end entity mux1bit;

architecture arch of mux1bit is

begin
    res <= (x and not sel) or (y and sel);
end arch;