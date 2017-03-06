procedure Main is

begin
   -- two views off an abstract
   -- two different views of an object
   -- abstraction and refined one
   -- heres a spec of Increase
   procedure Increase (x : in out Integer) with
     Global => null,
     Pre => x <= 100,
     post => x'Old < x;
   -- heres the body which contains implemented to increase val of argument
   procedure Increase (x : in out Integer) is
   begin
      x := x + 1;
   end;

   -- spec show what users can rely, always strictly increase the argument
   --abs simplifies imp and verification

     procedure Increase (x : in out Integer) with
     Global => null,
     Pre => x <= 100,
     post => x'Old < x;

   while x <= 100 loop
      Increase(x);
   end loop;
   pragma Assert(x = 101);

   --state abstractions

   Abstract_State => The_Stack
   Refined_State => (The_Stack => (Content, Top)) -- state abstraction must be complete must be part of abs
                                                  -- must add refined to link to abstract state.

   --refined in packages body

end Main;
