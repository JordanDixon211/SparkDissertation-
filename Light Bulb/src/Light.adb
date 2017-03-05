pragma SPARK_Mode(On);
with Light; use Light;
package body Light
   with
   Refined_State => (State => (ArrayLightState , pointers))
   is
      subtype Pointer is Integer range 0 .. 1;
      type States is array (Pointer) of status_Type;

      ArrayLightState : States := (0 => Lighton,1 => Lightoff);
      pointers : Pointer := 1;

   function Light_is_On return Boolean
   is
   begin
      if(pointers = 0) then
         return True;
      else
         return False;
      end if;
   end Light_is_On;

     function Initializes return status_Type
   is
   begin
      return ArrayLightState(1);
   end Initializes;


   function getState return status_Type
   is
   begin
      return ArrayLightState(pointers);
   end getState;


   procedure turn_On(status : in out status_Type) is
   begin
         pointers := 0;
         status := Lighton;
   end turn_On;


   procedure turn_off(status : in out status_Type) is
   begin
         status := Lightoff;
         pointers := 1;
   end turn_off;
end Light;
