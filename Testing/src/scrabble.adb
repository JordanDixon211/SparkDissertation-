pragma SPARK_Mode(On);
With Scrabble; use Scrabble;
package body Scrabble is

   type Scrabble_Value_Lookup is array(Scrabble_Letter) of Scrabble_Value;
   LookUpTable : constant Scrabble_Value_Lookup :=
     ('A' => 1, 'B' => 3, 'C' => 3, 'D' => 2,
      'E' => 1, 'F' => 4, 'G' => 2, 'H' => 4,
      'I' => 1, 'J' => 8, 'K' => 5, 'L' => 1,
      'M' => 3, 'N' => 1, 'O' => 1, 'P' => 3,
      'Q' => 10,'R' => 1, 'S' => 1, 'T' => 1,
      'U' => 1, 'V' => 4, 'W' => 4, 'X' => 8,
      'Y' => 4, 'Z' => 10);

   function RawScore(Word: in Scrabble_Word) return ScrabbleScore
        is
      TotalScore : ScrabbleScore := 0;
   begin
      for Letter_Index in Word'Range Loop
         pragma Loop_Invariant(TotalScore <= 10*(Letter_Index - Word'First));
         TotalScore := TotalScore + LookUpTable(Word(Letter_Index));
      end loop;
      return TotalScore;
   end RawScore;

   function doNothing(Numbers : in Integer) return rand is

   begin
      return rand'Last;
   end doNothing;


end Scrabble;
