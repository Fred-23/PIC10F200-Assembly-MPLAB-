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
    movlw 0F8h ; configuration registre GPIO
    tris GPIO
	
capteur: 
    BTFSC GPIO,3 ; si le capteur detecte depasse le seuil d'infrarouge
    goto alternateur ; aller dans la fonction alternateur
    goto capteur ; sinon retourner au debut de capteur

alternateur:
    BTFSC GPIO,0 ; si la sortie est éteinte
    call allumer ; appeller la sous-routine allumer
    call eteindre ; sinon appeller la sous-routine éteindre
    BTFSC GPIO,3 ; si le capteur détecte encore de l'infrarouge
    goto alternateur+3 ; revenir à la ligne précédente
    goto capteur ; sinon retourner au debut de capteur
        
eteindre:
    BCF GPIO,0
    return
    
allumer:
    BSF GPIO,0
    return

END


