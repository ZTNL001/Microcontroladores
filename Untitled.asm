;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;EstebanTapia FernandoVargas																			;
;Proyecto final uso de conversor ADC, asi como conexion serial para alimentador.															;
;Microcontroladores																						;
;V0 26 de Diciembre de 2018	Inicio de programacion														;
;V1 28 de Diciembre de 2018	Programacion de ADC 														;
;V2 01 de Diciembre de 2018	Configuracion de TMR1														;
;V3 01 de Diciembre de 2018	1er intento conecc i2c														;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LIST P=16F887
#INCLUDE P16F887.INC 

__CONFIG _CONFIG1, _WDT_OFF & _CP_OFF  &_BOR_OFF & _LVP_OFF & _XT_OSC & _MCLRE_ON & _CPD_OFF & _BOR_OFF & _PWRTE_OFF

CBLOCK  0x20
		CONTEO_1S ; REGISTRO PARA REALIZAR EL CONTEO DE LLENADO DEL RECIPIENTE DE ALIMENTO 
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

		ORG	0X00					;Cuando reinicia el pic, se va a esta direccion de memoria
		GOTO 	INICIALIZACION  	;y ahi hay un goto hacia la inicializacion
		ORG 	0X04				;Cuando ocurre una interrupcion, revisa que la ocasiono
		GOTO SELECT_INTERRUPCION

INICIALIZACION		;Inicializacion
		BANK1
		;CONFIGURACION DE PUERTOS
		BSF TRISA,TRISA0	;AN0 COMO PIN DE ENTRADA  (PONER EL PIN AN0 COMO ENTRADA)
		CLRF TRISB			;PORTB ES SALIDA (TODOS EN 0 PARA QUE SEAN SALIDAS ECEPTO EL RB7 YA QUE ES EL BOTON DE INICIO DE SECUENCIA)
		BSF TRISB,TRISB7	;PORTE ENTRADA ,1
		
;CONFIGURACION DE ADC
		BCF ADCON1,VCFG1	;ESTABLECE VOLTAJE DE REFERENCIA VSS (5V)
		BCF ADCON1,VCFG0	;ESTABLECE VOLTAJE DE REFERENCIA VDD
		BSF ADCON1,ADFM		;AJUSTA LA JUSTIFICACION DE CONVERSION HACIA LA DERECHA 
		BSF PIE1, ADIE		;HABILITA INTERRUPCION POR A/D 
		
		BANK3
		BSF ANSEL,ANS0		;AN0 COMO PIN ANALOGICO
		CLRF ANSELH			; TODOS LOS PINES DEL PUERTO B SON DIGITALES

		BANK0
		BSF ADCON0,ADCS0	;CONFIGURA LA VELOCIDAD DE CONVERSION EN 4MHZ/8 
		BCF ADCON0,CHS3		;-
		BCF ADCON0,CHS2		;-CONFIGURA SOLO UN CALAL (AN0)
		BCF ADCON0,CHS1		;-
		BCF ADCON0,CHS0		;-
		BCF ADCON0,GO		;LIMPIAMOS PARA EVITAR INICIAR LA CONVERSION CUANDO NO ES REQUERIDA
		BSF ADCON0,ADON		;ACTIVA EL MODULO ADC (ACTIVA EL MODULO PERO NO LA CONVERSION)
		MOVLW 0X02			;MOVEMOS UN 2 PARA REPETIR EL CONTEO DE 500MS 2 VECES (LO DEJAMOS EN 500MS PARA NO UTILIZAR MAS DE UN REGISTRO GENERAL)
		MOVWF CONTEO_1S		;SE MUEVE A CONTEO_1S
		BCF PIR1, ADIF 		; Limpiamos el flag de interrupcion de lectura acabada adc
		BSF INTCON, PEIE 	;Activa Interrupciones particulares (ESTO DEBIDO A QUE TIMER1 Y ADC LO REQUIEREN)
		BSF INTCON, GIE 	; Activa todas las interrupciones

PRINCIPAL
		BTFSS PORTB,RB7  ;ESPERA LA SE�AL PARA REALIZAR LA MEDICION Y ALIMENTAR A LA MASCOTA
		GOTO PRINCIPAL 	;SI NO ESTA PULSADO SE MANTIENE EN CONSTANTEMENTE MEDICION 
		BSF ADCON0,GO	; SI ESTA PULSADO EL BOTON COMIENZA LA CONVERSION ADC
		GOTO PRINCIPAL

SELECT_INTERRUPCION
		BTFSS PIR1,TMR1IF ; REVISA SI FUE EL TIMER1 QUIEN OCASIONO LA INTERRRUPCION
		GOTO $+2			; SI NO SALTA DOS LINEAS MAS ABAJO 
		GOTO INTERRUPCION_TMR1	; COMO EL TIMER 1 FUE EL CAUSANTE ENTONCES SALTA A SU ISR (SERVICIO DE ATENCION POR INTERRUPCION )
		BTFSS PIR1,ADIF			; REVISA SI FUE LA CONVERSION ANALOGICO DIGITAL
		GOTO PRINCIPAL			;COMO NO FUE NINGUN EVENTO VUELVE A PREGUNTAR POR EL BOTON
		GOTO INTERRUPCION_ADC	; SALTA AL ISR POR LA CONVERSION
		GOTO PRINCIPAL			;VUELVE A PREGUNTAR POR EL BOTON 


INTERRUPCION_ADC
		BCF PIR1, ADIF		; LIMPIA LA BANDERA DE CONVERSION TERMINADA 
		BANKSEL ADRESH		; SE MUEVE AL BANCO DONDE ESTA ADRESH
		BTFSS ADRESH,1		; PREGUNTA SI EL TAZON ESTA A MAS DE LA MITAD DE CAPACIDAD
		CALL MOTOR_ABRIR	; SI TIENE MENOS DE LA MITAD ABRE EL COMPARTIMIENTO 
		
		RETFIE				; COMO TIENE MAS DE LA MITAD ENTONCES NO ABRIRA EL COMPARTIMIENTO
		
RETFIE1	BANK0
		BSF ADCON0,ADCS0
		BSF ADCON0,ADON	;PONE EN ESTADO DE ENCENDIDO AL CONVERSOR
		BSF INTCON, PEIE ; ACTIVA INTERRUPCIONES DE PERIFERICOS
		MOVLW 0X02			;MOVEMOS UN 6 PARA REPETIR EL CONTEO DE 500MS 6 VECES
		MOVWF CONTEO_1S		;SE MUEVE A CONTEO_3S

		RETFIE

MOTOR_ABRIR
		BANK0			; VA A BANCO0
		BSF PORTB,0		; PONE EN 1 A RB0 PARA ABRIR EL COMPARTIMIENTO DE COMIDA 
		CALL CONFIG_TMR1  ; COMIENZA A REALIZAR LA CONFIGURACION DEL TIMER1 (TMR1)
		RETURN

MOTOR_CERRAR
		BANK0
		BCF PORTB,0
		BSF ADCON0,ADCS0
		BSF ADCON0,ADON	;PONE EN ESTADO DE ENCENDIDO AL CONVERSOR
		BSF INTCON, PEIE ; ACTIVA INTERRUPCIONES DE PERIFERICOS
		MOVLW 0X02			;MOVEMOS UN 6 PARA REPETIR EL CONTEO DE 500MS 6 VECES
		MOVWF CONTEO_1S		;SE MUEVE A CONTEO_3S
		BCF T1CON,TMR1ON
		RETURN
		

INTERRUPCION_TMR1
		BCF PIR1,0  ; limpiamos la bandera de interrupcion del timer 1
		DECFSZ CONTEO_1S ; decrementa el registro de repeticion de conteo 
		GOTO CONFIG_TMR1  ; reinicia el conteo de 500ms antes de hacer la secuencia 
		CALL MOTOR_CERRAR
		RETFIE

CONFIG_TMR1
		;CONFIGURACION DE TIMER1 
		BANK1
		BSF PIE1,0  		;Activamos el timer 1 
		BANK0
		CLRF TMR1L			;LIMPIAMOS LOS REGISTROS DEL TIMER1
		CLRF TMR1H
		MOVLW B'00010100
		MOVWF TMR1L			;MOVEMOS ESTOS VALORES PARA OBTENER UN CONTEO DEL TMR1 DE 500MS
		MOVLW B'00000000
		MOVWF TMR1H
		BSF T1CON,TMR1ON	;ACTIVAMOS TIMER1
		BSF T1CON,T1CKPS0	;EL PRESCALAMIENTO SE COLOCA A 1:8 
		BSF T1CON,T1CKPS1	
		BSF INTCON, PEIE ;Activa Interrupciones particulares
		BSF INTCON, GIE ; Activa todas las interrupciones
		RETURN			; ESTE VA A CHECAR EL BOTON POR QUE DEJAMOS ANTES DE LA INTERRUPCION A LA ALU PREGUNTANDO POR RB7

END