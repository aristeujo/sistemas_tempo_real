with Ada.Text_IO; use Ada.Text_IO;
with Objects;
with Geometry;

procedure Main is
   C : Geometry.Circle := (X_Coord => 0.0, Y_Coord => 0.0, Radius => 5.0);
   R : Geometry.Rectangle := (X_Coord => 0.0, Y_Coord => 0.0, Width => 4.0, Height => 6.0);
begin
   Objects.Print_Area(C);
   Objects.Print_Area(R);
end Main;
