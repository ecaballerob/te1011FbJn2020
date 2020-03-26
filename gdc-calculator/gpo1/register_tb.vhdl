library ieee;
use ieee.std_logic_1164.all;

entity register_tb is
end entity;

architecture arch of register_tb is

    component register4bits is
        port (
            d_in : in std_logic_vector(3 downto 0);
            clk, ld, reset : in std_logic;
            d_out : out std_logic_vector(3 downto 0)
        );
    end component;
    
    signal d_in : std_logic_vector(3 downto 0);
    signal d_out : std_logic_vector(3 downto 0);
    signal clk : std_logic := '0'; 
    signal ld, reset : std_logic;

begin

    UUT : register4bits port map (d_in, clk, ld, reset, d_out);

    process
    begin 
        clk <= '0';
        wait for 25 ns;
        clk <= '1';
        wait for 25 ns;
    end process;

    d_in <= "1010" after 20 ns, "1000" after 120 ns;
    ld <= '1' after 30 ns, '0' after 60 ns, '1' after 130 ns;

end arch;