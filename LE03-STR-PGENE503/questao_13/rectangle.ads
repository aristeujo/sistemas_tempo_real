package Rectangle is

   type Retangulo is private;

   function Get_Comprimento(R : Retangulo) return Float;
   function Get_Largura(R : Retangulo) return Float;

   procedure Set_Comprimento(R : in out Retangulo; Value : Float);
   procedure Set_Largura(R : in out Retangulo; Value : Float);

   function Perimetro(R : Retangulo) return Float;
   function Area(R : Retangulo) return Float;

   function Quadrado(R : Retangulo) return Boolean;

private

   type Retangulo is record
      Comprimento : Float := 1.0;
      Largura     : Float := 1.0;
   end record;

end Rectangle;
