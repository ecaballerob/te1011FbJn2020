library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity keyboard is 
    port(
        kbd_clk, kbd_data, clk : in std_logic;
        reset, enable : in std_logic;
        scan_code : out std_logic_vector(7 downto 0);
        scan_ready : out std_logic
    );
end entity;

architecture arch of keyboard is

    signal filter : std_logic_vector(7 downto 0) := "00000000";
    signal kbd_clk_filtered : std_logic := '0';
    signal read_char : std_logic := '0';
    signal ready_set : std_logic := '0';
    signal incount : unsigned(3 downto 0) := "0000";
    signal shiftin : std_logic_vector(8 downto 0) := "000000000";

begin
    clk_filter : process
    begin
        wait until clk'event and clk = '1';
        filter(6 downto 0) <= filter(7 downto 1);
        filter(7) <= kbd_clk;
        if filter = x"FF" then 
            kbd_clk_filtered <= '1';
        elsif filter = x"00" then
            kbd_clk_filtered <= '0';
        end if;
    end process;
    -- Lectura de la información serial del dispositivo
    process
    begin
        wait until (kbd_clk_filtered'event and kbd_clk_filtered = '0');
        if reset = '1' then
            incount <= "0000";
            read_char <= '0';
        else
            if kbd_data = '0' and read_char = '0' then
                read_char <= '1';
                ready_set <= '0';
            else
                if read_char = '1' then
                    if incount < "1001" then
                        incount <= incount + 1;
                        shiftin(7 downto 0) <= shiftin(8 downto 1);
                        shiftin(8) <= kbd_data;
                        ready_set <= '0';
                    else
                        scan_code <= shiftin(7 downto 0);
                        read_char <= '0';
                        ready_set <= '1';
                        incount <= "0000";
                    end if;
                end if;
            end if;
        end if;
    end process;

    process (enable, ready_set)
    begin
        if enable = '1' then
            scan_ready <= '0';
        elsif ready_set'event and ready_set = '1' then
            scan_ready <= '1';
        end if;
    end process;
end arch;