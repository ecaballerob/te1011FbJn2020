entity addsub is
   port (
      a, b : in bit_vector(7 downto 0);
      t : in bit;
      c_flag, ov_flag : out bit;
      r : out bit_vector(7 downto 0)
   );
end entity;

architecture arch of addsub is

   signal b_signed, carry : bit_vector(7 downto 0);

   component full_adder is
      port (
         a, b     :  in bit;
         cin      :  in bit;
         s, cout  :  out bit
      );
   end component;

begin

   b_signed(0) <= b(0) xor t;
   b_signed(1) <= b(1) xor t;
   b_signed(2) <= b(2) xor t;
   b_signed(3) <= b(3) xor t;
   b_signed(4) <= b(4) xor t;
   b_signed(5) <= b(5) xor t;
   b_signed(6) <= b(6) xor t;
   b_signed(7) <= b(7) xor t;

   fa0 : full_adder port map (a(0), b_signed(0), t, r(0), carry(0));
   fa1 : full_adder port map (a(1), b_signed(1), carry(0), r(1), carry(1));
   fa2 : full_adder port map (a(2), b_signed(2), carry(1), r(2), carry(2));
   fa3 : full_adder port map (a(3), b_signed(3), carry(2), r(3), carry(3));
   fa4 : full_adder port map (a(4), b_signed(4), carry(3), r(4), carry(4));
   fa5 : full_adder port map (a(5), b_signed(5), carry(4), r(5), carry(5));
   fa6 : full_adder port map (a(6), b_signed(6), carry(5), r(6), carry(6));
   fa7 : full_adder port map (a(7), b_signed(7), carry(6), r(7), carry(7));

   c_flag <= carry(7);
   ov_flag <= carry(7) xor carry(6);
   
end arch;