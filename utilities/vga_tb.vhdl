library ieee;
use ieee.std_logic_1164.all;


entity vga_tb is 
    constant period : time := 40 ns; -- Reloj de 25MHz
end entity;

architecture arch of vga_tb is
    component vga is
        port (
            clk : in std_logic;
            red, green, blue : in std_logic;
            clk_out : out std_logic;
            h_sync, v_sync : out std_logic;
            rgb : out std_logic_vector(2 downto 0)
        );
    end component;
    
    signal clk: std_logic := '0';
    signal  clk_out : std_logic;
    signal red, green, blue : std_logic;
    signal h_sync, v_sync : std_logic;
    signal rgb : std_logic_vector(2 downto 0);
    
begin

    UUT : vga port map (clk, red, green, blue, clk_out, h_sync, v_sync, rgb);

    process
    begin
        clk <= '0'; wait for period /2;
        clk <= '1'; wait for period /2;
    end process;

    red <= '1';
    green <= '0';
    blue <= '1';

end arch ; -- arch