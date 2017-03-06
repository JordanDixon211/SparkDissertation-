with Ada.Integer_Text_IO;
package Light
with
   SPARK_Mode => On,
   Abstract_State => State
   is
   type status_Type is (Lighton, Lightoff, Error, complete);
   type Pointer is  range 0 .. 3;
   type States is array (Pointer) of status_Type;


   procedure getState(success : out Boolean ; stateOfLight : out status_Type)
     with Global => (Input => State),
     Depends => (success => (State) , stateOfLight => (State)),
     post => (if success then (stateOfLight = Lighton) or (stateOfLight = Lightoff) or (stateOfLight = Error) or (stateOfLight = complete)
                else stateOfLight /= Lighton or stateOfLight /= Lightoff);




    procedure Initializes(Tempvar : out status_Type)
     with Global => (Input => State),
     post => Tempvar'Result = Lightoff;


   procedure  turn_On(status : in out status_Type)
     with Global => (in_Out=>  State),
     pre => status = Lightoff,
     post => status'Result = Lighton;



   procedure  turn_off(status :in  out status_Type)
     with Global => (in_Out => State),
     pre => status /=  Error and status /= complete and status /= Lightoff,
     post => status = Lightoff;


end Light;
