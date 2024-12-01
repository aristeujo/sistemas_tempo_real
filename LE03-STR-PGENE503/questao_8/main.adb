with Ada.Text_IO; use Ada.Text_IO;
with People_Types;

procedure Main is
   use People_Types;

   John : Man := (Birth => (Day => 15, Month => Feb, Year => 1990), Has_Beard => True);
   Jane : Woman := (Birth => (Day => 20, Month => May, Year => 1992), Breastfeeding_Children => 2);

begin
   Put_Line("Análise de John (Man):");
   Analyze_Person(John);
   New_Line;

   Put_Line("Análise de Jane (Woman):");
   Analyze_Person(Jane);
end Main;
