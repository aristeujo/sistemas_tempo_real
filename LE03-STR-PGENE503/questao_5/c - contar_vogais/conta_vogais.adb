with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Conta_Vogais is
   Texto : String(1 .. 100);  -- Define um tamanho máximo para a string
   Num_Vogais : Integer := 0;
   Last : Natural;

   type Conjunto_Vogais is array (1 .. 10) of Character;
   Vogais : constant Conjunto_Vogais := ('A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u');

   function Is_Vogal (C : Character) return Boolean is
   begin
      for V of Vogais loop
         if C = V then
            return True;
         end if;
      end loop;
      return False;
   end Is_Vogal;

begin
   Put("Digite uma string (máximo 100 caracteres): ");
   Get_Line(Texto, Last);

   for I in 1 .. Last loop
      if Is_Vogal(Texto(I)) then
         Num_Vogais := Num_Vogais + 1;
      end if;
   end loop;

   Put("Número de vogais na string: ");
   Put(Num_Vogais, Width => 0);
   New_Line;
end Conta_Vogais;
