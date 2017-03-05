with Light; use Light;
with Ada.Text_IO;
package body Light
with
   SPARK_Mode => on,
   Refined_State => (State => (ArrayLightState , pointers))
   is

      ArrayLightState : States := (0 => Lighton,1 => Lightoff);
      pointers : Pointer := 1;



     function Initializes return status_Type
   is
   begin
      return ArrayLightState(1);
   end Initializes;


   procedure getState(success : out Boolean ; stateOfLight : out status_Type )
   is
   temp : status_Type := ArrayLightState(pointers);
   begin
      if pointers > 1 or pointers < 0 then
         success := false;
         stateOfLight := error;
      else
      stateOfLight := temp;
      success := True;
   end if;
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
