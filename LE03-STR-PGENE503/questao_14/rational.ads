package Rational is

   type Racional is private;

   function Create(Numerator : Integer := 0; Denominator : Integer := 1) return Racional;
   function "+" (Left, Right : Racional) return Racional;
   function "-" (Left, Right : Racional) return Racional;
   function "*" (Left, Right : Racional) return Racional;
   function "/" (Left, Right : Racional) return Racional;
   function To_String(R : Racional) return String;
   function To_Float(R : Racional) return String;

private

   type Racional is record
      Numerator   : Integer;
      Denominator : Integer;
   end record;

   procedure Simplify(R : in out Racional);

end Rational;
