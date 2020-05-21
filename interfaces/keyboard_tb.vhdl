library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;


entity keyboard_tb is
    constant period : time := 40 ns ; -- Señal de reloj de 25MHz
    constant bit_period : time := 60 us ; -- Keyboard clock ~ 16.7 Khz max
end entity;

architecture arch of keyboard_tb is
    component keyboard is 
        port(
            kbd_clk, kbd_data, clk : in std_logic;
            reset, enable : in std_logic;
            scan_code : out std_logic_vector(7 downto 0);
            scan_ready : out std_logic
        );
    end component;

    signal clk : std_logic := '0';
    signal reset : std_logic;
    signal kbd_clk : std_logic := '1';
    signal kbd_data : std_logic := 'H';
    signal enable : std_logic := '0';
    signal scan_ready : std_logic;
    signal scan_code : std_logic_vector(7 downto 0);

    type codes_types is array (natural range <>) of std_logic_vector (7 downto 0);
    constant codes : codes_types := (x"15", x"1D");

    begin 

    UUT : keyboard port map (kbd_clk, kbd_data, clk, reset, enable, scan_code, scan_ready );

    -- Señal de reloj del sistema
    clk <= not clk after (period / 2);
    reset <= '1', '0' after period;

    process
        procedure send_code( sc : std_logic_vector(7 downto 0) ) is
        begin
            kbd_clk <= 'H';
            kbd_data <= 'H';

            wait for (bit_period/2);
            kbd_data <= '0'; -- Start bit
            wait for (bit_period/2);
            kbd_clk <= '0';
            wait for (bit_period/2);
            kbd_clk <= '1';
            for i in 0 to 7 loop
                kbd_data <= sc(i);
                wait for (bit_period/2);
                kbd_clk <= '0';
                wait for (bit_period/2);
                kbd_clk <= '1';
            end loop;
            -- bit de paridad
            kbd_data <= '0';
            wait for (bit_period/2);
            kbd_clk <= '0';
            wait for (bit_period/2);
            kbd_clk <= '1';
            -- stop bit
            kbd_data <= '1';
            wait for (bit_period/2);
            kbd_clk <= '0';
            wait for (bit_period/2);
            kbd_clk <= '1';
            kbd_data <= 'H';
            wait for (bit_period * 3);
        end procedure send_code;
    
       begin
        wait for bit_period;
        for i in codes'range loop
            send_code(codes(i));
        end loop;
    end process;

    process 
        variable l : line;
    begin
        wait until scan_ready = '1';
        wait for 300* period;
        write (l, string'("Scan code : "));
        write (l, scan_code);
        writeline(output, l);
        wait for bit_period;
    end process;

end arch;

