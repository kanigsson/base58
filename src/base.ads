package Base is

   type Number is array (Positive range <>) of Character;

   function Encode (S : String) return Number;

   function Decode (N : Number) return String;
end Base;
