
package Body Sensor2 with
   SPARK_Mode => On
is


   -- methods TrainStatus, GetSpeed, SetSpeed

   procedure setSpeed(v : in Speed ; success : out boolean ) is
   pragma Assert(trainSpeed = 0);
   begin
      if v > 0 then
         trainSpeed := v;
         success := true;
      else
         success := false;
      end if;
   end setSpeed;


   function getSpeed return Speed is
   begin
      if trainSpeed > 0 and train = true then
         return trainSpeed;
      else
         return 0;
      end if;
   end getSpeed;

   procedure trainIncoming(userDefSpeed : in Speed) is
      v : Integer := 0;
      sus : Boolean := False;
   begin
      loop
       --  v := readSignal();
         if(v > 0) then
           setSpeed(userDefSpeed, sus);
           train := sus;
           end if;
         exit when train = True and sus = True; --expected for loop
      end loop;
   end trainIncoming;

end Sensor2;
