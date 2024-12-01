with Ada.Text_IO; use Ada.Text_IO;
with Ada.Real_Time; use Ada.Real_Time;

procedure Main is

   -- Variável protegida para sinalizar a interrupção
   protected Interruption_Control is
      procedure Set_Interrupt;
      function Is_Interrupted return Boolean;
   private
      Interrupted : Boolean := False;
   end Interruption_Control;

   protected body Interruption_Control is
      procedure Set_Interrupt is
      begin
         Interrupted := True;
      end Set_Interrupt;

      function Is_Interrupted return Boolean is
      begin
         return Interrupted;
      end Is_Interrupted;
   end Interruption_Control;

   -- Tarefa Producer
   task type Producer is
      entry Order (Char_To_Print : in Character; Count : in Positive := 10; Delay_Time : in Duration := 0.0);
   end Producer;

   task body Producer is
   begin
      loop
         select
            accept Order (Char_To_Print : in Character; Count : in Positive := 10; Delay_Time : in Duration := 0.0) do
               for I in 1 .. Count loop
                  if Interruption_Control.Is_Interrupted then
                     exit;
                  end if;
                  Put(Char_To_Print);
                  if Delay_Time > 0.0 then
                     delay Delay_Time;
                  end if;
               end loop;
               New_Line;
            end Order;
         or
            delay 0.1;
         end select;

         if Interruption_Control.Is_Interrupted then
            exit;
         end if;
      end loop;
      Put_Line("Tarefa finalizada devido à interrupção.");
   end Producer;

   -- Tarefa para capturar a interrupção externa
   task type Interrupt_Handler;

   task body Interrupt_Handler is
      User_Input : Character;
   begin
      Put_Line("Pressione 'S' para interromper a execução.");
      loop
         Get(User_Input);
         if User_Input = 'S' or User_Input = 's' then
            Interruption_Control.Set_Interrupt;
            Put_Line("Interrupção recebida!");
            exit;
         else
            Put_Line("Entrada inválida. Pressione 'S' para interromper.");
         end if;
      end loop;
   end Interrupt_Handler;

   procedure Process_Frame is
      A, B : Producer;
      Interrupt_Instance : Interrupt_Handler;
   begin
      A.Order('A', 10);
      B.Order('B', 10, 1.0);
      A.Order('A', 100);

      loop
         if Interruption_Control.Is_Interrupted then
            Put_Line("Finalizando tarefas devido à interrupção...");
            exit;
         end if;
         delay 0.1;
      end loop;
   end Process_Frame;

begin
   Process_Frame;
end Main;
