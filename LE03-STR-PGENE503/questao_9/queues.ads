package Queues is

   type Queue_Element is new Integer;
   type Queue is private;

   procedure Enqueue(Q : in out Queue; Elem : in Queue_Element);
   procedure Dequeue(Q : in out Queue; Elem : out Queue_Element);
   function Is_Empty(Q : in Queue) return Boolean;

private

   type Node;
   type Node_Ptr is access Node;
   type Node is record
      Value : Queue_Element;
      Next  : Node_Ptr;
   end record;

   type Queue is record
      Head : Node_Ptr := null;
      Tail : Node_Ptr := null;
   end record;

end Queues;
