module RainAlert(rain_sensor,led,buzzer,irrigation_switch);
input wire rain_sensor;
output reg led,irrigation_switch;
output buzzer;

always @(rain_sensor) begin
    // Assuming rain_sensor is a simple digital signal (1 for rain, 0 for no rain)
    if (rain_sensor) begin
        led = rain_sensor ; // Turn on LED when rain is detected
        irrigation_switch = ~rain_sensor; 
       // Turn off irrigation switch when rain is detected
    end
       else begin
        led = rain_sensor ;
        irrigation_switch = ~rain_sensor;
    end 
    end
assign buzzer =rain_sensor;// Turn on buzzer when rain is detected
endmodule