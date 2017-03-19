with Sensor2; use Sensor2;
with sensor; use sensor;
package Voter with
SPARK_Mode => On
is

  -- gets the readings and sets the reading to sensor one and two
   sensorReadingOne : Sensor2.Speed := 0;
   sensorReadingTwo : Sensor2.Speed := 0;


   --Checks procdures are init properly
   procedure checkSensor2Init
        with
        Global => (Input => Sensor2.trainSpeed, Output => sensorReadingTwo),
        Depends => (sensorReadingTwo => Sensor2.trainSpeed),
        pre => Sensor2.trainSpeed > 0,
        post => Sensor2.trainSpeed = sensorReadingTwo;

      procedure checkSensor1Init
        with
        Global => (Input => sensor.trainSpeed, Output => sensorReadingOne),
        Depends => (sensorReadingOne => sensor.trainSpeed),
        pre => sensor.trainSpeed > 0,
     post => sensor.trainSpeed = sensorReadingOne;


   --Checks which values seem more reliable based on highest values for safety
   procedure SelectValues(reliableSensor : out Sensor.Speed)
     with
       Global => (Input => (sensorReadingOne, sensorReadingTwo)),
       Depends => (reliableSensor => (sensorReadingOne, sensorReadingTwo)),
       pre => sensorReadingOne > 0 and sensorReadingTwo > 0,
       post => reliableSensor = sensorReadingOne or sensorReadingTwo;
   end Voter;
