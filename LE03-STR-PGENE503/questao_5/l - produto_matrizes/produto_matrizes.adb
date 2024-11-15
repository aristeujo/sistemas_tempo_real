with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;

procedure Produto_Matrizes is
   type Matriz is array (Integer range <>, Integer range <>) of Integer;

   M, N, P, Q : Integer;
   Matriz_A, Matriz_B, Matriz_C : access Matriz;

begin
   Put("Digite o número de linhas da matriz A: ");
   Get(M);
   Put("Digite o número de colunas da matriz A: ");
   Get(N);

   Put("Digite o número de linhas da matriz B: ");
   Get(P);
   Put("Digite o número de colunas da matriz B: ");
   Get(Q);

   if N /= P then
      Put_Line("Erro: A multiplicação não é possível. O número de colunas de A deve ser igual ao número de linhas de B.");
      return;
   end if;

   Matriz_A := new Matriz(1 .. M, 1 .. N);
   Matriz_B := new Matriz(1 .. P, 1 .. Q);
   Matriz_C := new Matriz(1 .. M, 1 .. Q);

   Put_Line("Digite os elementos da matriz A:");
   for I in Matriz_A.all'Range(1) loop
      for J in Matriz_A.all'Range(2) loop
         Put("Elemento A(" & I'Img & ", " & J'Img & "): ");
         Get(Item => Matriz_A(I, J));
      end loop;
   end loop;

   Put_Line("Digite os elementos da matriz B:");
   for I in Matriz_B.all'Range(1) loop
      for J in Matriz_B.all'Range(2) loop
         Put("Elemento B(" & I'Img & ", " & J'Img & "): ");
         Get(Item => Matriz_B(I, J));
      end loop;
   end loop;

   for I in Matriz_C.all'Range(1) loop
      for J in Matriz_C.all'Range(2) loop
         Matriz_C(I, J) := 0;
         for K in 1 .. N loop
            Matriz_C(I, J) := Matriz_C(I, J) + Matriz_A(I, K) * Matriz_B(K, J);
         end loop;
      end loop;
   end loop;

   Put_Line("Matriz C (produto de A e B):");
   for I in Matriz_C.all'Range(1) loop
      for J in Matriz_C.all'Range(2) loop
         Put(Matriz_C(I, J)'Img);
         Put(" ");
      end loop;
      New_Line;
   end loop;
end Produto_Matrizes;
