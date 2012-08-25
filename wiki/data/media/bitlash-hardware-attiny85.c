/*
	bitlash-hardware-attiny85.c: Hardware Core for ATTiny85 MCU
	
	The author can be reached at: bill@bitlash.net

	Copyright (C) 2008, 2009, 2010 Bill Roy

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
*/
#include "bitlash.h"

// This file is included by src/bitlash-hardware.c

#if !defined(__AVR_ATtiny85__)
	??? Did you intend to be compiling the Tiny85 version ??? 
#endif

/******

ATTiny85 Resource Usage

- Pin allocations

	// bitlbug-85
	#define PIN_SERIALRX	PIN_PB3
	#define PIN_SERIALTX	PIN_PB2
	#define PIN_PWM0		PIN_PB4		// OCR1B on A4
	#define PIN_PWM1		PIN_PB1		// OCR1A on A1

	TODO:
	(#define PIN_PWM2		PIN_PB0		// OCR0A) on A0

- Interrupts
	- Timer1 overflow interrupt is used for the 1ms millis() counter
	- Pin change interrupt is used for serial-rx and for wakeup from sleep()

- Timers
	- Timer1 is used for PWM in addition to millis()
	- TODO: Timer0 for PWM

*******/

// TODO: Move to bitlash-hardware-attiny85.h

// Pin Definitions
#define PIN_PB0	0
#define PIN_PB1	1
#define PIN_PB2	2
#define PIN_PB3	3
#define PIN_PB4 4
#define PIN_PB5 5

// Pin Assignments
#define PIN_SERIALRX	PIN_PB3
#define PIN_SERIALTX	PIN_PB2
#define PIN_PWM0		PIN_PB4
#define PIN_PWM1		PIN_PB1


// Serial receive buffer size
#define MAX_SOFT_RX_BUFF 16
#define SOFT_RX_BUFF_MASK 0xf



//////////////
//
//	init_hardware(): setup ports, timers, and other resources
//
void init_hardware(void) {

#if F_CPU == 8000000
	// Clear the CKDIV8 bit to select 8MHz clock
	// must be done with interrupts off
	 CLKPR = 1<<CLKPCE;
	 CLKPR = 0;
#else
	unsupported F_CPU
#endif

	////////////////////
	// ADC setup: set a2d clock prescale factor to be in [50..200] KHz range
	// we leave ADEN set to 0 to save power; it is enabled on the first analogRead()
	//
#if F_CPU == 1000000
	// 1 MHz / 8 = 125KHz so we want selector 011 for ADPS2..0
	ADCSRA = 0<<ADEN | 0<<ADPS2 | 1<<ADPS1 | 1<<ADPS0;

#elif F_CPU == 8000000
	// 8 MHz / 64 = 125 KHz, selector 110
	ADCSRA = 0<<ADEN | 1<<ADPS2 | 1<<ADPS1 | 0<<ADPS0;

#elif F_CPU == 16500000
	// 16 MHz / 128 = 125 KHz, selector 111
	ADCSRA = 0<<ADEN | 1<<ADPS2 | 1<<ADPS1 | 1<<ADPS0;

#else
	unsupported F_CPU
#endif

	// these defaults are ok so we don't need to set them
	//ACSR |= 1<<ACD;		// disable analog comparator; we don't use it
	//PRR = 0;			// default is ok
	//ADCSRB = 0;		// default is ok

	// init the counters	
	TCNT1 = OCR1A = OCR1B = OCR1C = 0;

#if F_CPU == 1000000
	// Enable PWM and CTC rollover
	// COM1A1..COM1A0 OC1A cleared on compare match, set on $00; ~OC1A not connected: selector is 10
	// [CS13..CS10] prescaler control bits: for F_CPU 1000000, 1000000/250000 = 4 selector = 0011
	TCCR1 = 0<<CTC1 | 0<<PWM1A | 0<<COM1A1 | 0<<COM1A0 | 0<<CS13 | 0<<CS12 | 1<<CS11 | 1<<CS10;
	GTCCR = 0<<TSM  | 0<<PWM1B | 0<<COM1B1 | 0<<COM1B0 | 0<<FOC1B | 0<<FOC1A | 0<<PSR1 | 0<<PSR0;
	
#elif F_CPU == 8000000
	// [CS13..CS10] prescaler control bits: for F_CPU 8000000 8000000/250000 = 32 selector = 0110
	TCCR1 = 0<<CTC1 | 0<<PWM1A | 0<<COM1A1 | 0<<COM1A0 | 0<<CS13 | 1<<CS12 | 1<<CS11 | 0<<CS10;
	GTCCR = 0<<TSM  | 0<<PWM1B | 0<<COM1B1 | 0<<COM1B0 | 0<<FOC1B | 0<<FOC1A | 0<<PSR1 | 0<<PSR0;
	
#else
		unsupported F_CPU
#endif

	// set up our overflow value
	OCR1C = 249;		// for 1 kHz
	
	// enable the timer overflow interrupt so time passes
	TIMSK |= 1<<TOIE1;

	sei();			// turn on interrupts and off we go
}


//////////////
//
// Timer1 overflow interrupt
//
// Timer1 happens to overflow conveniently at a 1ms rate so we hang millis() off it
//
volatile unsigned long timer1_millis;

ISR(SIG_OVERFLOW1) {
	timer1_millis++;
}

//////////////
//
// millis(): milliseconds since startup
//
unsigned long millis(void) {
unsigned long m;
uint8_t oldSREG = SREG;
	cli();
	m = timer1_millis;
	SREG = oldSREG;	
	return m;
}

//////////////
//
// delay(): spin away some time
//
void delay(unumvar ms) {
	unsigned long start = millis();
	while (millis() - start < ms) { 
		chkbreak();
	}
}


// Lite versions of arduino digital io
//
#define PINMASK 7

void pinMode(unumvar pin, unumvar mode) {
	byte mask = (1 << pin);
	if (mode) DDRB |= mask;
	else DDRB &= ~mask;
}

unumvar digitalRead(unumvar pin) {
	return ((PINB & (1 << pin)) != 0);
}

void digitalWrite(unumvar pin, unumvar value) {
	byte mask = (1 << pin);
	if (value) PORTB |= mask;
	else PORTB &= ~mask;
}


unumvar analogRead(unumvar pin) {

	// turn on the ADC if we're the first user
	if (!(ADCSRA & (1<<ADEN))) {
		ADCSRA |= 1<<ADEN;
		delay(1);
	}

	// place our order
	ADMUX = pin;

	// start the conversion
	ADCSRA |= (1 << ADSC);

	// ADSC is cleared when the conversion finishes
	while (ADCSRA & (1 << ADSC)) { ; }
	return ADC;
}


///////////////////
//
//	analogWrite: set PWM factor for specified pin
//
// PWM is enabled on first use
//
void analogWrite(unumvar pin, unumvar value) {
	if (pin == PIN_PWM0) {
		if (!(GTCCR & (1<<PWM1B))) {			// auto-init PWM on first use
			DDRB |= 1<<PIN_PWM0;
			GTCCR |= 1<<PWM1B | 1<<COM1B1;
		}
		OCR1B = value;
	}
	else if (pin == PIN_PWM1) {
		if (!(TCCR1 & (1<<PWM1A))) {
			TCCR1 |= 1<<PWM1A | 1<<COM1A1;
			DDRB |= 1<<PIN_PWM1;
		}
		OCR1A = value;
	}

	//
	// TODO: add timer0 setup for "PIN_PWM2", third pwm pin
	//
}



///////////////////////
// Sleep handling
//
// We sleep with the lights off to save power
//
// The Micrel regulators show quiescent leakage current of about 115 microamps (.115ma);
// it seems the same for both 5v and 3.3v parts.
//
// Thus we expect a 250 mah 9V battery to last 250/.115 = 2173 hours or ~12 weeks in sleep mode.
//
// 
void sleep(void) {
byte PCMSK_save;

	GIMSK |= 1<<PCIE;		// enable pin change interrupt
	PCMSK_save = PCMSK;		// save PCMSK
	
#if defined(FLUXY_PB)
	PCMSK |= 1<<PIN_PB;		// turn on the pushbutton as a source
#else
	PCMSK = ~DDRB;			// no PB? enable all PORTB inputs as wakeup sources
#endif

#if defined(FLUXY_LEDS)
	// turn off outputs for safety's sake
	led_off(LED0); led_off(LED1);
#endif

	// todo: idle and restore the serial link

	// turn off adc
	ADCSRA &= ~(1<<ADEN);

	// turn off analog comparator?
	// not needed; it's turned off at startup

	// select SM1..0 = 10 for Power Down sleep mode; set SE to enable sleep feature
	// others are zero
	MCUCR = 0<<BODS | 0<<PUD | 1<<SE | 1<<SM1 | 0<<SM0 | 0<<BODSE | 0<<ISC01 | 0<<ISC00;
	asm volatile("sleep");		// sleep here	
	MCUCR &= ~(1<<SE);			// disable sleep feature

	//ADCSRA |= 1<<ADEN;		// not needed: analogRead auto-starts the ADC

	PCMSK = PCMSK_save;			// restore pin change interrupt state
}

#if !defined(TINY_SERIAL)
ISR(PCINT0_vect) { }		// here to catch the wakeup call
#endif



// Software Serial Port
//
//
#define bitdelay ((1000000L/BAUD_OVERRIDE)+1)
//#define delayMicroseconds _delay_us
#define tx_down() (PORTB &= ~(1<<PIN_SERIALTX))
#define tx_up()  (PORTB |= (1<<PIN_SERIALTX))


///////////////////////
//
// spb(): serial tx byte
//
// bit whack a byte out the port designated by 'outpin' (defined in bitlash.h)
//
void spb(unsigned char c) {

	// disable interrupts for the duration of the transmission
	uint8_t old_SREG = SREG; cli();

	tx_down();		// pull down for 1/2 start bit
	_delay_us(bitdelay - clockCyclesToMicroseconds(2+16-8+2+1));	// (13) and wait it out, less "time to here"

	// TIMING: these delays all measure out at 212us instead of 208us (208.333) for 4800

	byte count = 8;
	while (count-- > 0) {
		if (c & 1) {
			tx_up();
			_delay_us(bitdelay - clockCyclesToMicroseconds(10+10-8+2-4+1));	// 11
		}
		else {
			tx_down();
			_delay_us(bitdelay - clockCyclesToMicroseconds(10+10-10+2-3));	// 9
		}
		c = c >> 1;
	}

	tx_up();					// push up for the two stop bits
	_delay_us(bitdelay);		// wait two bit times
	_delay_us(bitdelay);

	// restore interrupts
	SREG = old_SREG;
}


//////////////////////////////
//
//	Software Serial Receive
//

// Serial Rx buffer
volatile uint8_t soft_rx_buffer_head;
uint8_t soft_rx_buffer_tail;
char soft_rx_buffer[MAX_SOFT_RX_BUFF];


//	Pin-change interrupt handler
//
ISR(PCINT0_vect) {
byte c = 0;

	if (!(PINB & (1<<PIN_SERIALRX))) {

		// Notes on timing the software uart based on examining the generated code
		// avr-gcc 4.3.2
		//
		// We wait half a bit to get centered on the start bit
		// ...less the interrupt latency to this point hand calculated to be 30 cycles on the T85)
		// ...less the loop initialization latency to come (12 cycles)
		// plus another whole bit time to get centered to sample the first input bit
		//
		_delay_us(bitdelay + (bitdelay >> 1) - clockCyclesToMicroseconds(35+4+6));

		byte i;
		for (i=1; i; i<<=1) { 
			if (PINB & (1<<PIN_SERIALRX)) {
				c |= i; 
				// wait for the next bit
				_delay_us(bitdelay - clockCyclesToMicroseconds(6+7));
			}
			else {
				// wait for the next bit
				_delay_us(bitdelay - clockCyclesToMicroseconds(4+7));
			}
		}

		// buffer what we got
		uint8_t newhead = soft_rx_buffer_head + 1;
		if (newhead >= MAX_SOFT_RX_BUFF) newhead = 0;
		if (newhead != soft_rx_buffer_tail) {
			soft_rx_buffer[soft_rx_buffer_head] = c;
			soft_rx_buffer_head = newhead;
		}

		_delay_us(bitdelay);	// fingers in ears for one stop bit
	}
}


//////////
//
// serialRead(): return a byte from the serial buffer or -1
//
int serialRead(void) {
	byte c;
	if (soft_rx_buffer_tail == soft_rx_buffer_head) return -1;
 	c = soft_rx_buffer[soft_rx_buffer_tail];
	soft_rx_buffer_tail = (soft_rx_buffer_tail + 1) & SOFT_RX_BUFF_MASK;
	return c;
}


//////////
//
// serialAvailable(): return TRUE if the serial receive buffer is not empty
//
// Note the semantics are different from the Arduino Serial.available() method
// which returns the number of characters in the buffer instead.  Not so here.
//
int serialAvailable(void) {
	//byte old_SREG = SREG; cli();
	uint8_t avail = (soft_rx_buffer_tail != soft_rx_buffer_head);
	//SREG = old_SREG;
	return avail;
}


//////////
//
// beginSerial(): Initialize serial io at specified baud
//
void beginSerial(unsigned long baud) {

	pinMode(PIN_SERIALRX, INPUT); 			// make rx an input
	digitalWrite(PIN_SERIALRX, HIGH);		// and engage the pullup

	// Initialize serial tx pin to idle line state (HIGH)
	pinMode(PIN_SERIALTX, OUTPUT);
	tx_up();
	_delay_us(bitdelay);		// a stop bit

	// Enable the pin-change interrupt for PIN_SERIALRX
	PCMSK |= 1<<PIN_SERIALRX;	// enable ints on our RX input
	GIMSK |= 1<<PCIE;			// enable master pin change interrupt
}



/////////////////////////
//
// Tiny85 temperature sensor interface
//
unumvar degc(void) {
	// fetch the temperature in celsius from the Tinyx5 sensor.
	//
	// the simple conversion used here is good in the neighborhood of 25 degc:
	// 		degc = sensor - 300 + 25
	// (from Table 17-2 p.138 and a little arithmetic)

	// we optionally apply a one-byte temperature calibration offset from eeprom
	// flash cost: 26 bytes
	// todo: merge with EEEND setup, carve out proper calibration area
	//
//#define DO_TEMPERATURE_CALIBRATION 1
#define EE_TEMP_CORRECTION 511
#ifdef DO_TEMPERATURE_CALIBRATION
	int offset = eeread(EE_TEMP_CORRECTION);
	if (offset & 0x80) offset |= 0xff00;		// sign extend.  sigh.  but cheap.

#if 0
	// "what you tell me twice, I believe"
	// flash cost: 22 bytes
	int t;
	do {
		t = analogRead((1<<REFS1) | 0xf);
	} while (t != analogRead((1<<REFS1) | 0xf));
	return t - 275 + offset;
#elif 0
	// low-pass filter, not tested
#define TEMP_ERROR_THRESHOLD 50
	extern int temp_smoothed, temp_error;
	temp_error = temp_error + analogRead((1<<REFS1) | 0xf) - 275 + offset - temp_smoothed;
	if (abs(temp_error) > TEMP_ERROR_THRESHOLD) {
		temp_smoothed += sign(temp_error);
		temp_error = 0;
	}
	return temp_smoothed;
#else
	return analogRead((1<<REFS1) | 0xf) - 275 + offset;
#endif

#else
	return analogRead((1<<REFS1) | 0xf) - 275;
#endif
}

unumvar degf(void) {
	return ((degc() * 9) / 5) + 32;
}



////////////////////
//
// The Function Table: Built-in functions are registered here
//
// Function names
// 		these must be in ascending alpha order
// 		function_table below must be 1:1 with this one
//
prog_char functiondict[] PROGMEM = {
	"abs\0"
	"ar\0"
	"degc\0"
	"degf\0"
	"delay\0"
	"er\0"
	"ew\0"
	"free\0"
	"inb\0"
	"millis\0"
	"outb\0"
	"pinmode\0"
	"rnd\0"
	"sign\0"
	"sleep\0"
	"snooze\0"
};


//////////
//
// Function Handlers
//
// this must be 1:1 with the symbols in functiondict above, 
// which in turn must be in alpha order
//
functab_entry function_table[] PROGMEM = {
	{ /* f_abs,		*/		1,	(bitlash_function) &myabs },
	{ /* f_ar,		*/		1,	(bitlash_function) &analogRead },
	{ /* f_degc,	*/		0,	(bitlash_function) &degc },
	{ /* f_degf,	*/		0,	(bitlash_function) &degf },
	{ /* f_delay,	*/		-1,	(bitlash_function) &delay },
	{ /* f_er,		*/		1,	(bitlash_function) &eereadUnumvar },
	{ /* f_ew,		*/		-2,	(bitlash_function) &eewrite },
	{ /* f_free,	*/		0,	(bitlash_function) &get_free_memory },
	{ /* f_inb,		*/		1,	(bitlash_function) &inb },
	{ /* f_millis,	*/		0,	(bitlash_function) &millisUnumvar },
	{ /* f_outb,	*/		-2, (bitlash_function) &outb },
	{ /* f_pinmode,	*/		-2, (bitlash_function) &pinMode },
	{ /* f_random,	*/		1,	(bitlash_function) &deadbeef_random },
	{ /* f_sign,	*/		1,	(bitlash_function) &mysign },
	{ /* f_sleep,	*/		0,	(bitlash_function) &sleep },
	{ /* f_snooze,	*/		-1,	(bitlash_function) &snooze }
};


////////////////////
//
// EEPROM preload
//
#if 0
// todo: must have a reference to this somewhere to get it linked
char initial_macro_preload[] EEMEM = 
	"startup\0print \"Hello, world!\""
	//"startup\0while 1:print \"U\","
;
#endif
