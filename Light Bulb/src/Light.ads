pragma SPARK_Mode(On);
package Light
  with
   Abstract_State => State
   is
   type status_Type is (Lighton, Lightoff, Error);

   function getState return status_Type
     with Global => (Input => State),
     post => getState'Result = Lighton or  getState'Result = Lightoff;


   function  Light_is_On return Boolean
     with Global => (Input => State);

   function Initializes return status_Type
     with Global => (Input => State),
     post => Initializes'Result = Lightoff;

   procedure  turn_On(status : in out status_Type)
     with Global => (in_Out =>  State),
     pre => status = Lightoff,
     post => status = Lighton;


   procedure  turn_off(status :in  out status_Type)
     with Global => (in_Out => State),
     pre => status = Lighton,
     post => status = Lightoff;

end Light;
