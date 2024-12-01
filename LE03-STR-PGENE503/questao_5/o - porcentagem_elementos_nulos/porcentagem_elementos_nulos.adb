with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Porcentagem_Elementos_Nulos is
   type Matriz is array (Integer range <>, Integer range <>) of Integer;

   Linhas, Colunas : Integer;
   Contador_Nulos : Integer := 0;
   Total_Elementos : Integer;
   Porcentagem_Nulos : Float;

begin
   Put("Digite o número de linhas da matriz: ");
   Get(Linhas);
   Put("Digite o número de colunas da matriz: ");
   Get(Colunas);

   declare
      Matriz_A : Matriz(1 .. Linhas, 1 .. Colunas);
   begin
      Put_Line("Digite os elementos da matriz:");
      for I in Matriz_A'Range(1) loop
         for J in Matriz_A'Range(2) loop
            Put("Elemento (" & I'Img & ", " & J'Img & "): ");
            Get(Item => Matriz_A(I, J));
            if Matriz_A(I, J) = 0 then
               Contador_Nulos := Contador_Nulos + 1;
            end if;
         end loop;
      end loop;

      Total_Elementos := Linhas * Colunas;
      Porcentagem_Nulos := Float(Contador_Nulos) / Float(Total_Elementos) * 100.0;

      Put("Porcentagem de elementos nulos: ");
      Ada.Float_Text_IO.Put(Porcentagem_Nulos, Fore => 1, Aft => 2, Exp => 0);
      New_Line;
   end;
end Porcentagem_Elementos_Nulos;
