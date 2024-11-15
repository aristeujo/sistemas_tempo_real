package body Rectangle is

   function Get_Comprimento(R : Retangulo) return Float is
   begin
      return R.Comprimento;
   end Get_Comprimento;

   function Get_Largura(R : Retangulo) return Float is
   begin
      return R.Largura;
   end Get_Largura;

   procedure Set_Comprimento(R : in out Retangulo; Value : Float) is
   begin
      if Value <= 0.0 or else Value > 20.0 then
         raise Constraint_Error with "Comprimento deve estar entre 0.0 e 20.0";
      elsif Value < R.Largura then
         raise Constraint_Error with "Comprimento deve ser maior ou igual à largura";
      else
         R.Comprimento := Value;
      end if;
   end Set_Comprimento;

   procedure Set_Largura(R : in out Retangulo; Value : Float) is
   begin
      if Value <= 0.0 or else Value > 20.0 then
         raise Constraint_Error with "Largura deve estar entre 0.0 e 20.0";
      elsif Value > R.Comprimento then
         raise Constraint_Error with "Largura deve ser menor ou igual ao comprimento";
      else
         R.Largura := Value;
      end if;
   end Set_Largura;

   function Perimetro(R : Retangulo) return Float is
   begin
      return 2.0 * (R.Comprimento + R.Largura);
   end Perimetro;

   function Area(R : Retangulo) return Float is
   begin
      return R.Comprimento * R.Largura;
   end Area;

   function Quadrado(R : Retangulo) return Boolean is
   begin
      return R.Comprimento = R.Largura;
   end Quadrado;

end Rectangle;
