procedure Main is

   Cx, Cy : Float := 0.0;

   type shape is record
      id: Integer;
      x : Float := cx;
      y : Float := cy;
   end record;

   Type String is array( 1 .. 10) of Character;

   type pos is record
      name : String;
      p : shape;
   end record;

   type R is record
      A, B , C : Integer;
   end record;

   type shape_kind is (Circle, Line, Torus);

   type shape2(Kind : shape_kind) is record
      x, y : Float;
      case Kind is
         when Line =>
            x2, y2 : Float;
         when Torus =>
            OuterRadius, InnerRadius : Float;
         when Circle =>
            Radius : Float;
      end case;
   end record;

   -- C : R := (A => 1); is illegal need to supply all the varaibles in the records some data
   -- here is better --
   C : R := (A => 1, others => <>);
   -- this is fine too --
   C : R := (others => <>);

   S:shape;
   S2 : shape2(Circle);
begin
   s.id := 1;
   s.x := 2.0;
   s.y := 1.0;

end Main;
