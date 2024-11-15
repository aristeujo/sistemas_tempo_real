generic
   type Stack_Element is private;
package Generic_Stacks is

   type Stack is private;

   procedure Push(S : in out Stack; Elem : in Stack_Element);
   procedure Pop(S : in out Stack; Elem : out Stack_Element);
   function Is_Empty(S : in Stack) return Boolean;

private

   type Node;
   type Node_Ptr is access Node;
   type Node is record
      Value : Stack_Element;
      Next  : Node_Ptr;
   end record;

   type Stack is record
      Top : Node_Ptr := null;
   end record;

end Generic_Stacks;
