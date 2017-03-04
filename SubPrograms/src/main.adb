procedure Main is

   function F (V : Integer) return Integer;
   function inouttest(V : in out Integer) return Integer;

   function inouttest(V : in out Integer) return Integer is
      R : Integer := v * 2;

   begin
      v := 0;
      R := R * 2;
      return R - 1; -- modifies V and returns R
   end inouttest;

   function noParam return Integer;

   procedure printc (V : Integer);
   procedure printc (v : Float);

begin
   --  Insert code here.
   null;
end Main;
