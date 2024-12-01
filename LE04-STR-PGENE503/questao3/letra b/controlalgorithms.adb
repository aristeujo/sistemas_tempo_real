with DataTypes; use DataTypes;
package body ControlAlgorithms is
    procedure Calculate_Heating_Setpoint(TV: TemperatureValue; HP: out HeatingPosition) is
    begin
        -- Basic On Off Algorithm
        if TV < 245 then
            HP := On;
        else
            HP := Off;
        end if;
    end Calculate_Heating_Setpoint;
    
    procedure Calculate_Valve_Setpoint(PV: PressureValue; VP: out ValvePosition) is
    begin
        VP := ValvePosition(Float(ValvePosition'Last) - Float(ValvePosition'Last) * Float(PV) / Float(PressureValue'Last));
    end Calculate_Valve_Setpoint;
end ControlAlgorithms;