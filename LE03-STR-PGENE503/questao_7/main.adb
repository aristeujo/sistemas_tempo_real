with Ada.Text_IO; use Ada.Text_IO;

procedure Main is

   type Month_Name is (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);

   type Date is
      record
         Day   : Integer range 1 .. 31;
         Month : Month_Name;
         Year  : Integer;
      end record;

   type Person is abstract tagged record
      Birth : Date;
   end record;

   type Man is new Person with record
      Has_Beard : Boolean := True;
   end record;

   type Woman is new Person with record
      Breastfeeding_Children : Integer := 0;
   end record;

   John : Man := (Birth => (Day => 15, Month => Feb, Year => 1990), Has_Beard => True);

   Jane : Woman := (Birth => (Day => 20, Month => May, Year => 1992), Breastfeeding_Children => 2);

begin
   Put_Line("Informações sobre o homem:");
   Put_Line("Data de nascimento: " & Integer'Image(John.Birth.Day) & "-" &
            Month_Name'Image(John.Birth.Month) & "-" &
            Integer'Image(John.Birth.Year));
   Put_Line("Possui barba? " & Boolean'Image(John.Has_Beard));

   New_Line;

   Put_Line("Informações sobre a mulher:");
   Put_Line("Data de nascimento: " & Integer'Image(Jane.Birth.Day) & "-" &
            Month_Name'Image(Jane.Birth.Month) & "-" &
            Integer'Image(Jane.Birth.Year));
   Put_Line("Número de filhos amamentados: " & Integer'Image(Jane.Breastfeeding_Children));

end Main;
