library ieee;
use ieee.std_logic_1164.all;

entity comparator_tb is
end entity;

architecture arch of comparator_tb is

    component comparator is 
        port(
            X, Y : in std_logic_vector(3 downto 0);
            xy_eq, xy_gt, xy_lt : out std_logic;
            R : out std_logic_vector(3 downto 0)
        );
    end component;

    signal X, Y, R : std_logic_vector(3 downto 0);
    signal xy_eq, xy_gt, xy_lt : std_logic;

begin

    UUT : comparator port map (X, Y, xy_eq, xy_gt, xy_lt, R);

    X <= x"0" after 0 ns, x"4" after 10 ns, x"A" after 20 ns, x"5" after 30 ns, x"0" after 40 ns;
    Y <= x"0" after 0 ns, x"4" after 10 ns, x"7" after 20 ns, x"C" after 30 ns, x"0" after 40 ns;

end arch ; -- arch