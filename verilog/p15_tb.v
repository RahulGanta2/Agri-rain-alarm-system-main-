`timescale 1ns / 1ps
`include"p15.v"
module RainAlert_tb;
reg rain_sensor;
wire led, buzzer, irrigation_switch;
RainAlert uut (
    .rain_sensor(rain_sensor),
    .led(led),
    .buzzer(buzzer),
    .irrigation_switch(irrigation_switch)
);
initial begin
    $dumpfile("p15_tb.vcd");
    $dumpvars(0,RainAlert_tb);
    $monitor(" rain_sensor=%b led=%b buzzer=%b irrigation_switch=%b", rain_sensor, led, buzzer, irrigation_switch);
    rain_sensor = 0;
    #20;
    rain_sensor = 1;
    #20;
    rain_sensor = 0;
    #20;
    $finish;
end

endmodule