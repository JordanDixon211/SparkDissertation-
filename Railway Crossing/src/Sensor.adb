
package Body Sensor with
   SPARK_Mode => On
is

   train : TrainState := false;
   -- methods TrainStatus, GetSpeed, SetSpeed

   procedure setSpeed(v : out Speed ; sucess : out boolean ) is
   begin
      if v > 0 then
         trainSpeed := v;
         sucess := true;
      else
         sucess := false;
      end if;
   end setSpeed;


   function getSpeed return Speed is
   begin
      if v > 0 then
         return trainSpeed;
      else
         return 0;
      end if;
   end getSpeed;

   procedure trainIncoming(userDefSpeed : in Speed) is
   begin
      loop
       --  v := readSignal();
         if(v > 0) then
           setSpeed(userDefSpeed);
           train := true;
              end if;
         exit when v > 0; --expected for loop
      end loop;

   end trainIncoming;

end Sensor;



