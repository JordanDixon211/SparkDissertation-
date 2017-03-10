package  Signal with
   SPARK_Mode => On,
   Abstract_State => State
   is

   type States is (On, Off , Error);
   subtype alarm is  States range  On .. Off;
   subtype Lights is  States range On .. Off;
   subtype Barrier is  States range On .. Off;

   procedure signalsOn with
      Global => (in_Out  => State),
      Depends => (State =>+ State),
      pre => (alarm = off), -- need to put this in refined post?
      post => (signalsOn'result = on); --result can only appear in post of a function?



      procedure signalsOff with
       Global => (in_Out => State),
      Depends => (State =>+ State),
      pre => (State = on), --invalid operator
      post => (signalsOff'result = off);--result can only appear in post of a function?

       function signalsIsOn return boolean with
      Global => (input => State),
     Depends => (State =>+ State); -- must appear in exactly one output list



End Signal;
