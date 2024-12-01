with Ada.Text_IO; use Ada.Text_IO;

procedure Questao1 is
   
   -- Tipo de tarefa
   task type Hello_Task (Message : Character) is
   end Hello_Task;

   -- Corpo da tarefa
   task body Hello_Task is
   begin
    Put_Line("Hello, I am Task " & Message);
   end Hello_Task;

   -- Declaração das variáveis
   Task_A : Hello_Task ('A');
   Task_B : Hello_Task ('B');

begin
   null;
end Questao1;
