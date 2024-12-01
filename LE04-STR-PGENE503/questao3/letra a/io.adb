with Ada.Text_IO, Ada.Integer_Text_IO; use Ada.Text_IO, Ada.Integer_Text_IO;
with DataTypes; use DataTypes;
package body IO is
    procedure Read_Temp(TV: out TemperatureValue) is
        sim_reading: Integer;
    begin
        Put_Line("Simulate a temperature reading: ");
        Ada.Integer_Text_IO.Get(sim_reading);
        TV := TemperatureValue(sim_reading);
    end Read_Temp;

    procedure Read_Pressure(PV: out PressureValue) is
        sim_reading: Integer;
    begin
        Put_Line("Simulate a pressure reading: ");
        Ada.Integer_Text_IO.Get(sim_reading);
        PV := PressureValue(sim_reading);
    end Read_Pressure;

    procedure Set_Heating(HP: HeatingPosition) is
    begin
        Put_line("Setting Heating Position as " & HeatingPosition'image(HP));
    end Set_Heating;

    procedure Set_Valve(VP: ValvePosition) is
    begin
        Put_line("Setting Valve Position as " & ValvePosition'image(VP));
    end Set_Valve;

    procedure Show_Temp(TV: TemperatureValue) is
    begin
        Put_line("Display Temperature: " & TemperatureValue'image(TV));
    end Show_Temp;

    procedure Show_Pressure(PV: PressureValue) is
    begin
        Put_line("Display Pressure: " & PressureValue'image(PV));
    end Show_Pressure;
end IO;