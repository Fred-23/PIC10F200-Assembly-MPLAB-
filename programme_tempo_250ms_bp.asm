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
var2 equ 11h
var3 equ 12h
 
;start
ORG 0X000
movwf OSCCAL
goto main
ORG 0X020
 
main:
    movlw 0CFh
    option
    movlw 0F8h
    tris GPIO
    goto bp

bp:
    BTFSS GPIO,3   ; if GP3 =1
    goto allumer   ; puis on allume
    BCF GPIO,0  ;
    goto main
    
allumer:
    BSF GPIO,GP0 ;GPO=1
    movlw 0FFh
    movwf var1
    call tempo1     ;goto test

eteindre:
    BCF GPIO,GP0 ;GPO=1
    goto bp     ;goto test
	 
tempo1:
    movlw 0FFh
    movwf var2
    nop
    nop
    nop
    nop
    nop
    nop
    decfsz var1
    call tempo2
    goto eteindre
    
tempo2: 
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    decfsz var2
    goto tempo2
    goto tempo1
  ;  goto tempo3    
    
;tempo3:
 ;   decfsz var3
  ;  goto tempo2
   ; goto tempo3
    



  
    
;init_tempo:
    ;movlw 07Dh
    ;var1
    ;movlw 07Dh
    ;var2
    ;BTFSS var1,0
    ;goto tempo     
        
;tempo:
    
    ;NOP 
    ;NOP
    ;NOP
    ;NOP
    ;NOP
    ;NOP 
    ;NOP
    ;NOP
    ;NOP
    ;NOP
    ;DECF var1,0
    ;goto min_tempo     
    
;min_tempo:
    ;DECF var2,0
    ;goto tempo     ;
    

    
END



