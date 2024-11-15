with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Contar_E_Listar_Vogais is
   Texto : String(1 .. 100);  -- Define um tamanho máximo para a string
   Num_Vogais : Integer := 0;
   Last : Natural;

   -- Define um tipo para o array de caracteres que representa as vogais
   type Conjunto_Vogais is array (1 .. 10) of Character;
   Vogais : constant Conjunto_Vogais := ('A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u');

   -- String para armazenar as vogais encontradas
   Encontradas : String(1 .. 100);
   Index : Natural := 0;

   -- Função para verificar se um caractere é uma vogal
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
   -- Leitura da string do usuário
   Put("Digite uma string (máximo 100 caracteres): ");
   Get_Line(Texto, Last);

   -- Contagem das vogais e armazenamento das encontradas
   for I in 1 .. Last loop
      if Is_Vogal(Texto(I)) then
         Num_Vogais := Num_Vogais + 1;
         Index := Index + 1;
         Encontradas(Index) := Texto(I);
      end if;
   end loop;

   -- Exibição do resultado
   Put("Número de vogais na string: ");
   Put(Num_Vogais, Width => 0);
   New_Line;

   -- Exibir as vogais encontradas
   if Num_Vogais > 0 then
      Put("Vogais encontradas: ");
      for J in 1 .. Index loop
         Put(Encontradas(J));
      end loop;
      New_Line;
   else
      Put_Line("Nenhuma vogal encontrada.");
   end if;
end Contar_E_Listar_Vogais;
