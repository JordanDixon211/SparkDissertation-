with Ada.Numerics.Discrete_Random;
package Sensor with
   SPARK_Mode => On
is

   subtype RandRange is Positive range 1 .. 8;
   package randPos is new Ada.Numerics.Discrete_Random(RandRange);

 --  genVoltage := randPos.Random(genVoltage);
   subtype Speed is Integer range 0 .. 150;
   subtype TrainState is Boolean;
   subtype voltage is Integer range 0 .. 6;

   trainSpeed : Speed := 0;
   train : TrainState := false;
   -- methods TrainStatus, GetSpeed, SetSpeed

   procedure trainIncoming(userDefSpeed : in Speed) with
   Global => (in_Out => (trainSpeed ,train)), --trainSpeed State changes on exit of function, Train state also changes
   Depends => ((trainSpeed,train) => (userDefSpeed,train,trainSpeed)),
   post => (if train'Old = False then train = True);

   function getSpeed return Speed
   with
   Global => (Input => (trainSpeed, train)),  --Input coming from TrainSpeed to capture the Speeds
   pre => train = True; --Pre depends on train being true as this function is never called unless the setSpeed has already been set.

    procedure setSpeed(speed1 : in Speed ; success : out boolean) with
    Global => (in_Out =>  trainSpeed), --TrainSpeed is being accessed and changed by function setSpeed
     pre => trainSpeed = 0 and speed1 > 0,
     post => (if success = true then trainSpeed > 0 else trainSpeed = 0);

end Sensor;
