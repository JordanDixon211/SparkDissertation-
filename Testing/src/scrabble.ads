pragma SPARK_Mode(On);
package Scrabble is
   subtype Scrabble_Letter is Character range 'A' .. 'Z'; -- takes types from A - Z

   subtype Scrabble_Value is Positive
     with Static_Predicate => Scrabble_Value in 1 .. 5 | 8 | 10;

   type Scrabble_Word is array (Positive range<>) of Scrabble_Letter;

   subtype ScrabbleScore is Natural range 0 .. 100;
   subtype rand is Integer range 1 .. 5;

   function RawScore(Word : in Scrabble_Word ) return ScrabbleScore
   with
       pre =>  (Word'Length <= 10),
       post => (RawScore'Result < 101 or RawScore'Result > 0); -- used function in post



   function doNothing(Numbers : in Integer) return rand
     with pre => (Numbers <= 10);

   end Scrabble;
