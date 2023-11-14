TEAM MEMBERS DETAILS::
semester : 3rd sem B.Tech. CSE
section : S1
Member 1: Abhinaya Siripurapu , 221CS102 ,  abhinyasiripurapu.221cs102@nitk.edu.in
Member 2: Ganta Rahul , 221CS122 , gantarahul.221cs122@nitk.edu.in



ABSTRACT::
AGRI RAIN ALARM SYSTEM


Water is a basic need in every one’s life. Saving water and proper usage of water is very 
important. In this project we are proposing an alarm when there is rain, so that we can make 
some actions for rain water harvesting and also save the rain water for using it later. 
We use rain sensor for detection of the rain. It act as a simple switch, where the switch is 
normally open and when there is rain, the switch closes . The rain water sensor is connected to 
the circuit and voltage should be passed through the wires.
If there is no rain, the resistance between the contacts will be very high as there will be no 
conduction between the wires in the sensor. If there is rain, the water drops will fall on the rain 
sensor, which will form a conductive path between the wires and it also decreases the resistance 
between the contacts. This action activates the IC and a led is setup to glow
Some of the applications of this rain alert alarm are: 
Irrigation field 
Home Automation 
Communication Automobiles 
Casual household chores

APPROACH TOWARDS APPLICATION:
We started with a rain alert alarm and found it very useful in many real life applications and 
innovated the project completely towards a application: IRRIGATION FIELD.
So we’ll be providing a drip irrigation switch which will get deactivated when rain is detected.

BRIEF DESCRIPTION:
Our project is to design a rain alert alarm which is provided in the point of view of approach 
towards an application: IRRIGATION FIELD. Leveraging the capabilities of a rain sensor,  LEDs, and a drip irrigation switch, the system aims to 
detect rain and initiate actions such as visual alerts, as well as control over irrigation 
systems. This project serves as a practical, cost-effective solution for individuals seeking to 
automate their irrigation processes and enhance environmental responsiveness.
the moisture sensor which is implemented in the project displays the amount of moisture that is need by the soil to be perfectly irrigated

Objectives 
1. Rain Detection:
• Develop a reliable rain detection mechanism using a rain sensor.
• Utilize the rain sensor output to serve as the primary trigger for the system.
2. Alert System:
• Implement a visual indicator using an LED to display the rain detection status.
3. Soil Moisture Sensor:
• Displays the amount of water need by the soil .
• Helps the agriculturers in specifically knowing the soil moisture content
4. Simple and Accessible Design:
• Design the system without using a microcontroller, making it accessible to a 
broader audience with basic electronics skills.

Components and Circuit Design 
Rain Sensor 
The rain sensor serves as the project's primary input. It detects rain through its sensitive 
surface, generating a digital signal (1 for rain detected, 0 for no rain) based on environmental 
conditions.

LED Indicator 
The LED serves as a visual indicator of rain detection. When the rain sensor detects rain, the 
LED is illuminated, providing users with a clear visual cue.

Soil Moisture Sensor
The moisture sensor enables us to know the content of moisture in the soil and displays what amount of water is needed by the soil 

Applications 
The Rain Alert Alarm System finds application in:
• Home Gardens: Provides homeowners with a tool to optimize irrigation practices and 
conserve water.
• Agricultural Fields: Supports farmers in managing irrigation more efficiently.



WORKING:
• RS: Rain Sensor input (1 for rain detected, 0 for no rain).
• LED: State of the LED (1 for ON, 0 for OFF).
• Buzzer: State of the Buzzer (1 for ON, 0 for OFF).
 MS: MOISTURE SENSOR (INPUT 0 , output 9)
                     (input 1 , output 8)
                     (input 2 , output 7)
                      .
                      .
                      (input 9 , output 0)
• Irrigation Switch: State of the Irrigation Switch (1 for ON, 0 for OFF).
FUNCTIOALITY TABLE:
| RS | LED | Buzzer | Irrigation Switch |
|---- |------ |----------|-----------------------|
| 0 | 0 | 0 | 1 |
| 1 | 1 | 1 | 0 |
| 0 | 0 | 0 | 1 |
| 1 | 1 | 1 | 0 |
When there's no rain (RS=0), the LED and Buzzer should be OFF, and the Irrigation Switch 
should be ON (to allow irrigation).
When rain is detected (RS=1), the LED and Buzzer should be ON, and the Irrigation Switch 
should be OFF (to stop irrigation).
FLOW CHART:
+------------------------+
| Start |
| RS = 0 |
| LED = 0 |
| Buzzer = 0 |
| Irrigation = 1 |
 MS - input - 0 output - 9
      input - 1 output - 8
      input - 2 output - 7
      input - 3 output - 6
      input - 4 output - 5
      input - 5 output - 4
      input - 6 output - 3
      input - 7 output - 2
      input - 8 output - 1
      input - 9 output - 0
       
+-------------------------+
 |
 v
+-----------------------------------------+
| Read Rain Sensor (RS) |
| |
| RS == 1? |
+---------------------------------------+
 |
 v
+---------------------------------------------+
| RS == 1 (Rain Detected) |
| |
| LED = 1 |
| Buzzer = 1 |
| Irrigation = 0 |
 MS : output - error
+------------------------------------------+
 |
 v
+--------------------------------------+
| RS == 0 (No Rain) |
| |
| LED = 0 |
| Buzzer = 0 |
| Irrigation = 1 |
MS - input - 0 output - 9
      input - 1 output - 8
      input - 2 output - 7
      input - 3 output - 6
      input - 4 output - 5
      input - 5 output - 4
      input - 6 output - 3
      input - 7 output - 2
      input - 8 output - 1
      input - 9 output - 0

+--------------------------------------+
 |
 v
+-----------------------------+
| End |



VERILOG CODE::
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



TB
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
