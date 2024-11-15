with Ada.Unchecked_Deallocation;

package body Queues is

   procedure Free is new Ada.Unchecked_Deallocation(Object => Node, Name => Node_Ptr);

   procedure Enqueue(Q : in out Queue; Elem : in Queue_Element) is
      New_Node : Node_Ptr := new Node'(Value => Elem, Next => null);
   begin
      if Q.Tail = null then
         Q.Head := New_Node;
         Q.Tail := New_Node;
      else
         Q.Tail.Next := New_Node;
         Q.Tail := New_Node;
      end if;
   end Enqueue;

   procedure Dequeue(Q : in out Queue; Elem : out Queue_Element) is
   begin
      if Q.Head = null then
         raise Program_Error with "Cannot dequeue from an empty queue";
      else
         Elem := Q.Head.Value;
         declare
            Temp : Node_Ptr := Q.Head;
         begin
            Q.Head := Q.Head.Next;
            if Q.Head = null then
               Q.Tail := null;
            end if;
            Free(Temp);
         end;
      end if;
   end Dequeue;

   function Is_Empty(Q : in Queue) return Boolean is
   begin
      return Q.Head = null;
   end Is_Empty;

end Queues;
