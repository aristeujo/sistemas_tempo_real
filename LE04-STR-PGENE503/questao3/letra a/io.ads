with DataTypes; use DataTypes;
package IO is
    procedure Read_Temp(TV: out TemperatureValue);
    procedure Read_Pressure(PV: out PressureValue);
    procedure Set_Heating(HP: HeatingPosition);
    procedure Set_Valve(VP: ValvePosition);
    procedure Show_Temp(TV: TemperatureValue);
    procedure Show_Pressure(PV: PressureValue);
end IO;