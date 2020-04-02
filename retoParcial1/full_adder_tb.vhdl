-- full_adder test bench
-- @autor: ecaballero

entity full_adder_tb is
end entity;

architecture arch of full_adder_tb is
    component full_adder is
        port (
            a, b    :   in  bit;
            cin     :   in  bit;
            s, cout :   out bit
        );
    end component; 
    
    for adder_0: full_adder use entity work.full_adder;
    signal a, b, cin, s, cout : bit;

begin
    adder_0: full_adder port map (a, b, cin, s, cout);

    process
        type pattern_type is record
            a, b, cin :bit;
            s, cout : bit;
        end record;

        type pattern_array is array (natural range <>) of pattern_type;
        constant patterns : pattern_array :=
            (
                ('0', '0', '0', '0', '0'),
                ('0', '0', '1', '1', '0'),
                ('0', '1', '0', '1', '0'),
                ('0', '1', '1', '0', '1'),
                ('1', '0', '0', '1', '0'),
                ('1', '0', '1', '0', '1'),
                ('1', '1', '0', '0', '1'),
                ('1', '1', '1', '1', '1')
            );
    begin
        for i in patterns'range loop
            a <= patterns(i).a;
            b <= patterns(i).b;
            cin <= patterns(i).cin;
            
            wait for 1 ns;
            assert s = patterns(i).s
                report "bad sum value" severity error;
            assert cout = patterns(i).cout
                report "bad carry out value" severity error;
        end loop;
        assert false report "End of test" severity note;
        wait;
    end process;

end arch ; -- arch