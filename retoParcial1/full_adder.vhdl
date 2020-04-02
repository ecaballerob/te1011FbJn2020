-- Full adder module
-- @autor: ecaballero

entity full_adder is
    port (
        a, b    :   in  bit;
        cin     :   in  bit;
        s, cout :   out bit
    );
end entity full_adder;

architecture arch of full_adder is
begin
    s <= (a xor b) xor cin;
    cout <= ((a xor b) and cin) or (a and b);
end architecture arch;

