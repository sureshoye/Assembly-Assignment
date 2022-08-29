.include "/home/suresh/m328Pdef.inc"

ldi r16, 0b11111100 ;identifying output pins 2
out DDRD,r16  ;declaring pins as output
ldi r17, 0b11111100 ;identifying output pins 8
out DDRB,r17  ;declaring pins as output


ldi r18,0b00000001 ;initializing X
ldi r19,0b00000001 ;initializing Y
ldi r20,0b00000001 ;initializing Z

ldi r21,0b00000001 ;initializing X
ldi r22,0b00000001 ;initializing Y
ldi r23,0b00000001 ;initializing Z

or r19,r20
and r18,r19

mov r25,r21

and r21,r23

and r25,r22

or r21,r25

;following code is for displaying output
;shifting LSB in r16 to 2nd position
ldi r23, 0b00000010 ;counter = 2

rcall loopw  ;calling the loopw routine

out PORTD,r18  ;writing output to pin 2
out PORTB,r21  ;writing output to pin 10


Start:
rjmp Start

;loop for bit shifting 
loopw: lsl r18   ;left shift
 lsl r21   ;left shift
 dec r23   ;counter --
 brne loopw ;if counter != 0
 ret
