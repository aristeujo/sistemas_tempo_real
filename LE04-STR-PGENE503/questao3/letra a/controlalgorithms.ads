with DataTypes; use DataTypes;
package ControlAlgorithms is
    procedure Calculate_Heating_Setpoint(TV: TemperatureValue; HP: out HeatingPosition);
    procedure Calculate_Valve_Setpoint(PV: PressureValue; VP: out ValvePosition);
end ControlAlgorithms;