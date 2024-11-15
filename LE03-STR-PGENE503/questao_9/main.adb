with Ada.Text_IO; use Ada.Text_IO;
with Queues;

procedure Main is
   Q : Queues.Queue;
   Element : Queues.Queue_Element;
begin
   Queues.Enqueue(Q, Queues.Queue_Element(5));
   Queues.Enqueue(Q, Queues.Queue_Element(11));
   Queues.Enqueue(Q, Queues.Queue_Element(25));

   while not Queues.Is_Empty(Q) loop
      Queues.Dequeue(Q, Element);
      Put_Line("Elemento removido: " & Integer'Image(Integer(Element)));
   end loop;
end Main;
