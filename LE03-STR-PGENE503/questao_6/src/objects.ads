package Objects is
   type Object is abstract tagged record
      X_Coord : Float;
      Y_Coord : Float;
   end record;

   function Distance(O: Object) return Float is abstract;
   function Area(O: Object) return Float is abstract;

   procedure Print_Area(O: Object'Class);
end Objects;
