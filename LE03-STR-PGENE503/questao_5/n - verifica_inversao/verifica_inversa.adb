with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Verifica_Inversa is
   type Matriz_3x3 is array (1 .. 3, 1 .. 3) of Integer;

   Matriz_A, Matriz_B, Produto : Matriz_3x3;
   Identidade : constant Matriz_3x3 := ((1, 0, 0), (0, 1, 0), (0, 0, 1));
   Sao_Inversas : Boolean := True;

begin
   Put_Line("Digite os elementos da matriz A:");
   for I in 1 .. 3 loop
      for J in 1 .. 3 loop
         Put("Elemento A(" & I'Img & ", " & J'Img & "): ");
         Get(Item => Matriz_A(I, J));
      end loop;
   end loop;

   Put_Line("Digite os elementos da matriz B:");
   for I in 1 .. 3 loop
      for J in 1 .. 3 loop
         Put("Elemento B(" & I'Img & ", " & J'Img & "): ");
         Get(Item => Matriz_B(I, J));
      end loop;
   end loop;

   for I in 1 .. 3 loop
      for J in 1 .. 3 loop
         Produto(I, J) := 0;
         for K in 1 .. 3 loop
            Produto(I, J) := Produto(I, J) + Matriz_A(I, K) * Matriz_B(K, J);
         end loop;
      end loop;
   end loop;

   for I in 1 .. 3 loop
      for J in 1 .. 3 loop
         if Produto(I, J) /= Identidade(I, J) then
            Sao_Inversas := False;
            exit;
         end if;
      end loop;
      exit when not Sao_Inversas;
   end loop;

   if Sao_Inversas then
      Put_Line("As matrizes são inversas.");
   else
      Put_Line("As matrizes não são inversas.");
   end if;
end Verifica_Inversa;
