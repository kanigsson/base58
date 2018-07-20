package Base with SPARK_Mode is

   type Number is array (Positive range <>) of Character;

   function Encode (S : String) return Number
     --  length of result will be longer than input, so need to guard against
     --  too large input. Selecting some very restricted value, we could
     --  probably bound this much better
   with Pre => S'Length < Integer'Last / 200;

   function Decode (N : Number) return String;
end Base;
