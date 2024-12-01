with Ada.Text_IO; use Ada.Text_IO;

procedure One_Task_B is
   
   -- Tipo de tarefa
   task type Hello_Task (Message : Character; Amount : Integer) is
   end Hello_Task;

   -- Corpo da tarefa
   task body Hello_Task is
   begin
      for I in 1 .. Amount loop
         Put_Line("Hello, I am Task " & Message);
         delay 0.5;
      end loop;
   end Hello_Task;

   -- Declaração das variáveis
   Task_A : Hello_Task ('A', 5);
   Task_B : Hello_Task ('B', 7);

begin
   null;
end One_Task_B;
