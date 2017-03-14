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
     Global => (in_Out  => (alarm1,Lights1,Barrier1), Output => State),
      Depends => ((alarm1,Lights1,Barrier1,State) => (alarm1,Lights1,Barrier1)),
      pre => (alarm1 = Off and Lights1 = Off and Barrier1 = Off); -- need to put this in refined pos --result can only appear in post of a function?



      procedure signalsOff with
       Global => (in_Out => (alarm1,Lights1,Barrier1) , Output => State),
       pre => (alarm1 = On and Lights1 = on and Barrier1 = On);

       function signalsIsOn return boolean with
       Global => (input => (State, alarm1)),
       Post => (if signalsIsOn'Result then alarm1 = On); -- aspect spec must appear on initial declaration ; -- must appear in exactly one output list



End Signal;
