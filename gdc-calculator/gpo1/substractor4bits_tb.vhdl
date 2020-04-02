library ieee;
use ieee.std_logic_1164.all;

entity substractor4bits_tb is
end entity;

architecture arch of substractor4bits_tb is
    component substractor4bits is
        port(
            a, b : in std_logic_vector(3 downto 0);
            bin :  in std_logic;
            bout : out std_logic;
            d   : out std_logic_vector(3 downto 0)
        );
    end component;
    signal a, b, d : std_logic_vector(3 downto 0);
    signal bin, bout : std_logic;

begin
    UUT : substractor4bits port map (a, b, bin, bout, d);

    bin <= '0';
    a <= x"1" after 0 ns, x"7" after 20 ns, x"0" after 100 ns; 
    b <= x"1" after 0 ns, x"5" after 20 ns, x"0" after 100 ns;      

end arch;
