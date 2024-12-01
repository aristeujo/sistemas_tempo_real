with Ada.Text_IO; use Ada.Text_IO;
with Rational;

procedure Main is
   R1, R2, Result : Rational.Racional;
begin
   R1 := Rational.Create(3, 4);
   R2 := Rational.Create(2, 5);

   Put_Line("R1: " & Rational.To_String(R1));
   Put_Line("R2: " & Rational.To_String(R2));

   -- Operações com escopo explícito
   Result := Rational."+"(R1, R2);
   Put_Line("R1 + R2: " & Rational.To_String(Result));

   Result := Rational."-"(R1, R2);
   Put_Line("R1 - R2: " & Rational.To_String(Result));

   Result := Rational."*"(R1, R2);
   Put_Line("R1 * R2: " & Rational.To_String(Result));

   Result := Rational."/"(R1, R2);
   Put_Line("R1 / R2: " & Rational.To_String(Result));

   Put_Line("R1 como ponto flutuante: " & Rational.To_Float(R1));
   Put_Line("R2 como ponto flutuante: " & Rational.To_Float(R2));
end Main;
