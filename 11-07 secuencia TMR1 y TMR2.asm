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
		GOTO INTERRTMR1

INICIALIZACION		;Inicializacion
		BANK1		;Salto a Banco1
		BSF PIE1,0  ; activamos el timer 1 
		MOVLW 0X00	;Movemos un valor 0x00 a W
		MOVWF TRISB	;Movemos de W hacia TRISB. Bits: 1=Entrada 0=Salida;
		BANK3		;Salto a Banco3
		MOVLW 0X00	;Movemos un valor 0x00 a W
		MOVWF ANSELH	;Movemos de W hacia ANSELH. Bits: 1=ADC en PORTB Activado 0=ADC en PORTB Desactivado  convertidor analogico digital , PUERTO B 
		BANK0			;Salto a Banco0
		MOVLW 0X02		;Movemos un 2 a W  repetimos 2 veces 500ms para que sea 1s
		MOVWF CONTEO_1S ;Registro que nos ayuda a que se cumpla el segundo 
		CLRF TMR1L		;Limpia TMR1
		CLRF TMR1H
		MOVLW B'00001011 
		MOVWF TMR1L
		MOVLW B'11110100
		MOVWF TMR1H
		MOVLW B'00110111
			;B'00110111			; preescaler 1:8, habilita el uso del timer1 ademas del reloj externo asincrono 
		MOVWF T1CON
		MOVLW 0X01  ; se prende en primer LED PRB0
		MOVWF PORTB
		MOVLW 0XFF    ;para hacer el salto del PC
		MOVWF SECUENCIA_SIG
		CLRW
		MOVLW 0XC0	;habilita PIE 
		MOVWF INTCON
		CLRW

IDLE	GOTO IDLE

INTERRTMR1
		BCF PIR1,0  ; limpiamos la bandera de interrupcion del timer 1 
		DECFSZ CONTEO_1S ; decrementa el registro de repeticion de conteo 
		GOTO RESTART_DE_CONTADOR_500mS  ; reinicia el conteo de 500ms antes de hacer la secuencia 
		INCF SECUENCIA_SIG,1  ; ; contador es 0 
		MOVF SECUENCIA_SIG,0   ; copeamos lo que ahi en la secuencia a W
		CALL SECUENCIA_LEDS
		MOVWF PORTB

		MOVLW 0X02          ; ponemos en 2 el conteo un segundo 
		MOVWF CONTEO_1S

RESTART_DE_CONTADOR_500mS
		MOVLW B'00001011
		MOVWF TMR1L
		MOVLW B'11110100
		MOVWF TMR1H
		RETFIE   ; regresa al ciclo IDLE

SECUENCIA_LEDS
		ADDWF PCL,1         ; suma lo que ahi en w y lo que tiene el registro PCL 
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
		MOVLW B'00000001                  
		MOVLW 0X01		;reset de la secuencia 
		MOVWF SECUENCIA_SIG  ; mueve a secuencia siguiente el valor de 255
		RETURN        ; evistar el desbordamiento 

		END