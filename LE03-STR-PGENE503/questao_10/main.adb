with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Generic_Queues;

procedure Main is
   subtype Fixed_String is String(1 .. 20);

   package Integer_Queue is new Generic_Queues(Queue_Element => Integer);
   package Float_Queue is new Generic_Queues(Queue_Element => Float);
   package String_Queue is new Generic_Queues(Queue_Element => Fixed_String);

   Int_Q : Integer_Queue.Queue;
   Flt_Q : Float_Queue.Queue;
   Str_Q : String_Queue.Queue;

   Choice : Integer;
   Int_Element : Integer;
   Flt_Element : Float;
   Str_Element : Fixed_String;

begin
   Put_Line("Escolha o tipo de fila:");
   Put_Line("1. Integer");
   Put_Line("2. Float");
   Put_Line("3. String");
   Get(Choice);

   case Choice is
      when 1 =>
         Put_Line("Fila de Integer selecionada.");
         Integer_Queue.Enqueue(Int_Q, 10);
         Integer_Queue.Enqueue(Int_Q, 20);
         Integer_Queue.Enqueue(Int_Q, 30);
         while not Integer_Queue.Is_Empty(Int_Q) loop
            Integer_Queue.Dequeue(Int_Q, Int_Element);
            Put_Line("Elemento removido: " & Integer'Image(Int_Element));
         end loop;

      when 2 =>
         Put_Line("Fila de Float selecionada.");
         Float_Queue.Enqueue(Flt_Q, 10.5);
         Float_Queue.Enqueue(Flt_Q, 20.5);
         Float_Queue.Enqueue(Flt_Q, 30.5);
         while not Float_Queue.Is_Empty(Flt_Q) loop
            Float_Queue.Dequeue(Flt_Q, Flt_Element);
            Put_Line("Elemento removido: " & Float'Image(Flt_Element));
         end loop;

      when 3 =>
         Put_Line("Fila de String selecionada.");
         String_Queue.Enqueue(Str_Q, "Hello               ");
         String_Queue.Enqueue(Str_Q, "World               ");
         String_Queue.Enqueue(Str_Q, "Ada                 ");
         while not String_Queue.Is_Empty(Str_Q) loop
            String_Queue.Dequeue(Str_Q, Str_Element);
            Put_Line("Elemento removido: " & Str_Element);
         end loop;

      when others =>
         Put_Line("Escolha inválida.");
   end case;

end Main;
