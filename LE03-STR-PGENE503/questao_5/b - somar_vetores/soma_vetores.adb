with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Soma_Vetores is
   type Vetor is array (Positive range <>) of Integer;

   -- Procedimento para ler um vetor de inteiros
   procedure Le_Vetor(V : out Vetor) is
   begin
      for I in V'Range loop
         Put("Digite o valor do elemento " & Integer'Image(I) & ": ");
         Get(V(I));
      end loop;
   end Le_Vetor;

   -- Procedimento para somar dois vetores e armazenar o resultado em C
   procedure Soma(A, B : in Vetor; C : out Vetor) is
      Min_Size : constant Positive := Integer'Min(A'Length, B'Length);
   begin
      for I in 1 .. Min_Size loop
         C(I) := A(I) + B(I);
      end loop;

      -- Copiar elementos restantes do vetor maior, se houver
      if A'Length > B'Length then
         for I in Min_Size + 1 .. A'Length loop
            C(I) := A(I);
         end loop;
      elsif B'Length > A'Length then
         for I in Min_Size + 1 .. B'Length loop
            C(I) := B(I);
         end loop;
      end if;
   end Soma;

   -- Vetores de entrada e resultado
   A : Vetor(1 .. 5);  -- Exemplo com tamanho 5
   B : Vetor(1 .. 3);  -- Exemplo com tamanho 3
   C : Vetor(1 .. Integer'Max(A'Length, B'Length));  -- Tamanho do maior vetor

begin
   Put_Line("Leitura do vetor A:");
   Le_Vetor(A);
   Put_Line("Leitura do vetor B:");
   Le_Vetor(B);

   -- Calcula a soma de A e B
   Soma(A, B, C);

   -- Exibe o vetor resultante C
   Put("Vetor C (soma de A e B): ");
   for I in C'Range loop
      Put(Integer'Image(C(I)) & " ");
   end loop;
   New_Line;
end Soma_Vetores;
