with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Soma_Diagonal is
   type Matriz is array (Integer range <>, Integer range <>) of Integer;

   N : Integer;
   Soma : Integer := 0;

begin
   Put("Digite a dimensão da matriz quadrada: ");
   Get(N);

   declare
      Matriz_A : Matriz(1 .. N, 1 .. N);
   begin
      Put_Line("Digite os elementos da matriz:");
      for I in Matriz_A'Range(1) loop
         for J in Matriz_A'Range(2) loop
            Put("Elemento (" & I'Img & ", " & J'Img & "): ");
            Get(Item => Matriz_A(I, J));
         end loop;
      end loop;

      for I in Matriz_A'Range(1) loop
         Soma := Soma + Matriz_A(I, I);
      end loop;

      Put("Soma dos elementos da diagonal principal: ");
      Put(Soma'Img);
      New_Line;
   end;
end Soma_Diagonal;
