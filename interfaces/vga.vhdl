library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity vga is 
    port(
        clk : in std_logic;
        red,green,blue : in std_logic;
        rgb : out std_logic_vector(2 downto 0);
        h_sync, v_sync : out std_logic;
        clk_vga : out std_logic
    );
end entity;

-- 640x480
architecture arch of vga is

    signal hs, vs : std_logic;
    signal video_on, video_on_v, video_on_h : std_logic;
    signal hcount : unsigned(9 downto 0) := "0000000000";
    signal vcount : unsigned(9 downto 0) := "0000000000";

begin

    clk_vga <= clk; --- clock es de 25Mhz

    video_on <= video_on_h and video_on_v;

    process 
    begin 
        wait for clk'event and clk ='1';
        -- Horizontal
        if hcount = "1100011111" then --799
            hcount <= "0000000000";
        else 
            hcount <= hcount +1 ;
        end if;
        -- h_sync
        if hcount >= "1010010011" and hcount <= "1011110011" then
            hs <= '0';
        else
            hs <= '1';
        end if;

        -- Vertical
        if vcount >= "1000001100" and hcount <= "1010111011" then
            vcount <= "0000000000";
        else
            vcount <= vcount + 1;
        end if;
        -- TinyVGA
        -- v_sync   494                             493
        if vcount <= "0111101110" and vcount >= "0111101101" then
            vs <= '0';
        else 
            vs <= '1';
        end if;
        
        if hcount <= "1001111111" then -- 639
            video_on_h <= '1';
        else
            video_on_h <= '0';
        end if;

        if vcount <= "0111011111" then --479
            video_on_v <= '1';
        else
            video_on_v <= '0';
        end if;
        
        rgb(0) <= red and video_on;
        rgb(1) <= green and video_on;
        rgb(2) <= azul and video_on;

        h_sync <= hs;
        v_sync <= vs;
    end process;

end arch;