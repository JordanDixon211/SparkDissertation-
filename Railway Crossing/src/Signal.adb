package body Signal
with
   SPARK_Mode => on,
   Refined_State => (State => (alarm1, Lights1, Barrier1, SystemState))
is
   alarm1 : alarm := Off;
   Lights1 : Lights := Off;
   Barrier1 : Barrier := Off;
   SystemState : States := Off;

     procedure signalsOn is
  begin
      if(alarm1 = Off and Lights1 = Off and Barrier1 = Off ) then -- invalid use of subtype expression or call
         alarm1 := On;
         Lights1 := On;
         Barrier1 := On;
         SystemState := On;
      else
         SystemState := Error;
         CorrectSignalsOn;
         end if;
      end signalsOn;


      procedure signalsOff is
      begin
      if(alarm1 = On and Lights1 = On and Barrier = On ) then
         alarm1 := Off;
         Lights1 := Off;
         Barrier := Off;
      else
         SystemState := Error;
         CorrectSignalsOff;
         end if;
   end signalsOff;

   procedure CorrectSignalsOn
   with Refined_Global => (In_Out => (SystemState , Lights1 , Barrier1, alarm1)), -- refinded global must apply to body of subprogram declared in spec
   Refined_Post => (SystemState = On, Lights1 = On, Barrier1 = On , alarm1 = On) -- post apply body of program in package spec
   is
   begin
      SystemState := On;
      Lights1 := On;
      Barrier1 := On;
      alarm1 := On;
   end CorrectSignalsOn;


      procedure CorrectSignalsOff
   with Global => (In_Out => (SystemState , Lights1 , Barrier1, alarm1)),
   Refined_Post => (SystemState = Off, Lights1 = Off, Barrier1 = Off , alarm1 = Off) -- system state is undefined
   is
   begin
      SystemState := Off;
      Lights1 := Off;
      Barrier1 := Off;
      alarm1 := Off;
   end CorrectSignalsOff;


   function signalsIsOn return boolean
   with Post => (if signalsIsOn'Result = true then State = On else State = Off) -- aspect spec must appear on initial declaration
      is
      begin
         if(SystemState = On) then
            return true;
         else
            return false;
         end if;
      end signalsIsOn;

      end Signal;



