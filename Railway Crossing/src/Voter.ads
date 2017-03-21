with Sensor2; use Sensor2;
with sensor; use sensor;
package Voter with
SPARK_Mode => On
is

  -- gets the readings and sets the reading to sensor one and two
   sensorReadingOne : Sensor2.Speed := 0;
   sensorReadingTwo : Sensor2.Speed := 0;
   bestSensor : Sensor2.Speed := 0;

   --Checks procdures are init properly
   procedure Sensor2Init(success : out Boolean)
        with
        Global => (Input => Sensor2.trainSpeed, Output => sensorReadingTwo),
        Depends => ((sensorReadingTwo,success) => Sensor2.trainSpeed),
        pre => Sensor2.trainSpeed > 0,
        post => Sensor2.trainSpeed = sensorReadingTwo;

      procedure Sensor1Init(success : out Boolean)
        with
        Global => (Input => sensor.trainSpeed, Output => sensorReadingOne),
        Depends => ((sensorReadingOne,success) => sensor.trainSpeed),
        pre => sensor.trainSpeed > 0,
        post => sensor.trainSpeed = sensorReadingOne;


   --Checks which values seem more reliable based on highest values for safety
   procedure SelectValues
     with
       Global => (Input => (sensorReadingOne, sensorReadingTwo), Output => bestSensor),
       Depends => (bestSensor => (sensorReadingOne, sensorReadingTwo)),
       pre => sensorReadingOne > 0 and sensorReadingTwo > 0,
       post => bestSensor = sensorReadingOne or bestSensor = sensorReadingTwo;

   function findMax return Sensor.Speed
     with Global => (Input => (sensorReadingOne, sensorReadingTwo)),
     pre => sensorReadingOne > 0 and sensorReadingTwo > 0,
     Post => (if sensorReadingOne > sensorReadingTwo then findMax'Result = sensorReadingOne else findMax'Result = sensorReadingTwo);
   end Voter;
