package  Signal with
   SPARK_Mode => On,
   Abstract_State => State
   is

   type States is (On, Off , Error);
   subtype alarm is  States range  On .. Off;
   subtype Lights is  States range On .. Off;
   subtype Barrier is  States range On .. Off;

   alarm1 : alarm := Off;
   Lights1 : Lights := Off;
   Barrier1 : Barrier := Off;

   procedure signalsOn with
      Global => (in_Out  => (State,alarm1)),
      pre => (alarm1 = off), -- need to put this in refined post?
      post => (signalsOn'Result = On); --result can only appear in post of a function?



      procedure signalsOff with
       Global => (in_Out => State),
      Depends => (State =>+ State),
      pre => (alarm1 = On and Lights1 = on and Barrier1 = On), --invalid operator
      post => (signalsOff'result = Off);--result can only appear in post of a function?

       function signalsIsOn return boolean with
      Global => (input => State); -- must appear in exactly one output list



End Signal;
