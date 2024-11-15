with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
with Generic_Stacks;

procedure Main is
   -- Definindo um subtipo de String com comprimento fixo
   subtype Fixed_String is String(1 .. 20);

   -- Instanciações de pacotes para diferentes tipos
   package Integer_Stack is new Generic_Stacks(Stack_Element => Integer);
   package Float_Stack is new Generic_Stacks(Stack_Element => Float);
   package String_Stack is new Generic_Stacks(Stack_Element => Fixed_String);

   -- Declaração de pilhas para cada tipo
   Int_S : Integer_Stack.Stack;
   Flt_S : Float_Stack.Stack;
   Str_S : String_Stack.Stack;

   -- Variáveis auxiliares
   Choice : Integer;
   Int_Element : Integer;
   Flt_Element : Float;
   Str_Element : Fixed_String;

begin
   -- Menu para escolher o tipo de pilha
   Put_Line("Escolha o tipo de pilha:");
   Put_Line("1. Integer");
   Put_Line("2. Float");
   Put_Line("3. String");
   Get(Choice);

   case Choice is
      when 1 =>
         Put_Line("Pilha de Integer selecionada.");
         Integer_Stack.Push(Int_S, 10);
         Integer_Stack.Push(Int_S, 20);
         Integer_Stack.Push(Int_S, 30);
         while not Integer_Stack.Is_Empty(Int_S) loop
            Integer_Stack.Pop(Int_S, Int_Element);
            Put_Line("Elemento removido: " & Integer'Image(Int_Element));
         end loop;

      when 2 =>
         Put_Line("Pilha de Float selecionada.");
         Float_Stack.Push(Flt_S, 10.5);
         Float_Stack.Push(Flt_S, 20.5);
         Float_Stack.Push(Flt_S, 30.5);
         while not Float_Stack.Is_Empty(Flt_S) loop
            Float_Stack.Pop(Flt_S, Flt_Element);
            Put_Line("Elemento removido: " & Float'Image(Flt_Element));
         end loop;

      when 3 =>
         Put_Line("Pilha de String selecionada.");
         String_Stack.Push(Str_S, "Hello               ");
         String_Stack.Push(Str_S, "World               ");
         String_Stack.Push(Str_S, "Ada                 ");
         while not String_Stack.Is_Empty(Str_S) loop
            String_Stack.Pop(Str_S, Str_Element);
            Put_Line("Elemento removido: " & Str_Element);
         end loop;

      when others =>
         Put_Line("Escolha inválida.");
   end case;

end Main;
