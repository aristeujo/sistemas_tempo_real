with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Ordenar_Array is
   N : constant Integer := 10;

   type Array_Numerico is array (1 .. N) of Integer;
   Numeros : Array_Numerico;

   Temp : Integer;
   Troca : Boolean;

begin
   Put_Line("Digite os elementos do array:");
   for I in 1 .. N loop
      Put("Elemento " & Integer'Image(I) & ": ");
      Get(Numeros(I));
   end loop;

   loop
      Troca := False;
      for I in 1 .. N - 1 loop
         if Numeros(I) > Numeros(I + 1) then
            -- Troca os elementos
            Temp := Numeros(I);
            Numeros(I) := Numeros(I + 1);
            Numeros(I + 1) := Temp;
            Troca := True;
         end if;
      end loop;
      exit when not Troca;
   end loop;

   Put_Line("Array ordenado em ordem crescente:");
   for I in 1 .. N loop
      Put(Numeros(I), Width => 0);
      Put(" ");
   end loop;
   New_Line;
end Ordenar_Array;
