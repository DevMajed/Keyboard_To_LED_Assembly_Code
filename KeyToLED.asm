;
; AssemblerApplication1.asm
; 
; Created: 3/6/2020 10:40:45 AM
; Author : malharbi
;


; Replace with your application code
.nolist
.include "m328pbdef.inc"
.list


start:
   ldi r20,0xff
   ldi r21,0xF0 ; Row out column in
   out ddrd,r21
   ldi r19, 0x0F
   out portd, r19 ; pull ups
   out ddrb, r19 ;lower bits outputs
   out portb, r20

loop:
   ldi r16, 0b01111111 ; first row
   out portd, r16 ;enabled
   call delay
   in r17, pind
   
   ;andi r18, 0b00001111
   cpi r17, 0b01110111 ;button 1
   breq one
   cpi r17,0b01111011
   breq two
   cpi r17,0b01111101
   breq three


//
 

   ldi r16, 0b10111111 ; second row
   out portd, r16 ;enabled
   call delay
   in r17, pind

   ;andi r18, 0b101111
   cpi r17, 0b10110111 ;button 1
   breq four
   cpi r17,0b10111011
   breq five
   cpi r17,0b10111101
   breq six


   //
   ldi r16, 0b11011111 ; third row
   out portd, r16 ;enabled
   call delay
   in r17, pind

   ;andi r18, 0b101111
   cpi r17, 0b11010111 ;button 1
   breq seven
   cpi r17,0b11011011
   breq eight
   cpi r17,0b11011101
   breq nine


   rjmp loop

   one:
   ;color 1
   ldi r22, 1<<2|1<<1|0<<0 ; red
   out portb, r22

   rjmp loop
	
two:
  ldi r22, 1<<2|0<<1|1<<0 ; green
   out portb, r22
   
   rjmp loop

 three:
  ldi r22, 1<<2|0<<1|0<<0 ; yellow
   out portb, r22
  rjmp loop
   

   four:
   ldi r22, 0<<2|1<<1|1<<0 ; blue
   out portb, r22
   
   rjmp loop

    five:
   ldi r22, 0<<2|0<<1|1<<0 ; cyan
   out portb, r22

   rjmp loop

    six:
   ldi r22, 0<<2|1<<1|0<<0 ; magenta
   out portb, r22

   rjmp loop

 seven:
   ldi r22, 0<<2|0<<1|0<<0 ; white
   out portb, r22

   rjmp loop

    eight:
   ldi r22, 1<<2|1<<1|1<<0 ; magenta
   out portb, r22

   rjmp loop

    nine:
   ldi r22, 0<<2|1<<1|0<<0 ; magenta
   out portb, r22

   rjmp loop
delay:
ldi r25,35
delay500msA:
ldi r26,0
delay500msB:
ldi r27,0
delay500msC:
	dec r27
	brne delay500msC
	dec r26
	brne delay500msB
	dec r25
	brne delay500msA
	ret
