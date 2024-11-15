with Ada.Text_IO; use Ada.Text_IO;

package body People_Types is

   overriding procedure Print_Details(M : in Man) is
   begin
      Put_Line("Data de nascimento: " & Integer'Image(M.Birth.Day) & "-" &
               Month_Name'Image(M.Birth.Month) & "-" &
               Integer'Image(M.Birth.Year));
      Put_Line("Possui barba? " & Boolean'Image(M.Has_Beard));
   end Print_Details;

   overriding procedure Print_Details(W : in Woman) is
   begin
      Put_Line("Data de nascimento: " & Integer'Image(W.Birth.Day) & "-" &
               Month_Name'Image(W.Birth.Month) & "-" &
               Integer'Image(W.Birth.Year));
      Put_Line("Número de filhos amamentados: " & Integer'Image(W.Breastfeeding_Children));
   end Print_Details;

   procedure Analyze_Person(P : in Person'Class) is
   begin
      Print_Details(P);  -- Chama o Print_Details apropriado (de Man ou Woman)
   end Analyze_Person;

end People_Types;
