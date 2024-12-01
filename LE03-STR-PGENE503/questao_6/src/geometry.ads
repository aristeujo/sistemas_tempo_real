with Objects;

package Geometry is
   type Circle is new Objects.Object with record
      Radius : Float;
   end record;

   type Rectangle is new Objects.Object with record
      Width  : Float;
      Height : Float;
   end record;

   overriding function Area(C: Circle) return Float;
   overriding function Area(R: Rectangle) return Float;
   overriding function Distance(C: Circle) return Float;
   overriding function Distance(R: Rectangle) return Float;

end Geometry;
