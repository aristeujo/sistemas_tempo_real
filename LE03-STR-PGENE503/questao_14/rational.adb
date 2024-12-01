with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

package body Rational is

   function GCD(X, Y : Integer) return Integer is
      A, B : Integer := abs(X);
   begin
      B := abs(Y);
      while B /= 0 loop
         declare
            Temp : constant Integer := B;
         begin
            B := A mod B;
            A := Temp;
         end;
      end loop;
      return A;
   end GCD;

   procedure Simplify(R : in out Racional) is
      G : Integer := GCD(R.Numerator, R.Denominator);
   begin
      R.Numerator := R.Numerator / G;
      R.Denominator := R.Denominator / G;
      if R.Denominator < 0 then
         R.Numerator := -R.Numerator;
         R.Denominator := -R.Denominator;
      end if;
   end Simplify;

   function Create(Numerator : Integer := 0; Denominator : Integer := 1) return Racional is
      R : Racional := (Numerator => Numerator, Denominator => Denominator);
   begin
      if Denominator = 0 then
         raise Constraint_Error with "Denominator cannot be zero";
      end if;
      Simplify(R);
      return R;
   end Create;

   function "+" (Left, Right : Racional) return Racional is
      Result : Racional := Create(Left.Numerator * Right.Denominator + Right.Numerator * Left.Denominator,
                                  Left.Denominator * Right.Denominator);
   begin
      Simplify(Result);
      return Result;
   end "+";

   function "-" (Left, Right : Racional) return Racional is
      Result : Racional := Create(Left.Numerator * Right.Denominator - Right.Numerator * Left.Denominator,
                                  Left.Denominator * Right.Denominator);
   begin
      Simplify(Result);
      return Result;
   end "-";

   function "*" (Left, Right : Racional) return Racional is
      Result : Racional := Create(Left.Numerator * Right.Numerator,
                                  Left.Denominator * Right.Denominator);
   begin
      Simplify(Result);
      return Result;
   end "*";

   function "/" (Left, Right : Racional) return Racional is
      Result : Racional := Create(Left.Numerator * Right.Denominator,
                                  Left.Denominator * Right.Numerator);
   begin
      if Right.Numerator = 0 then
         raise Constraint_Error with "Cannot divide by zero";
      end if;
      Simplify(Result);
      return Result;
   end "/";

   function To_String(R : Racional) return String is
   begin
      return Integer'Image(R.Numerator) & "/" & Integer'Image(R.Denominator);
   end To_String;

   function To_Float(R : Racional) return String is
      Result : Float := Float(R.Numerator) / Float(R.Denominator);
   begin
      return Float'Image(Float(Integer(Result * 1000.0 + 0.5)) / 1000.0);
   end To_Float;

end Rational;
