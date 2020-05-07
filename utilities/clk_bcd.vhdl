library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clk_bcd is
    port(
        clk_in : in std_logic;
        count   : out std_logic_vector(3 downto 0);
        clk_out : out std_logic
    );
end entity;

architecture arch of clk_bcd is

    signal count_helper : unsigned(3 downto 0) := x"0";
    signal clk_int : std_logic;
begin

    process
    begin
        wait until clk_in'event and clk_in = '1';
        if count_helper < x"9" then
            count_helper <= count_helper + 1;
            clk_int <= '0';
        else
            count_helper <= x"0";
            clk_int <= '1';
        end if;
        
        -- if count_helper < x"5" then
        --     clk_int <= '0';
        -- else
        --     clk_int <='1';
        -- end if;
        
        
        clk_out <= clk_int;
        count <= std_logic_vector(count_helper);
    end process;

end arch;
