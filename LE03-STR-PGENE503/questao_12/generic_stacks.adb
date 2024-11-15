with Ada.Unchecked_Deallocation;

package body Generic_Stacks is

   procedure Free is new Ada.Unchecked_Deallocation(Object => Node, Name => Node_Ptr);

   procedure Push(S : in out Stack; Elem : in Stack_Element) is
      New_Node : Node_Ptr := new Node'(Value => Elem, Next => S.Top);
   begin
      S.Top := New_Node;
   end Push;

   procedure Pop(S : in out Stack; Elem : out Stack_Element) is
   begin
      if S.Top = null then
         raise Program_Error with "Cannot pop from an empty stack";
      else
         Elem := S.Top.Value;
         declare
            Temp : Node_Ptr := S.Top;
         begin
            S.Top := S.Top.Next;
            Free(Temp);
         end;
      end if;
   end Pop;

   function Is_Empty(S : in Stack) return Boolean is
   begin
      return S.Top = null;
   end Is_Empty;

end Generic_Stacks;
