package Predictor with
   SPARK_Mode => On
is
   subtype Interval is Integer range 19 .. 20; -- 20 Second Interval is usally the mean time for modern railway crossings.
   subtype distanceToCrossing is  Integer range 0 .. 100; -- distance from train to the railway
   subtype TrainDistance is Integer range 0 .. 60;

   ClosingSignalsInterval : constant Interval := 20; --Interval between the distance and where the train is, signals must start 20 seconds before train arrives.
   dist : distanceToCrossing := 0;
   TrainArrival : TrainDistance;


   --
   procedure intervalCalculation with
     Global => (input => (dist, ClosingSignalsInterval), Output => TrainArrival),
     Depends => (TrainArrival => (dist,ClosingSignalsInterval)),
     pre => dist > 0 and ClosingSignalsInterval = 20,
     Post => TrainArrival > 0;

   procedure setDistanceToCrossing(sucess : out Boolean ;  distance : in distanceToCrossing ) with
     Global => (Output => dist),
     Depends => ((dist, sucess) => distance),
     pre => distance > 0,
     post => (if sucess = True then dist > 0);
end Predictor;
