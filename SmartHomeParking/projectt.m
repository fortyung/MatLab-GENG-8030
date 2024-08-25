clear;
clc;

% Initialization of code
HIGH_SIGNAL = 1;
LOW_SIGNAL = 0;
GATE_OPEN = 0.5;
GATE_CLOSED = 0;
MAX_SLOTS = 13; % total number of empty slots are 13
MOTOR_DELAY = 3; % Time for the servo motor to hold its state

a = arduino('/dev/cu.usbmodem21301', 'Uno', 'Libraries',{'Servo','ExampleLCD/LCDAddon'},'ForceBuild',true);


% Initialization of Arduino
lcdsetup = addon(a,'ExampleLCD/LCDAddon','RegisterSelectPin','D7','EnablePin','D6','DataPins',{'D5','D4','D3','D2'}); % Configuration of LCD display
initializeLCD(lcdsetup); % lcd initialization
configurePin(a,'D8','DigitalOutput'); % Configuration of Green LED
configurePin(a,'D11','DigitalOutput'); % Configuration of Red LED
configurePin(a, 'D12', 'DigitalInput'); % Entry Button
configurePin(a, 'D13', 'DigitalInput'); % Exit Button
configurePin(a, 'D9', 'Servo'); % Declaring Servo motor in D9 pin
gateservo = servo(a, 'D9'); % Initialize servo motor
writePosition(gateservo,GATE_CLOSED); % Initial Position gate closed

writeDigitalPin(a,'D11',HIGH_SIGNAL); % Red LED on

slotsAvailable = MAX_SLOTS;
printLCD(lcdsetup,strcat('Available:',num2str(slotsAvailable))); % Displaying number of available slots
printLCD(lcdsetup,'Welcome!!!'); % Displaying Welcome message on LCD

while(1)
    if readDigitalPin(a, 'D12') == HIGH_SIGNAL % When entry button is pressed
        if slotsAvailable > 0 % If slots are available 

            slotsAvailable = slotsAvailable - 1;
            writePosition(gateservo,GATE_OPEN); % open gate
            writeDigitalPin(a,'D8',HIGH_SIGNAL); % green Light ON
            writeDigitalPin(a,'D11',LOW_SIGNAL); % red Light OFF
            pause(MOTOR_DELAY); % Servo motor delay Action Timing
            writePosition(gateservo,GATE_CLOSED); % close gate
            writeDigitalPin(a,'D8',LOW_SIGNAL); % green Light OFF
            writeDigitalPin(a,'D11',HIGH_SIGNAL); % red Light ON
            
            if slotsAvailable > 0 % Updates the LCD if slots are available
                clearLCD(lcdsetup);
                printLCD(lcdsetup,strcat('Available:',num2str(slotsAvailable)));
                printLCD(lcdsetup,'Welcome!!!');
            else
                clearLCD(lcdsetup);
                printLCD(lcdsetup,strcat('Available:',num2str(slotsAvailable))); % Updates the LCD if slots are  not available
                printLCD(lcdsetup,'Plz come later.'); % Plz Come Later message on LCD
            end
        end
    end
    
    if readDigitalPin(a,'D13') == HIGH_SIGNAL % When exit button is pressed
        if slotsAvailable < MAX_SLOTS
            slotsAvailable = slotsAvailable + 1;
            clearLCD(lcdsetup);
            printLCD(lcdsetup,strcat('Available:',num2str(slotsAvailable)));
            printLCD(lcdsetup,'Good Bye!!!');
            writePosition(gateservo,GATE_OPEN);% open gate
            writeDigitalPin(a,'D8',HIGH_SIGNAL); % green Light ON
            writeDigitalPin(a,'D11',LOW_SIGNAL); % red Light OFF
            pause(MOTOR_DELAY); % Servo motor 3 second delay Action Timing
            writePosition(gateservo,GATE_CLOSED); % gate close
            writeDigitalPin(a,'D8',LOW_SIGNAL); % green Light OFF
            writeDigitalPin(a,'D11',HIGH_SIGNAL); % red Light ON
            
            clearLCD(lcdsetup);
            printLCD(lcdsetup,strcat('Available:',num2str(slotsAvailable)));
            printLCD(lcdsetup,'Welcome!!!');
        end
    end
end

% End of Code
