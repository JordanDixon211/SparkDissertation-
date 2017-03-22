
package Body Sensor with
   SPARK_Mode => On
is
   -- methods TrainStatus, GetSpeed, SetSpeed

   procedure setSpeed(speed1 : in Speed ; success : out boolean ) is
   pragma Assert(trainSpeed = 0);
   begin
      if speed1 > 0 then
         trainSpeed := speed1;
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
      count : RandRange := 1;
      sus : Boolean := False;
      genVoltage :  randPos.Generator; -- will gen error as not valid Spark
      genval : Integer;
   begin
      -- pick a random number between 1 to 8 then go through the loop  add abstraction off random train times
          genval := randPos.Random(genVoltage);  -- will gen error as not valid Spark
      loop
         if(count =  genval ) then
           setSpeed(userDefSpeed, sus);
           train := sus;
         end if;

         delay 1.0;

         exit when train = True and sus = True; --expected for loop
      end loop;
   end trainIncoming;

end Sensor;



