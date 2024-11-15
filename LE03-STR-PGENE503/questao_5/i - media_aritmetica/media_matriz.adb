with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;

procedure Media_Matriz is
   Rows : constant Integer := 3; 
   Cols : constant Integer := 3;  

   type Matriz is array (1 .. Rows, 1 .. Cols) of Integer;
   A : Matriz;

   Soma : Integer := 0;
   Total_Elementos : Integer := Rows * Cols;
   Media : Float;

begin
   Put_Line("Digite os elementos da matriz:");
   for I in 1 .. Rows loop
      for J in 1 .. Cols loop
         Put("Elemento (" & Integer'Image(I) & ", " & Integer'Image(J) & "): ");
         Get(A(I, J));
         Soma := Soma + A(I, J);
      end loop;
   end loop;

   Media := Float(Soma) / Float(Total_Elementos);

   Put("A média aritmética dos elementos da matriz é: ");
   Put(Media, Fore => 2, Aft => 2, Exp => 0);
   New_Line;
end Media_Matriz;
