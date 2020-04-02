library ieee;
use ieee.std_logic_1164.all;

entity register_tb is
end entity;

architecture arch of register_tb is

    component register4bits is
        port (
            d : in std_logic_vector(3 downto 0);
            clk, ld, rst : in std_logic;
            q : out std_logic_vector(3 downto 0)
        );
    end component;
    
    signal d : std_logic_vector(3 downto 0);
    signal q : std_logic_vector(3 downto 0);
    signal clk : std_logic := '0'; 
    signal ld, rst : std_logic;

begin

    UUT : register4bits port map (d,clk,ld,rst,q);

    process
    begin 
        clk <= '0';
        wait for 25 ns;
        clk <= '1';
        wait for 25 ns;
    end process;

    d <= "1010" after 20 ns, "1000" after 120 ns;
    ld <= '1' after 20 ns, '0' after 30 ns, '1' after 120 ns;

end arch;