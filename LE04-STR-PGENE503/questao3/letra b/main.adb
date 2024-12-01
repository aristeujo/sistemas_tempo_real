with DataTypes; use DataTypes;
with IO; use IO;
with ControlAlgorithms; use ControlAlgorithms;

procedure Main is

   -- Objeto protegido para sincronização e compartilhamento de dados
   protected Shared_Data is
      procedure Write_Temperature(Value : TemperatureValue);
      procedure Write_Pressure(Value : PressureValue);
      function Read_Temperature return TemperatureValue;
      function Read_Pressure return PressureValue;
   private
      Temperature : TemperatureValue := 10; -- Valor mínimo válido
      Pressure : PressureValue := 0;        -- Valor mínimo válido
   end Shared_Data;

   protected body Shared_Data is
      procedure Write_Temperature(Value : TemperatureValue) is
      begin
         if Value in TemperatureValue then
            Temperature := Value;
         else
            Temperature := 10; -- Ajusta ao valor mínimo se estiver fora do intervalo
         end if;
      end Write_Temperature;

      procedure Write_Pressure(Value : PressureValue) is
      begin
         if Value in PressureValue then
            Pressure := Value;
         else
            Pressure := 0; -- Ajusta ao valor mínimo se estiver fora do intervalo
         end if;
      end Write_Pressure;

      function Read_Temperature return TemperatureValue is
      begin
         return Temperature;
      end Read_Temperature;

      function Read_Pressure return PressureValue is
      begin
         return Pressure;
      end Read_Pressure;
   end Shared_Data;

   -- Tarefa para controle de temperatura
   task Temperature_Controller is
   end Temperature_Controller;

   task body Temperature_Controller is
      Current_Temp : TemperatureValue;
      Heating_Pos : HeatingPosition;
   begin
      loop
         -- Leitura e cálculo
         Read_Temp(Current_Temp);
         if Current_Temp in TemperatureValue then
            Calculate_Heating_Setpoint(Current_Temp, Heating_Pos);
            Set_Heating(Heating_Pos);
            Shared_Data.Write_Temperature(Current_Temp);
         else
            Shared_Data.Write_Temperature(10); -- Ajusta ao valor mínimo
         end if;

         -- Atraso para próxima leitura
         delay 1.0;
      end loop;
   end Temperature_Controller;

   -- Tarefa para controle de pressão
   task Pressure_Controller is
   end Pressure_Controller;

   task body Pressure_Controller is
      Current_Pressure : PressureValue;
      Valve_Pos : ValvePosition;
   begin
      loop
         -- Leitura e cálculo
         Read_Pressure(Current_Pressure);
         if Current_Pressure in PressureValue then
            Calculate_Valve_Setpoint(Current_Pressure, Valve_Pos);
            Set_Valve(Valve_Pos);
            Shared_Data.Write_Pressure(Current_Pressure);
         else
            Shared_Data.Write_Pressure(0); -- Ajusta ao valor mínimo
         end if;

         -- Atraso para próxima leitura
         delay 1.0;
      end loop;
   end Pressure_Controller;

   -- Tarefa para exibição dos dados no display
   task Display_Controller is
   end Display_Controller;

   task body Display_Controller is
      Display_Temp : TemperatureValue;
      Display_Pressure : PressureValue;
   begin
      loop
         Display_Temp := Shared_Data.Read_Temperature;
         Display_Pressure := Shared_Data.Read_Pressure;

         Show_Temp(Display_Temp);
         Show_Pressure(Display_Pressure);

         delay 1.0;
      end loop;
   end Display_Controller;

begin
   null;
end Main;
