package body Predictor with
   SPARK_Mode => On
is
   procedure setDistanceToCrossing(distance : in distanceToCrossing ) is
   begin
      dist := distance;
   end;

   --Calculates how much time is left before the train reaches the barriers
   procedure intervalCalculation is
   begin
      -- Check if dist is > 0 to avoid divide by 0 error
      if(dist > 0) then
         TrainArrival :=  Float(dist / Voter.bestSensor);
      end if;

      --After T seconds call the Signals Class.
   end;


end Predictor;
