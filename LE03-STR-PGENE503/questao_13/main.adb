with Ada.Text_IO; use Ada.Text_IO;
with Rectangle;

procedure Main is
   R : Rectangle.Retangulo;
begin
   Put_Line("Valores iniciais:");
   Put_Line("Comprimento: " & Float'Image(Rectangle.Get_Comprimento(R)));
   Put_Line("Largura: " & Float'Image(Rectangle.Get_Largura(R)));
   
   Put_Line("Definindo novos valores para o retângulo.");
   Rectangle.Set_Comprimento(R, 15.0);
   Rectangle.Set_Largura(R, 10.0);
   
   Put_Line("Novos valores:");
   Put_Line("Comprimento: " & Float'Image(Rectangle.Get_Comprimento(R)));
   Put_Line("Largura: " & Float'Image(Rectangle.Get_Largura(R)));
   
   Put_Line("Perímetro: " & Float'Image(Rectangle.Perimetro(R)));
   Put_Line("Área: " & Float'Image(Rectangle.Area(R)));

   if Rectangle.Quadrado(R) then
      Put_Line("O retângulo é um quadrado.");
   else
      Put_Line("O retângulo não é um quadrado.");
   end if;
end Main;
