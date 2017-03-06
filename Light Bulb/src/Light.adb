with Light; use Light;
with Ada.Text_IO;
package body Light
with
   SPARK_Mode => on,
   Refined_State => (State => (lightRec))
is

      type lightState is record
      ArrayLightState : States := (0 => Lighton,1 => Lightoff, 2 => Error , 3 => complete);
      pointers : Pointer := 1;
      end record;

   lightRec : lightState;

     procedure Initializes(Tempvar : out status_Type)
   is
   begin
       Tempvar := lightRec.ArrayLightState(lightRec.pointers);
   end Initializes;


   procedure getState(success : out Boolean ; stateOfLight : out status_Type )
   is
   temp : status_Type := lightRec.ArrayLightState(lightRec.pointers);
   begin
      if lightRec.pointers > 1 or lightRec.pointers < 0 then

         success := false;
         stateOfLight := error;

      else

      stateOfLight := temp;
      success := True;

   end if;
   end getState;


   procedure turn_On(status : in out status_Type) is
   begin
         lightRec.pointers := 0;
         status := Lighton;
   end turn_On;


   procedure turn_off(status : in out status_Type) is
   begin
         status := Lightoff;
         lightRec.pointers := 1;
   end turn_off;
end Light;
