with Ada.Text_IO; use Ada.Text_IO;
with Stacks;

procedure Main is
   S : Stacks.Stack;
   Element : Stacks.Stack_Element;
begin
   -- Empilhar alguns elementos
   Stacks.Push(S, 10);
   Stacks.Push(S, 20);
   Stacks.Push(S, 30);

   -- Desempilhar e exibir elementos
   while not Stacks.Is_Empty(S) loop
      Stacks.Pop(S, Element);
      Put_Line("Elemento removido: " & Integer'Image(Integer(Element)));
   end loop;
end Main;
