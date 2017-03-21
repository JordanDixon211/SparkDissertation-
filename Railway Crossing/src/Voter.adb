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
         success := False;
      else
         success := False;
      end if;
   end;

   procedure Sensor2Init(success : out Boolean)
   is
   begin
       if Sensor2.trainSpeed > 0 then
         success := False;
      else
         success := False;
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
