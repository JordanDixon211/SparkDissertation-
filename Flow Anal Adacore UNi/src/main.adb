procedure Main is

begin

   procedure swap(x , y : in out Integer) with
     Depends => (x => y, -- x depends on the init value of y
                 Y => X); -- y depends on the init value of x

   function getvalueofx return Natural with
     Depends => (getvalueofx'Result => x); --result depends on x

   procedure setxtoyplysz with
     Depends => (x =>(Y, Z)); -- X depends on y and z all global variables

   procedure setxtoxplusy with
   Depends => (x =>+ y); -- x dep on y init val and x init val


   procedure setxtoxplusy with
     Depends => (null => x); -- no output is affected by x

   procedure setxtozero with
     Depends => (x => null); -- x dep on no input

   -- record types example
   type Rec is record
      F1 : Natural;
      F2 : Natural;
   end record;

   R: Rec;

   R.F1 := 0
   R.F2 := 0;

   -- R is init

   procedure Init_F2
     (R : in out Rec) is
   begin
      R.F2
   end Init_F2;

   R.F1 := 0;
   Init_F2(R);
   -- R should be init before the call

end Main;
