library ieee;
use ieee.std_logic_1164.all;

entity register4bits is 
    port (
        d : in std_logic_vector(3 downto 0);
        clk, ld, rst : in std_logic;
        q : out std_logic_vector(3 downto 0)
    );
end entity;

architecture arch of register4bits is
-- USING PORT MAP
    -- signal q_n : std_logic_vector(3 downto 0);
    -- component ff_d is
    --     port(
    --         d, clk, ld, rst : in std_logic;
    --         q, q_n : out std_logic
    --     );
    -- end component;
-- begin
    -- ffd0 : ff_d port map (d(0), clk, ld, rst, q(0), q_n(0));
    -- ffd1 : ff_d port map (d(1), clk, ld, rst, q(1), q_n(1));
    -- ffd2 : ff_d port map (d(2), clk, ld, rst, q(2), q_n(2));
    -- ffd3 : ff_d port map (d(3), clk, ld, rst, q(3), q_n(3));

    --- registro 4 bits, sin components
    -- Behavioral
    
    begin
        process (rst, clk) 
        begin  
            if rst = '1' then
                q <= x"0";
            else
               if clk = '1' and clk'event then
                if ld = '1' then
                    q <= d;
                end if;
               end if;
            end if;
        end process;

end arch ; 