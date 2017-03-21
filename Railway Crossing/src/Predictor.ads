with Sensor2; use Sensor2;
with Voter; use Voter;
package Predictor with
   SPARK_Mode => On
is
   subtype Interval is Integer range 19 .. 20; -- 20 Second Interval is usally the mean time for modern railway crossings.
   subtype distanceToCrossing is  Integer range 0 .. 100; -- distance from train to the railway
   subtype TrainDistance is Float range 0.0 .. 60.0;

   ClosingSignalsInterval : constant Interval := 20; --Interval between the distance and where the train is, signals must start 20 seconds before train arrives.
   dist : distanceToCrossing := 0;
   TrainArrival : TrainDistance := 0.0;

   procedure intervalCalculation with
     Global => (input => (dist, ClosingSignalsInterval), Output => TrainArrival),
     Depends => (TrainArrival => (dist,ClosingSignalsInterval)),
     pre => dist > 0 and ClosingSignalsInterval = 20,
     Post => TrainArrival > 0.0;

   procedure setDistanceToCrossing(distance : in distanceToCrossing ) with
     Global => (Output => dist),
     Depends => ((dist) => distance),
     pre => distance > 0,
     post => dist > 0;
end Predictor;
