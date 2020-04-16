library ieee;
use ieee.std_logic_1164.all;

entity comparator is 
    port(
        X, Y : in std_logic_vector(3 downto 0);
        xy_eq, xy_gt, xy_lt : out std_logic;
        R : out std_logic_vector(3 downto 0)
    );
end entity;

architecture arch of comparator is
begin

    -- process(X,Y)
    -- begin
    --     if X > Y then
    --         xy_eq <= '0';
    --         xy_gt <= '1';
    --         xy_lt <= '0';
    --     elsif X < Y then
    --         xy_eq <= '0';
    --         xy_gt <= '0';
    --         xy_lt <= '1';
    --     elsif X = Y then
    --         xy_eq <= '1';
    --         xy_gt <= '0';
    --         xy_lt <= '0';
    --     end if;
    -- end process;

    xy_eq <= '1' when X = Y else '0';
    xy_gt <= '1' when X > Y else '0';
    xy_lt <= '1' when X < Y else '0';

    R <= X when X = Y else x"0";

end arch;