entity addsub2_tb is
end entity;

architecture arch of addsub2_tb is

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
    constant period : time := 5 ns;
begin

    UUT : addsub port map (a, b, t, c_flag, ov_flag, r);

    process
    begin
        wait for 50 ns;
        wait for period * 10;

        t <= '0';
   
        a <= x"00";
        b <= x"00";
        wait for period * 10;
        
        a <= x"01";
        b <= x"01";
        wait for period * 10;
        
        a <= x"07";
        b <= x"04";
        wait for period * 10;

        a <= x"0F";
        b <= x"FA";
        
        wait for period * 10;
        wait;
    end process;

end arch;