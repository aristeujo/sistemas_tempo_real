with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Produto_Interno is
   N : constant Integer := 5;

   type Vetor is array (1 .. N) of Integer;
   A : Vetor := (1, 2, 3, 4, 5);  
   B : Vetor := (6, 7, 8, 9, 10); 

   Produto : Integer := 0;

begin
   for I in 1 .. N loop
      Produto := Produto + A(I) * B(I);
   end loop;

   Put("O produto interno entre os vetores A e B é: ");
   Put(Produto, Width => 0);
   New_Line;
end Produto_Interno;
