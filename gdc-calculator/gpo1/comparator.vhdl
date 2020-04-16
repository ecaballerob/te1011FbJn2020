library ieee;
use ieee.std_logic_1164.all;

entity comparator is
    port(
        x, y : in std_logic_vector(3 downto 0);
        x_gt_y, x_eq_y, x_lt_y : out std_logic
    );
end entity;

architecture arch of comparator is

begin

    -- process
    --     begin
    --         if x > y then
    --             x_gt_y <= '1';
    --             x_eq_y <= '0';
    --             x_lt_y <= '0';
    --         elsif x = y then
    --             x_gt_y <= '0;
    --             x_eq_y <= '1';
    --             x_lt_y <= '0';
    --         elsif x < y then
    --             x_gt_y <= '0';
    --             x_eq_y <= '0';
    --             x_lt_y <= '1';
    --         end if;
    -- end process;
    
    x_gt_y <= '1' when x > y else '0';
    x_eq_y <= '1' when x = y else '0';
    x_lt_y <= '1' when x < y else '0';

end arch ; -- arch