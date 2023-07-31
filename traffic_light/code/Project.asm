
_main:

;Project.c,1 :: 		void main() {
;Project.c,2 :: 		int counter=0,i,j;
;Project.c,3 :: 		trisb=0;
	CLRF       TRISB+0
;Project.c,4 :: 		portb=0;
	CLRF       PORTB+0
;Project.c,5 :: 		trisc=0b11000000;
	MOVLW      192
	MOVWF      TRISC+0
;Project.c,6 :: 		RC0_bit=RC1_bit=RC2_bit=RC3_bit=RC4_bit=RC5_bit=0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	BTFSC      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L__main46
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L__main47
L__main46:
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
L__main47:
	BTFSC      RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L__main48
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L__main49
L__main48:
	BSF        RC3_bit+0, BitPos(RC3_bit+0)
L__main49:
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L__main50
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__main51
L__main50:
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
L__main51:
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__main52
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L__main53
L__main52:
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
L__main53:
	BTFSC      RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L__main54
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L__main55
L__main54:
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
L__main55:
;Project.c,7 :: 		trisd=0;
	CLRF       TRISD+0
;Project.c,8 :: 		portd=0;
	CLRF       PORTD+0
;Project.c,9 :: 		while(1){
L_main0:
;Project.c,10 :: 		if(RC6_bit==0){
	BTFSC      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_main2
;Project.c,11 :: 		RC0_bit=RC4_bit=RC5_bit=0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	BTFSC      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L__main56
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L__main57
L__main56:
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
L__main57:
	BTFSC      RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L__main58
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L__main59
L__main58:
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
L__main59:
;Project.c,12 :: 		for(i=35;i>0;i--){
	MOVLW      35
	MOVWF      R1+0
	MOVLW      0
	MOVWF      R1+1
L_main3:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main60
	MOVF       R1+0, 0
	SUBLW      0
L__main60:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;Project.c,13 :: 		portc.RC3=1;
	BSF        PORTC+0, 3
;Project.c,14 :: 		portb=i;
	MOVF       R1+0, 0
	MOVWF      PORTB+0
;Project.c,15 :: 		portd=i;
	MOVF       R1+0, 0
	MOVWF      PORTD+0
;Project.c,16 :: 		if(i>32){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main61
	MOVF       R1+0, 0
	SUBLW      32
L__main61:
	BTFSC      STATUS+0, 0
	GOTO       L_main6
;Project.c,17 :: 		portc.b1=1;
	BSF        PORTC+0, 1
;Project.c,18 :: 		portc.b2=0;
	BCF        PORTC+0, 2
;Project.c,19 :: 		}
	GOTO       L_main7
L_main6:
;Project.c,21 :: 		portc.b1=0;
	BCF        PORTC+0, 1
;Project.c,22 :: 		portc.b2=1;
	BSF        PORTC+0, 2
;Project.c,23 :: 		}
L_main7:
;Project.c,24 :: 		if(RC6_bit==1)
	BTFSS      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_main8
;Project.c,25 :: 		break;
	GOTO       L_main4
L_main8:
;Project.c,26 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	DECFSZ     R11+0, 1
	GOTO       L_main9
	NOP
	NOP
;Project.c,27 :: 		if(i==32)
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main62
	MOVLW      32
	XORWF      R1+0, 0
L__main62:
	BTFSS      STATUS+0, 2
	GOTO       L_main10
;Project.c,28 :: 		i=26;
	MOVLW      26
	MOVWF      R1+0
	MOVLW      0
	MOVWF      R1+1
	GOTO       L_main11
L_main10:
;Project.c,29 :: 		else if(i==16)
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main63
	MOVLW      16
	XORWF      R1+0, 0
L__main63:
	BTFSS      STATUS+0, 2
	GOTO       L_main12
;Project.c,30 :: 		i=10;
	MOVLW      10
	MOVWF      R1+0
	MOVLW      0
	MOVWF      R1+1
L_main12:
L_main11:
;Project.c,12 :: 		for(i=35;i>0;i--){
	MOVLW      1
	SUBWF      R1+0, 1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
;Project.c,31 :: 		}
	GOTO       L_main3
L_main4:
;Project.c,32 :: 		}
L_main2:
;Project.c,33 :: 		if(RC6_bit==0){
	BTFSC      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_main13
;Project.c,34 :: 		RC1_bit=RC2_bit=RC3_bit=0;
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
	BTFSC      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L__main64
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__main65
L__main64:
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
L__main65:
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__main66
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L__main67
L__main66:
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
L__main67:
;Project.c,35 :: 		for(i=21;i>0;i--){
	MOVLW      21
	MOVWF      R1+0
	MOVLW      0
	MOVWF      R1+1
L_main14:
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main68
	MOVF       R1+0, 0
	SUBLW      0
L__main68:
	BTFSC      STATUS+0, 0
	GOTO       L_main15
;Project.c,36 :: 		portc.RC0=1;
	BSF        PORTC+0, 0
;Project.c,37 :: 		portb=i;
	MOVF       R1+0, 0
	MOVWF      PORTB+0
;Project.c,38 :: 		portd=i;
	MOVF       R1+0, 0
	MOVWF      PORTD+0
;Project.c,39 :: 		if(i>18){
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      R1+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main69
	MOVF       R1+0, 0
	SUBLW      18
L__main69:
	BTFSC      STATUS+0, 0
	GOTO       L_main17
;Project.c,40 :: 		portc.b4=1;
	BSF        PORTC+0, 4
;Project.c,41 :: 		portc.b5=0;
	BCF        PORTC+0, 5
;Project.c,42 :: 		}
	GOTO       L_main18
L_main17:
;Project.c,44 :: 		portc.b4=0;
	BCF        PORTC+0, 4
;Project.c,45 :: 		portc.b5=1;
	BSF        PORTC+0, 5
;Project.c,46 :: 		}
L_main18:
;Project.c,47 :: 		if(RC6_bit==1)
	BTFSS      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_main19
;Project.c,48 :: 		break;
	GOTO       L_main15
L_main19:
;Project.c,49 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main20:
	DECFSZ     R13+0, 1
	GOTO       L_main20
	DECFSZ     R12+0, 1
	GOTO       L_main20
	DECFSZ     R11+0, 1
	GOTO       L_main20
	NOP
	NOP
;Project.c,50 :: 		if(i==16)
	MOVLW      0
	XORWF      R1+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main70
	MOVLW      16
	XORWF      R1+0, 0
L__main70:
	BTFSS      STATUS+0, 2
	GOTO       L_main21
;Project.c,51 :: 		i=10;
	MOVLW      10
	MOVWF      R1+0
	MOVLW      0
	MOVWF      R1+1
L_main21:
;Project.c,35 :: 		for(i=21;i>0;i--){
	MOVLW      1
	SUBWF      R1+0, 1
	BTFSS      STATUS+0, 0
	DECF       R1+1, 1
;Project.c,53 :: 		}
	GOTO       L_main14
L_main15:
;Project.c,54 :: 		}
L_main13:
;Project.c,55 :: 		if(RC6_bit==1){
	BTFSS      RC6_bit+0, BitPos(RC6_bit+0)
	GOTO       L_main22
;Project.c,56 :: 		if(RC7_bit==0){
	BTFSC      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L_main23
;Project.c,57 :: 		if(RC3_bit==1&&RC1_bit==1){//yellow
	BTFSS      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_main26
	BTFSS      RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L_main26
L__main44:
;Project.c,58 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main27:
	DECFSZ     R13+0, 1
	GOTO       L_main27
	DECFSZ     R12+0, 1
	GOTO       L_main27
	DECFSZ     R11+0, 1
	GOTO       L_main27
	NOP
;Project.c,59 :: 		RC1_bit=0;
	BCF        RC1_bit+0, BitPos(RC1_bit+0)
;Project.c,60 :: 		RC2_bit=1;
	BSF        RC2_bit+0, BitPos(RC2_bit+0)
;Project.c,61 :: 		}
	GOTO       L_main28
L_main26:
;Project.c,62 :: 		else if(RC3_bit==1&&RC2_bit==1){
	BTFSS      RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L_main31
	BTFSS      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L_main31
L__main43:
;Project.c,63 :: 		while(RC7_bit==0){}
L_main32:
	BTFSC      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L_main33
	GOTO       L_main32
L_main33:
;Project.c,64 :: 		RC3_bit=RC2_bit=0;
	BCF        RC2_bit+0, BitPos(RC2_bit+0)
	BTFSC      RC2_bit+0, BitPos(RC2_bit+0)
	GOTO       L__main71
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L__main72
L__main71:
	BSF        RC3_bit+0, BitPos(RC3_bit+0)
L__main72:
;Project.c,65 :: 		RC0_bit=RC4_bit=1;
	BSF        RC4_bit+0, BitPos(RC4_bit+0)
	BTFSC      RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L__main73
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L__main74
L__main73:
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
L__main74:
;Project.c,66 :: 		}
	GOTO       L_main34
L_main31:
;Project.c,67 :: 		else if(RC0_bit==1&&RC4_bit==1){ //yellow
	BTFSS      RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L_main37
	BTFSS      RC4_bit+0, BitPos(RC4_bit+0)
	GOTO       L_main37
L__main42:
;Project.c,68 :: 		delay_ms(3000);
	MOVLW      31
	MOVWF      R11+0
	MOVLW      113
	MOVWF      R12+0
	MOVLW      30
	MOVWF      R13+0
L_main38:
	DECFSZ     R13+0, 1
	GOTO       L_main38
	DECFSZ     R12+0, 1
	GOTO       L_main38
	DECFSZ     R11+0, 1
	GOTO       L_main38
	NOP
;Project.c,69 :: 		RC4_bit=0;
	BCF        RC4_bit+0, BitPos(RC4_bit+0)
;Project.c,70 :: 		RC5_bit=1;
	BSF        RC5_bit+0, BitPos(RC5_bit+0)
;Project.c,71 :: 		}
	GOTO       L_main39
L_main37:
;Project.c,73 :: 		while(RC7_bit==0){}
L_main40:
	BTFSC      RC7_bit+0, BitPos(RC7_bit+0)
	GOTO       L_main41
	GOTO       L_main40
L_main41:
;Project.c,74 :: 		RC0_bit=RC5_bit=0;
	BCF        RC5_bit+0, BitPos(RC5_bit+0)
	BTFSC      RC5_bit+0, BitPos(RC5_bit+0)
	GOTO       L__main75
	BCF        RC0_bit+0, BitPos(RC0_bit+0)
	GOTO       L__main76
L__main75:
	BSF        RC0_bit+0, BitPos(RC0_bit+0)
L__main76:
;Project.c,75 :: 		RC3_bit=RC1_bit=1;
	BSF        RC1_bit+0, BitPos(RC1_bit+0)
	BTFSC      RC1_bit+0, BitPos(RC1_bit+0)
	GOTO       L__main77
	BCF        RC3_bit+0, BitPos(RC3_bit+0)
	GOTO       L__main78
L__main77:
	BSF        RC3_bit+0, BitPos(RC3_bit+0)
L__main78:
;Project.c,76 :: 		}
L_main39:
L_main34:
L_main28:
;Project.c,77 :: 		}
L_main23:
;Project.c,78 :: 		}
L_main22:
;Project.c,79 :: 		}
	GOTO       L_main0
;Project.c,81 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
