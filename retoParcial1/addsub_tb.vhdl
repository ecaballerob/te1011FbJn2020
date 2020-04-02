entity addsub_tb is
end entity;

architecture arch of addsub_tb is

    component addsub is
        port (
            a, b : in bit_vector(7 downto 0);
            t : in bit;
            c_flag, ov_flag : out bit;
            r : out bit_vector(7 downto 0)
        );
    end component;
    
    for UUT: addsub use entity work.addsub;

    signal a, b, r : bit_vector(7 downto 0);
    signal t, c_flag, ov_flag : bit;

begin

    UUT : addsub port map (a, b, t, c_flag, ov_flag, r);

    process 
        type pattern_type is record
            a, b, r : bit_vector(7 downto 0);
            t : bit;
            c_flag, ov_flag : bit;
        end record;

        type pattern_array is array (natural range <>) of pattern_type;
        constant patterns : pattern_array :=
            (
                (x"00", x"00", x"00", '0', '0', '0'),
                (x"01", x"01", x"02", '0', '0', '0')
            );

    begin
        for i in patterns'range loop
            a <= patterns(i).a;
            b <= patterns(i).b;
            t <= patterns(i).t;

            assert r = patterns(i).r
                report "Bad result " severity error;
            assert c_flag = patterns(i).c_flag
                report "Bad carry " severity error;
            assert ov_flag = patterns(i).ov_flag
                report "Bad overflow" severity error;
        end loop;
            assert false report "End test" severity note;
        wait;
    end process;

end arch;