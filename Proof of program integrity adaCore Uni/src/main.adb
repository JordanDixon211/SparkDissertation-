procedure Main is

begin

   -- runtime error is err at program exe
   -- eg array accessors , overflow errors

   type Nat_Array is array (Integer range <>) of Natural;

   A : Nat_Array (1 .. 10);

   I , J , P ,Q : Integer;

   A(I + J) := P / Q;
   -- Above here Overflow may occure and array out of bounds due to the Indexing of a Uncontrained integer
   -- Eg
   -- A (Integer'Last + 1) : = p/q
   -- out of range of the index

   -- use to prove they will not occure at runtime gnat prove can do this

   -- statically verify absense of runtime errors
   -- form named vc's is generated for each possible runtime error if vc is true it will not occur

   -- when verifying subs body, pre is all that is know about the inputs
   -- when is called, post is all know about outputs

   -- eg

   procedure Increment (x : in out Integer) with
     Pre => x < Integer'Last is
   begin
      x := x + 1;
   end;

   X := Integer'Last - 2;
   Increment(x);
   -- does not know values of x could over flow
   x := x + 1;

   procedure Absolute(x : in out Integer) with
     pre => x > Integer'First,
     Contract_Cases => (x < 0 => x = - x'Old,
                        x >= 0 => x = X'Old);

   pragma Assume (X < Integer'Last);
   X := X + 1;

   --annotate sub by spec a disjoint set of cases
   -- case is composed of a guard and a consequence
   -- only the consequence of active case is verififed
end Main;
