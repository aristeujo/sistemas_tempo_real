with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Encontrar_Maior_Elemento is
   N : constant Integer := 10;

   type Array_Numerico is array (1 .. N) of Integer;
   Numeros : Array_Numerico;

   Maior : Integer;

begin
   Put_Line("Digite os elementos do array:");
   for I in 1 .. N loop
      Put("Elemento " & Integer'Image(I) & ": ");
      Get(Numeros(I));
   end loop;

   Maior := Numeros(1);

   for I in 2 .. N loop
      if Numeros(I) > Maior then
         Maior := Numeros(I);
      end if;
   end loop;

   Put("O maior valor no array é: ");
   Put(Maior, Width => 0);
   New_Line;
end Encontrar_Maior_Elemento;
