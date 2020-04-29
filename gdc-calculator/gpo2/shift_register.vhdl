library ieee;
use ieee.std_logic_1164.all;

entity shift_register is
    port (
        clr, clk, sdr, sdl : in std_logic;
        mode : in std_logic_vector(1 downto 0);
        parallel : in std_logic_vector(3 downto 0);
        q : out std_logic_vector(3 downto 0)
    );
end entity;

architecture arch of shift_register is

begin
    process(clr, clk, mode)
        variable q_helper : std_logic_vector(3 downto 0);
    begin
        if clr = '0' then
            q <= "0000";
        else
            if rising_edge(clk) then
                case mode is
                    when "00" =>
                        q_helper := q_helper;
                    when "01" =>
                        q_helper(3) := q_helper(2);
                        q_helper(2) := q_helper(1);
                        q_helper(1) := q_helper(0);
                        q_helper(0) := sdr;
                    when "10" =>
                        q_helper(3) := sdl;
                        q_helper(2) := q_helper(3);
                        q_helper(1) := q_helper(2);
                        q_helper(0) := q_helper(1);
                    when "11" =>
                        q_helper := parallel;
                    when others =>
                        null;
                end case;
                q <= q_helper;
            end if;
        end if;
    end process;

end arch ; -- arch