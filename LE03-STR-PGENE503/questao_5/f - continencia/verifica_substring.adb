with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure Verifica_Substring is
   A : String(1 .. 100);  
   B : String(1 .. 50);   
   Last_A, Last_B : Natural;

begin
   Put("Digite a string A (máximo 100 caracteres): ");
   Get_Line(A, Last_A);

   Put("Digite a string B (máximo 50 caracteres): ");
   Get_Line(B, Last_B);

   if Index(A(1 .. Last_A), B(1 .. Last_B)) /= 0 then
      Put_Line("A string B está contida em A.");
   else
      Put_Line("A string B não está contida em A.");
   end if;
end Verifica_Substring;
