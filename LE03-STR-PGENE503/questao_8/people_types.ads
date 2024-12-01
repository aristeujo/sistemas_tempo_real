package People_Types is

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

   procedure Print_Details(P : in Person) is abstract;

   type Man is new Person with record
      Has_Beard : Boolean := True;
   end record;

   overriding procedure Print_Details(M : in Man);

   type Woman is new Person with record
      Breastfeeding_Children : Integer := 0;
   end record;

   overriding procedure Print_Details(W : in Woman);

   procedure Analyze_Person(P : in Person'Class);

end People_Types;
