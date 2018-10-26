;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;EstebanTapia FernandoVargas																			;
;Uso de TMR0 en retardos entre salidas de LEDs															;
;Microcontroladores																						;
;V0 09 de Octubre de 2018	Inicio de programacion														;
;V1 23 de Octubre de 2018	Uso de ciclo IDLE en la programacion y demas correcciones en INTERRUPCION	;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;	
LIST P=16F887
#INCLUDE P16F887.INC 

__CONFIG _CONFIG1, _WDT_OFF & _CP_OFF  &_BOR_OFF & _LVP_OFF & _XT_OSC & _MCLRE_ON & _CPD_OFF & _BOR_OFF & _PWRTE_OFF 

CBLOCK  0x20		;Guarda en las localidades 0x20, 0x21 y 0x22 a los registros de proposito general MEM0, MEM1 Y MEM2
		SECUENCIA_SIG
		CONTEO_1S
ENDC

BANK0   MACRO		;Guardado de macros para saltos simples de bancos
        BCF STATUS,RP0
        BCF STATUS,RP1
        ENDM
BANK1   MACRO
		BSF STATUS,RP0
		BCF STATUS,RP1
        ENDM
BANK2   MACRO 
        BCF STATUS,RP0
        BSF STATUS,RP1
        ENDM
BANK3   MACRO
		BSF STATUS,RP0
		BSF STATUS,RP1
        ENDM

		ORG	0X00	;Reinicio del PIC
		GOTO 	INICIALIZACION
		ORG 	0X04
		GOTO INTERRUPCION



INICIALIZACION				;Inicializacion
		BANK1		;Salto a Banco1
		MOVLW 0X47
		MOVWF OPTION_REG
		MOVLW 0X00	;Movemos un valor 0x00 a W
		MOVWF TRISB	;Movemos de W hacia TRISB. Bits: 1=Entrada 0=Salida;
		BANK3		;Salto a Banco3
		MOVLW 0X00	;Movemos un valor 0x00 a W
		MOVWF ANSELH	;Movemos de W hacia ANSELH. Bits: 1=ADC en PORTB Activado 0=ADC en PORTB Desactivado
		BANK0		;Salto a Banco0
		MOVLW 0X14	;Movemos un 20 a W
		MOVWF CONTEO_1S
		CLRF TMR0	;Limpia TMR0
		MOVLW 0X3C	;
		MOVWF TMR0
		MOVLW 0XA0
		MOVWF INTCON
		MOVLW 0X01
		MOVWF PORTB
		MOVLW 0XFF
		MOVWF SECUENCIA_SIG
		CLRW
	



IDLE	GOTO IDLE




INTERRUPCION
		BCF INTCON,2
		DECFSZ CONTEO_1S
		GOTO RESTART_DE_CONTADOR_50mS
		INCF SECUENCIA_SIG,1
		MOVF SECUENCIA_SIG,0
		CALL SECUENCIA_LEDS
		MOVWF PORTB

		MOVLW 0X14
		MOVWF CONTEO_1S

RESTART_DE_CONTADOR_50mS
		MOVLW 0X3C
		MOVWF TMR0
		RETFIE

SECUENCIA_LEDS
		ADDWF PCL,1
		RETLW B'00000010
		RETLW B'00000100
		RETLW B'00000010
		RETLW B'00000100
		RETLW B'00001000
		RETLW B'00000100
		RETLW B'00001000
		RETLW B'00010000
		RETLW B'00001000
		RETLW B'00010000
		RETLW B'00100000
		RETLW B'00010000
		RETLW B'00100000
		RETLW B'01000000
		RETLW B'00100000
		RETLW B'01000000
		RETLW B'10000000
		MOVLW 0XFF
		MOVWF SECUENCIA_SIG
		MOVLW 0X01
		RETURN

		END
