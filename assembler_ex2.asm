#include p10f200.inc

__CONFIG _WDTE_OFF & _CP_OFF & _MCLRE_OFF
    
STATUS equ 03h
OSCCAL equ 05h
GPIO equ 06h
GP0 equ 00h
GP1 equ 01h
GP2 equ 02h
GP3 equ 03h

t1 equ 10h
t2 equ 11h

ORG 0X000
 
movwf OSCCAL
goto main
 

ORG 0X020
 
main:	
    movlw 0CFh
    option
    movlw 0F8h
    tris GPIO
	
bp: BTFSS GPIO,3
    goto alternateur
    goto bp

alternateur:
    call tempo1
    BTFSC GPIO,3
    goto alternateur
    BTFSC GPIO,0
    goto eteindre
    goto allumer

eteindre:
    BCF GPIO,0
    goto bp
    
allumer:
    BSF GPIO,0
    goto bp

tempo1:
    MOVLW 0E0h
    MOVWF t2
    decfsz t1
    goto tempo2
    return 

tempo2:
    decfsz t2
    goto tempo2
    goto tempo1
END


