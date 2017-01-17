//
//  ArduinoPEFBluetooth.c
//  Pulmonis
//
//  Created by Manivannan Solan on 17/01/2017.
//  Copyright © 2017 Manivannan Solan. All rights reserved.
//

/* UNCOMMENT CODE BELOW, AND RUN IN ARDUINO IDE
#include <SPI.h>

#include <EEPROM.h>

#include <boards.h>

#include <RBL_nRF8001.h>




const int analogInPin = A1; // Analog input pin, connected to pressure sensor



//Variables to change

float inputVolt = 0; // Voltage read from pressure sensor (in bits, 0 to 1023)



float volt = 0; // Voltage (converted from 0-255 to 0-5)



float pressure_psi = 0; // Pressure value calculated from voltage, in psi



float pressure_pa = 0; // Pressure converted to Pa



float massFlow = 0; // Mass flow rate calculated from pressure



float volFlow = 0; // Calculated from mass flow rate



bool startedMeasuring = 0;



//inputVolt fluctuates between 37 and 38 at equilibrium

float inputVoltLowerThreshold = 40;





//Constants

float vs = 5 ; // Voltage powering pressure sensor



float rho = 1.225; // Density of air in kg/m3



float pi = 3.14159265359;



float diameter1 = 0.04; // Diameter of first tube in m



float diameter2 = 0.017; // Diameter of second tube in m



float area_1 = pi*pow((diameter1/2),2); // Surface area in m2



float area_2 = pi*pow((diameter2/2),2); // Surface area in m2



float interval = 0.02;



int delay_ms = 1000*interval;



int delay_ble_write = 0;



int breath_value_count = 0;

float breath_values[100];



// pressure difference at equilibrium

float pressure_error_pa = 425.7626342773437500;



void setup() {
    ble_begin();
    
    Serial.begin(9600);
}



void updateVolFlow() {
    
    inputVolt = analogRead(analogInPin);
    
    volt = inputVolt*(vs/1023.0);
    
    pressure_pa = ((((volt/vs) - 0.04)/0.009)*1000) + pressure_error_pa;
    
    massFlow = 1000*sqrt((abs(pressure_pa)*2*rho)/((1/(pow(area_2,2)))-(1/(pow(area_1,2)))));
    
    volFlow = massFlow/rho;
    
}



void measurePEF() {
    
    int numMeasurements = 0;
    
    uint32_t maxVolFlow = 0;
    
    while (true) {
        
        inputVolt = analogRead(analogInPin);
        
        if (startedMeasuring && inputVolt < inputVoltLowerThreshold) {
            
            startedMeasuring = 0;
            
            Serial.print("Breath value count ");
            
            Serial.println(breath_value_count);
            
            for (int i = 0; i < breath_value_count; i++) {
                
                Serial.println(breath_values[i]);
                
                ble_do_events();
                
                ble_write_bytes((byte*)&breath_values[i], 4);
                
                ble_do_events();
                
                if (!delay_ble_write) {
                    
                    delay(500);
                    
                    delay_ble_write = 1;
                    
                }
                
            }
            
            ble_write_bytes((byte)999, 1);
            
            ble_do_events();
            
            breath_value_count = 0;
            
            numMeasurements++;
            
            if (numMeasurements == 3) {
                
                Serial.print("Peak Flow: ");
                
                Serial.println(maxVolFlow);
                
                break;
                
            }
            
        } else if (startedMeasuring || (!startedMeasuring && inputVolt > inputVoltLowerThreshold)) {
            
            startedMeasuring = 1;
            
            updateVolFlow();
            
            if (volFlow > maxVolFlow) {
                
                maxVolFlow = volFlow;
                
            }
            
            breath_values[breath_value_count] = volFlow;
            
            breath_value_count++;
            
            
            Serial.print("volFlow: ");
            
            Serial.println(volFlow);
            
            
            
            delay(delay_ms);
            
        }
        
    }
    
}

void loop() {
    while(!ble_connected()) {
        ble_do_events();
    }
    Serial.println("done ble_do_events");
    measurePEF();
}
*/
