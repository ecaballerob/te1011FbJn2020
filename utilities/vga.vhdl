library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga is
    port (
        clk : in std_logic;
        red, green, blue : in std_logic;
        clk_out : out std_logic;
        h_sync, v_sync : out std_logic;
        rgb : out std_logic_vector(3 downto 0)
    );
end entity;

architecture arch of vga is 

    signal hs, vs : std_logic;
    signal video_on : std_logic;
    signal video_on_h : std_logic := '0';
    signal video_on_v : std_logic := '0';
    signal h_count : unsigned(9 downto 0) := "0000000000";
    signal v_count : unsigned(9 downto 0) := "0000000000";

    constant HORIZONTAL_SYNC : unsigned(9 downto 0) := "1100011111"; -- 799 
    constant HSYNC_1 : unsigned(9 downto 0) := "1011110011"; -- 755
    constant HSYNC_0 : unsigned(9 downto 0) := "1010010011"; -- 659
    constant ZERO : unsigned(9 downto 0) := "0000000000";
    constant ONE : unsigned(9 downto 0) := "1111111111";
begin

    clk_out <= clk; --25 MHz

    video_on <= video_on_h and video_on_v;

    process
    begin
        wait until clk'event and clk = '1';

        --- h_count 640 px + tiempo extra para refresh
        if h_count = HORIZONTAL_SYNC then
            h_count <= ZERO;
        else
            h_count <= h_count + 1;
        end if;

        if h_count <= HSYNC_1 and h_count >= HSYNC_0  then
            hs <= '0';
        else
            hs <= '1';
        end if;

        --- v_count 480 px + tiempo extra para refresh
        if v_count >= "1000001100" and h_count >= "1010111011" then
            v_count <= ZERO;
        else 
            v_count <= v_count + 1;
        end if;

        if v_count <= "0111101110" and v_count >= "0111101101" then
            vs <= '0';
        else
            vs <= '1';
        end if;
        
        if h_count <= "1001111111" then
            video_on_h <= '1' ;
        else
            video_on_h <= '0';
        end if;

        if v_count <= "0111011111" then
            video_on_v <= '1' ;
        else
            video_on_v <= '0';
        end if;
        
        rgb(0) <= red and video_on;
        rgb(1) <= green and video_on;
        rgb(2) <= blue and video_on;

        h_sync <= hs;
        v_sync <= vs;

    end process;

end arch;
