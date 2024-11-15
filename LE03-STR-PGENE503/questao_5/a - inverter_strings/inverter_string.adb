with Ada.Text_IO; use Ada.Text_IO;

procedure Inverter_String is
   Input : String(1 .. 100); 
   Last : Natural;          
   Inverted : String(1 .. 100);
begin
   Put("Digite uma string (máx. 100 caracteres): ");
   Get_Line(Input, Last);

   for I in 1 .. Last loop
      Inverted(I) := Input(Last - I + 1);
   end loop;

   Put_Line("String invertida: " & Inverted(1 .. Last));
end Inverter_String;
