# TEMPERATURE CONTROLLED COOLING FAN FOR PROCESSORS
---

## OBJECTIVES

- To apply all concepts learned from the Feedback and Control System laboratory course
- To build the application temperature controlled cooling fan for processors


## MATERIALS

- Arduino Uno
- LM35
- Cooling Fan


## DESCRIPTION

Processor in computers tend to heat much when under excessive operations. That is the reason why a block of heat sink along with a powerful cooling fan is usually supplied. However, when the processor operated minimally and almost at its idle state, the fan will continue to blow at its maximum rating which can be cost efficient. Thus, a temperature controlled cooling fan can be a good substitute to allow efficiency especially when the operating temperature of the processor is not on a critical level.
This device monitors the current operating temperature of the processor using LM35 to read the temperature as an input. The data will process using a Closed Loop Analog Control system program in Arduino microcontroller. This system determines how strong the actuator, in this case the cooling fan, should operate.


## BLOCK DIAGRAM

![alt text][Block Diagram]


## PICTURE OF PROTOTYPE

![alt text][GUI]


![alt text][Prototype]


## INSTRUCTIONS

1. Upload the PIDFAN.ino sketch file to the microcontroller.
2. Run the ControlsGUI.m in Matlab.
3. In the new window named ControlsGUI, enter the desired temperature and click "Apply Temperature" button.


## NOTES

- The arduino sketch uploaded to the microcontroller does all the computing, the purpose of the matlab GUI is to accept set temperature from the user and display current temperature of the heatsink.
- The Cooling Fan must be PWM-capable.



[Block Diagram]: https://github.com/tanpatrickf/PID-Cooling-Fan/blob/main/Images/Block%20Diagram.png "Block Diagram"
[GUI]: https://github.com/tanpatrickf/PID-Cooling-Fan/blob/main/Images/Matlab%20GUI.png "GUI"
[Prototype]: https://github.com/tanpatrickf/PID-Cooling-Fan/blob/main/Images/Protoype%20Picture.jpg "Prototype"
