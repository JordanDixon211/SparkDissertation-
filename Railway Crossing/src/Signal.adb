package body Signal
with
   SPARK_Mode => on,
   Refined_State => (State => (SystemState))
is

   SystemState : States := Off;

   procedure signalsOn
     with Refined_Post => (if alarm1 = Off and Lights1 = Off and Barrier1 = Off then SystemState = On)
        is
     begin
      if(alarm1 = Off and Lights1 = Off and Barrier1 = Off) then -- invalid use of subtype expression or call
         alarm1 := On;
         Lights1 := On;
         Barrier1 := On;
         SystemState := On;
         else
         SystemState := Error;
            --CorrectSignalsOn;
         end if;
      end signalsOn;


      procedure signalsOff is
      begin
      if(alarm1 = On and Lights1 = On and Barrier1 = On ) then
         alarm1 := Off;
         Lights1 := Off;
         Barrier1 := Off;
         SystemState := Off;

      else
         SystemState := Error;
        -- CorrectSignalsOff;
         end if;
   end signalsOff;

   procedure CorrectSignalsOn
   with Global => (Output => (SystemState , Lights1 , Barrier1, alarm1)), -- refinded global must apply to body of subprogram declared in spec
   Post => (SystemState = On and Lights1 = On and Barrier1 = On and alarm1 = On) -- post apply body of program in package spec
   is
   begin
      SystemState := On;
      Lights1 := On;
      Barrier1 := On;
      alarm1 := On;
   end CorrectSignalsOn;


      procedure CorrectSignalsOff
   with Global => (Output => (SystemState , Lights1 , Barrier1, alarm1)),
   Post => (SystemState = Off and Lights1 = Off and Barrier1 = Off and alarm1 = Off) -- system state is undefined
   is
   begin
      SystemState := Off;
      Lights1 := Off;
      Barrier1 := Off;
      alarm1 := Off;
   end CorrectSignalsOff;


   function signalsIsOn return boolean
      is
      begin
         if(SystemState = On and alarm1 = On) then
            return true;
         else
            return false;
         end if;
      end signalsIsOn;

      end Signal;



