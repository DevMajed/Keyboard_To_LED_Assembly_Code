# Keyboard to LED 

In this code, 4x4 keypad is used in order to control the tri-color LED.\ 
Pushing each of the buttons 0-7 should light the LED with the color specified below.\
When the button is released, the LED should remain lit.\
Pressing any of the other buttons (9,A,B,C,D,*,#) should not affect the LED.\

0:Black, 1:Blue, 2:Green, 3:Cyan, 4:Red, 5:Magenta, 6:Yellow, 7: White\


<img width="735" alt="Screen Shot 2020-06-02 at 8 12 32 PM" src="https://user-images.githubusercontent.com/57555013/83581650-6e2fb680-a50d-11ea-88a5-1b197fd74a09.png">

Here is the steps to scan the keyboard and detect keypresses:
One time - Set all the bits connected to C3:C0 as inputs; set pull ups. Set all bits connected to R3:R0 as outputs
Loop (all values below in binary)
1. R3:R0 = 0111; Read C3:C0; based on value of C3:C0, keypress as follows:
0111=‘1’ 1011=‘2’ 1101=‘3’ 1110=‘A’ 1111=none
2. R3:R0 = 1011; Read C3:C0; based on value of C3:C0, keypress as follows:
0111=‘4’ 1011=‘5’ 1101=‘6’ 1110=‘B’ 1111=none
3. R3:R0 = 1101; Read C3:C0; based on value of C3:C0, keypress as follows:
0111=‘7’ 1011=‘8’ 1101=‘9’ 1110=‘C’ 1111=none
4. R3:R0 = 1110; Read C3:C0; based on value of C3:C0, keypress as follows:
0111=‘*’ 1011=‘0’ 1101=‘#’ 1110=‘D’ 1111=none
It is possible to read a value other than 0111,1011,1101,1110 if multiple keys are pressed simultaneously. we will ignore this condition

How LEDs are connected\
<img width="842" alt="83532739-aeb31400-a4bc-11ea-9ded-11b40f241c62" src="https://user-images.githubusercontent.com/57555013/83582063-7a684380-a50e-11ea-9fe8-522bc9e6a035.png">

overall schematic of the device\
<img width="642" alt="83532258-000ed380-a4bc-11ea-8707-141c4d26cf9b" src="https://user-images.githubusercontent.com/57555013/83582098-966be500-a50e-11ea-9049-693e32af8ab6.png">
