package body Base is

   subtype Base58Digit is Integer range 0 .. 57;
   type Alpha_Type is array (Base58Digit) of Character;
   Alphabet : constant Alpha_Type :=
     "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz";

   ------------
   -- Encode --
   ------------

   function Encode (S : String) return Number is

      --  biggest possible carry

      subtype Carry_Type is Integer range 0 .. 255 + 256 * 57;

      Carry : Carry_Type;
      J : Integer;


   begin
      declare
         --  compute the required size of the Buf buffer
         Size : constant Integer := S'Length * 138 / 100 + 1;
         --  the Buf buffer is a Base58 number with a digit per cell,
         --  but represented using numbers 0 to 57 instead of the actual
         --  characters.

         type Base58Number is array (1 .. Size) of Base58Digit;

         Buf : Base58Number := (others => 0);
      begin
         --  Buf contains the current encoded number. We now process each input
         --  character one by one. Basically, what we do for each digit is to
         --  compute
         --    Buf * 256 + S (I)
         --  that is, we take into account the new input digit by shifting the
         --  others to the left (by multiplying with 256) and adding the new
         --  number. Of course we do these operations on the Base58 number held
         --  by Buf, so this computation is done backwards from the end of Buf
         --  with a Carry that initially contains S (I).

         for I in S'Range loop
            J := Size;
            Carry := Character'Pos(S (I));
            while Carry /= 0 loop
               Carry := Carry + 256 * Buf (J);
               Buf (J) := Carry rem 58;
               Carry := Carry / 58;
               J := J - 1;
            end loop;
         end loop;
         declare
            Result : Number (1 .. Buf'Length);
         begin
            for I in Buf'Range loop
               Result (I) := Alphabet (Buf (I));
            end loop;
            return Result;
         end;
      end;
   end Encode;

   ------------
   -- Decode --
   ------------

   function Decode (N : Number) return String is
   begin
      return String (N);
   end Decode;

end Base;
