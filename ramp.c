// #define RAMP_DOWN

void setup() {
  analogWriteResolution(12);
  // pinMode(DAC, OUTPUT);
}

void loop() {
  for (int i=0; i<4095; i++){
    #ifdef RAMP_DOWN  
      analogWrite(DAC, 4095-i);
    #else  
      analogWrite(DAC, i);
    #endif 

    // volatile int wasteTime = 0;
    for (int t=0; t<23; t++){
      // wasteTime++;
        __asm__("nop\n\t");
    }
    // wasteTime = wasteTime + i;
    // delayMicroseconds(1);
  }
// analogWrite(DAC, 1023);

}
