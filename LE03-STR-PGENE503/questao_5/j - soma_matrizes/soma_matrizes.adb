with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Soma_Matrizes is
   M : constant Integer := 3;  -- Número de linhas
   N : constant Integer := 3;  -- Número de colunas

   type Matriz is array (1 .. M, 1 .. N) of Integer;
   A, B, C : Matriz;

begin
   Put_Line("Digite os elementos da matriz A:");
   for I in 1 .. M loop
      for J in 1 .. N loop
         Put("Elemento A(" & Integer'Image(I) & ", " & Integer'Image(J) & "): ");
         Get(A(I, J));
      end loop;
   end loop;

   Put_Line("Digite os elementos da matriz B:");
   for I in 1 .. M loop
      for J in 1 .. N loop
         Put("Elemento B(" & Integer'Image(I) & ", " & Integer'Image(J) & "): ");
         Get(B(I, J));
      end loop;
   end loop;

   for I in 1 .. M loop
      for J in 1 .. N loop
         C(I, J) := A(I, J) + B(I, J);
      end loop;
   end loop;

   Put_Line("A matriz C (soma de A e B) é:");
   for I in 1 .. M loop
      for J in 1 .. N loop
         Put(C(I, J), Width => 5);
      end loop;
      New_Line;
   end loop;
end Soma_Matrizes;
