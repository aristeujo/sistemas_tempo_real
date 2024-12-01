with Ada.Text_IO; use Ada.Text_IO;

procedure One_Task_C is
   
   -- Tipo de tarefa com sincronização
   task type Hello_Task (Message : Character; Amount : Integer) is
      entry Start;
   end Hello_Task;

   -- Corpo da tarefa
   task body Hello_Task is
   begin
      accept Start;
      for I in 1 .. Amount loop
         Put_Line("Hello, I am Task " & Message);
         delay 0.5; -- Adiciona um atraso de 500 ms
      end loop;
   end Hello_Task;

   -- Declaração das variáveis
   Task_A : Hello_Task ('A', 5);
   Task_B : Hello_Task ('B', 7);

   Choice : Character;

begin
   -- Solicita ao usuário a ordem de execução
   Put_Line("Escolha a ordem das tarefas:");
   Put_Line("Digite 'A' para iniciar Task_A primeiro ou 'B' para iniciar Task_B primeiro:");
   Get(Choice);

   if Choice = 'A' or Choice = 'a' then
      -- Inicia Task_A primeiro
      Task_A.Start;
      Task_B.Start;
   elsif Choice = 'B' or Choice = 'b' then
      -- Inicia Task_B primeiro
      Task_B.Start;
      Task_A.Start;
   else
      Put_Line("Escolha inválida. Nenhuma tarefa será executada.");
   end if;

end One_Task_C;
