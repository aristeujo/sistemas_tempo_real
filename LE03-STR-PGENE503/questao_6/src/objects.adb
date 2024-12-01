with Ada.Text_IO; use Ada.Text_IO;

package body Objects is

   procedure Print_Area(O: Object'Class) is
   begin
      Put_Line("A área do objeto é: " & Float'Image(Area(O)));
   end Print_Area;

end Objects;
