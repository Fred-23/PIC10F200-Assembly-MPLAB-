#include p10f200.inc
    
__CONFIG _WDTE_OFF & _CP_OFF & _MCLRE_OFF
    
STATUS equ 03h
OSCCAL equ 05h
GPIO equ 06h
GP0 equ 00h
GP1 equ 01h
GP2 equ 02h
GP3 equ 03h
var1 equ 10h
 
;start;
ORG 0X000
movwf OSCCAL
goto main

ORG 0X020
 
main:
    movlw 0CFh
    option
    movlw 0F8h
    tris GPIO

END



