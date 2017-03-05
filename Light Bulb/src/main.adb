with Light; use Light;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Strings;
with Ada.Text_IO;

procedure Main is
   package StatusIO is new Ada.Text_IO.Enumeration_IO(Light.status_Type);
   subtype index is Integer range  0 .. 20;
   type stringuser is array (index) of Character;


   lightState : Light.status_Type := Initializes;  -- Gives the main package an inital value
   UserText :  Light.status_Type;

begin
   Ada.Text_IO.Put("Light: ");
   StatusIO.Put(lightState);

   loop
     StatusIO.Get(UserText);
      if UserText = Lighton  then
         Light.turn_On(lightState);
         StatusIO.Put(lightState);
      elsif UserText = Lightoff then
         Light.turn_off(lightState);
         StatusIO.Put(lightState);
      end if;

      exit when UserText = Complete;
   end loop;



end Main;
