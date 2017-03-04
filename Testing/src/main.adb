pragma SPARK_Mode(On);
with Ada.Integer_Text_IO; use ada.Integer_Text_IO;
with Scrabble; use Scrabble;

procedure Main is

  subtype index is Integer range 1 .. 9;
  arrayofWord: Scrabble.Scrabble_Word(index);
   addArray : Character := 'A';
   type testTwo is array(index) of Integer;


   getScore : Integer;
   test : Integer := 5;
   testingArray : testTwo;
begin
   for I in arrayofWord'Range loop
      arrayofWord(I) := addArray ;
   end loop;

   getScore := RawScore(arrayofWord);
   testingArray := (others => 0);

   testingArray(1) := 5;

   put(testingArray(9));

end Main;
