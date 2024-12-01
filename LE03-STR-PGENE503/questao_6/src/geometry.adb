with Ada.Numerics.Elementary_Functions;

package body Geometry is

   overriding function Area(C: Circle) return Float is
   begin
      return Ada.Numerics.Pi * C.Radius * C.Radius;
   end Area;

   overriding function Area(R: Rectangle) return Float is
   begin
      return R.Width * R.Height;
   end Area;

   overriding function Distance(C: Circle) return Float is
   begin
      return Ada.Numerics.Elementary_Functions.Sqrt(C.X_Coord ** 2 + C.Y_Coord ** 2);
   end Distance;

   overriding function Distance(R: Rectangle) return Float is
   begin
      return Ada.Numerics.Elementary_Functions.Sqrt(R.X_Coord ** 2 + R.Y_Coord ** 2);
   end Distance;

end Geometry;
