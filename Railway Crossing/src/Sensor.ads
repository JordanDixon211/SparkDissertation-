package Sensor with
   SPARK_Mode => On
is

   subtype Speed is Integer in range 0 .. 150;
   subtype TrainState is new Boolean;
   subtype voltage is Integer is range 0 .. 6;

   trainSpeed : Speed;
   -- methods TrainStatus, GetSpeed, SetSpeed

   procedure trainIncoming(userDefSpeed : in Speed) with
   Global => (in_Out => State),
   Depends => (State =>+ null),
   post => State'Old /= State'Result;

   procedure setSpeed with
   Global => null,
   Depends => (GetSpeed'Result => trainSpeed),
   pre => trainSpeed > 0;

   procedure setSpeed with
   Global => null,
   Depends => (GetSpeed'Result => State),
   pre => State = True;

