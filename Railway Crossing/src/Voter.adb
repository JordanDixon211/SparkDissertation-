package body Voter with
   SPARK_Mode => On
is
   procedure SelectValues
   is
   begin
      bestSensor := findMax;
   end;

   procedure Sensor1Init(success : out Boolean)
   is
   begin
      if Sensor.trainSpeed > 0 then
         success := True;
         sensorReadingOne := Sensor.trainSpeed;
      else
         success := False;
         sensorReadingOne := 0;
      end if;
   end;

   procedure Sensor2Init(success : out Boolean)
   is
   begin
       if Sensor2.trainSpeed > 0 then
         success := True;
         sensorReadingTwo := Sensor2.trainSpeed;

      else
         success := False;
          sensorReadingTwo := 0;

      end if;
   end;

   function  findMax return Sensor.Speed
   is
   begin
      if(sensorReadingOne = sensorReadingTwo) then
         return sensorReadingOne;
      elsif(sensorReadingOne > sensorReadingTwo) then
         return sensorReadingOne;
      else
         return sensorReadingTwo;
      end if;

   end;
end Voter;
