;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;EstebanTapia FernandoVargas										;
;Envio de caracteres en Hexadecimal									;
;Microcontroladores											;
;V0 11 de Septiembre de 2018	Inicio de programacion							;
;V1 12 de Septiembre de 2018	Solucion en seleccion de bancos						;
;				Correccion en la instruccion MOVLW, anteriormente escrita como MOVL	;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LIST P=16F887
#INCLUDE P16F887.INC

__CONFIG _CONFIG1, _WDT_OFF & _CP_OFF  & _BOR_OFF & _LVP_OFF & _XT_OSC & _MCLRE_ON & _CPD_OFF & _PWRTE_OFF

	ORG	0X00	; inico de programa en flash en rom
	GOTO 	INICIO
	ORG 	0X05

INICIO  BSF   STATUS,RP0;Colocarse en banco1
	MOVLW 0XFF      ;PuertoA como entrada
	MOVWF TRISA     ;MOVER A registro TRISA el valor de 0xFF
	MOVLW 0X00	;PuertoB como salida
	MOVWF TRISB	;Mover a registro TRISB el valor de 0x00
	BSF STATUS,RP1  ;Cambio a banco 1
	MOVWF ANSEL	;Desactivar A/D
	MOVWF ANSELH
	BCF STATUS,RP1	;Colocarse en banco 0
	BCF STATUS,RP0	;
	CLRF PORTB	;Limpieza de PuertoA y PuertoB
	CLRF PORTA

MAIN
	MOVLW 0x01
	MOVWF PORTB
	MOVLW 0x02
	MOVWF PORTB
	MOVLW 0x03
	MOVWF PORTB
	MOVLW 0x04
	MOVWF PORTB
	MOVLW 0x05
	MOVWF PORTB
	MOVLW 0x06
	MOVWF PORTB
	MOVLW 0x07
	MOVWF PORTB
	MOVLW 0x08
	MOVWF PORTB
	GOTO MAIN
END
