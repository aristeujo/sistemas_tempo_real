with DataTypes; use DataTypes;
with IO; use IO;
with ControlAlgorithms; use ControlAlgorithms;

procedure Main is
   Current_Temp : TemperatureValue;
   Current_Pressure : PressureValue;
   Heating_Pos : HeatingPosition;
   Valve_Pos : ValvePosition;
begin
   -- Loop principal
   loop
      -- Leitura dos valores
      Read_Temp(Current_Temp);
      Read_Pressure(Current_Pressure);

      -- Cálculo dos setpoints
      Calculate_Heating_Setpoint(Current_Temp, Heating_Pos);
      Calculate_Valve_Setpoint(Current_Pressure, Valve_Pos);

      -- Controle dos atuadores
      Set_Heating(Heating_Pos);
      Set_Valve(Valve_Pos);

      -- Exibição dos valores no display
      Show_Temp(Current_Temp);
      Show_Pressure(Current_Pressure);

      -- Simula um atraso para leitura periódica
      delay 1.0;
   end loop;
end Main;
