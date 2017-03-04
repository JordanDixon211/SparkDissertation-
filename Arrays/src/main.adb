with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
procedure Main is

   type IndexType is new Integer range 1 .. 10;
   type ArrayinType is array (IndexType) of Integer;

   type T is array (Integer range <>) of Integer;

   type definte is array (Integer range 1 .. 10) of Integer
     with Default_Component_Value => 0;
   type Indef is array (Integer range <>) of Integer;
   type charArray is array (Character range 'a' .. 'z') of Integer;
   type boolArray is array (Boolean) of Integer; -- Indexed by boolean

   type String is array (Positive range <>) of Character;


   A: T(0 .. 4) := (others => 0); -- gives me an array of bounds 0 - 15
   D: T(0 .. 4);
   B: definte;
  arraystring : String := "This is it";
begin
   --  Insert code here.


   B := (others => 0);
   D := (others => 0);
   A := D;
   A( 1 .. 3) := D(2 .. 4);
   A := (0 => 1, 1 => 2, 2 => 3, 3=> 4, 4=>5); --have ti aggregate all of them

   for I in A'Range loop
      Put(A(I));
   end loop;

   for V of A loop
      put(V'Image);
   end loop;

   for I in arraystring'Range loop
      put(arraystring(I));
   end loop;

   A(0) := A(1) + A(2);
   Put_Line(Integer'Image(A(0)));
end Main;
