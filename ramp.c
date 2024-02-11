#define RAMP_DOWN

#define RESOLUTION 12
#define MAX_LEVEL ((1<<RESOLUTION) - 1)

#define NOP_DELAY 21


void setup() {
  analogWriteResolution(RESOLUTION);
}

void loop() {
  for (int i=0; i<MAX_LEVEL; i++){
    #ifdef RAMP_DOWN  
      analogWrite(DAC, MAX_LEVEL-i);
    #else  
      analogWrite(DAC, i);
    #endif 
    // volatile int wasteTime = 0;
    for (int t=0; t<NOP_DELAY; t++){
      // wasteTime++;
        __asm__("nop\n\t");
    }
    // wasteTime = wasteTime + i;
    // delayMicroseconds(1);
  }
// analogWrite(DAC, 1023);

}
