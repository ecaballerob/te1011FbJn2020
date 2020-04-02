library ieee;
use ieee.std_logic_1164.all;

entity register4bits is
    port (
        d_in : in std_logic_vector(3 downto 0);
        clk, ld, reset : in std_logic;
        d_out : out std_logic_vector(3 downto 0)
    );
end entity;

architecture arch of register4bits is 
    component ffd is
        port (
            clk, ld, d: in std_logic;
            reset : in std_logic;
            q : out std_logic
        );
    end component;
   begin
    -- process (clk) 
    -- begin
    --     if (reset = '1') then
    --         d_out <= "0000";
    --     else
    --         if(rising_edge(clk)) then
    --             if (ld = '1') then
    --                 d_out <= d_in;
    --             else 
    --                 null;
    --             end if;
    --         end if;
    --     end if;
    -- end process;
    ff_d0 : ffd port map (clk, ld, d_in(0),reset, d_out(0));
    ff_d1 : ffd port map (clk, ld, d_in(1),reset, d_out(1));
    ff_d2 : ffd port map (clk, ld, d_in(2),reset, d_out(2));
    ff_d3 : ffd port map (clk, ld, d_in(3),reset, d_out(3));

end arch;