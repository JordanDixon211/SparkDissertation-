with Ada.Strings.Maps.Constants;
with Ada.Strings.Fixed;
with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   tempString : String := "Hello";

    A : Integer := Integer'Value(Get_Line);
begin
   --  Insert code here.
   for x in  1 .. 10 loop
      Put_Line(x'Image);
   end loop;

   for x in Integer range 1 .. 10 loop
      Put_Line("Hello");
   end loop;

 if(Ada.Strings.Fixed.Translate(tempString, ada.Strings.Maps.Constants.Lower_Case_Map) = "hello") then
   Put_Line("Lol");
  end if;


end Main;
