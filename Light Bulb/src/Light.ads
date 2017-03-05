with Ada.Integer_Text_IO;
package Light
with
   SPARK_Mode => on,
   Abstract_State => State
   is
   type status_Type is (Lighton, Lightoff, Error, Complete);
   type Pointer is  range 0 .. 1;
   type States is array (Pointer) of status_Type;


   procedure getState(success : out Boolean ; stateOfLight : out status_Type)
     with Global => (Input => State),
     post => (if success then (stateOfLight = Lighton and stateOfLight /= Lightoff) or (stateOfLight = Lightoff and stateOfLight /= Lighton)
                else stateOfLight /= Lighton or stateOfLight /= Lightoff);




   function Initializes return status_Type
     with Global => (Input => State),
     post => Initializes'Result = Lightoff or Initializes'Result = Lighton;


   procedure  turn_On(status : in out status_Type)
     with Global => (in_Out =>  State),
     pre => status = Lightoff,
     post => status = Lighton;



   procedure  turn_off(status :in  out status_Type)
     with Global => (in_Out => State),
     pre => status = Lighton,
     post => status = Lightoff;


end Light;
