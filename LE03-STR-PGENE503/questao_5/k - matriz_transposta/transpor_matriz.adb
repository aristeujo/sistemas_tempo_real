with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Transpor_Matriz is
   type Matriz is array (Integer range <>, Integer range <>) of Integer;

   Linhas : constant Integer := 3;  -- Defina o número de linhas
   Colunas : constant Integer := 3; -- Defina o número de colunas

   Matriz_Original : Matriz(1 .. Linhas, 1 .. Colunas);
   Matriz_Transposta : Matriz(1 .. Colunas, 1 .. Linhas);

begin
   Put_Line("Digite os elementos da matriz:");
   for I in Matriz_Original'Range(1) loop
      for J in Matriz_Original'Range(2) loop
         Put("Elemento (" & I'Img & ", " & J'Img & "): ");
         Get(Item => Matriz_Original(I, J));
      end loop;
   end loop;

   Put_Line("Matriz Original:");
   for I in Matriz_Original'Range(1) loop
      for J in Matriz_Original'Range(2) loop
         Put(Matriz_Original(I, J)'Img);
         Put(" ");
      end loop;
      New_Line;
   end loop;

   for I in Matriz_Original'Range(1) loop
      for J in Matriz_Original'Range(2) loop
         Matriz_Transposta(J, I) := Matriz_Original(I, J);
      end loop;
   end loop;

   Put_Line("Matriz Transposta:");
   for I in Matriz_Transposta'Range(1) loop
      for J in Matriz_Transposta'Range(2) loop
         Put(Matriz_Transposta(I, J)'Img);
         Put(" ");
      end loop;
      New_Line;
   end loop;
end Transpor_Matriz;
