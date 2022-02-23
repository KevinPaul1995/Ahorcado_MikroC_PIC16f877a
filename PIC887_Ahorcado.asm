
_main:

;PIC887_Ahorcado.c,57 :: 		void main()
;PIC887_Ahorcado.c,59 :: 		ANSEL  = 0;                              // desactiva ADC
	CLRF       ANSEL+0
;PIC887_Ahorcado.c,60 :: 		ANSELH = 0;                              // "
	CLRF       ANSELH+0
;PIC887_Ahorcado.c,61 :: 		TRISE=0;
	CLRF       TRISE+0
;PIC887_Ahorcado.c,62 :: 		cnt = 0;                                 // Reset counter
	CLRF       _cnt+0
;PIC887_Ahorcado.c,64 :: 		Keypad_Init();                           // Initialize Keypad
	CALL       _Keypad_Init+0
;PIC887_Ahorcado.c,65 :: 		Lcd_Init();                              // Initialize LCD
	CALL       _Lcd_Init+0
;PIC887_Ahorcado.c,66 :: 		Lcd_Cmd(_LCD_CLEAR);                     // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC887_Ahorcado.c,67 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);                // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC887_Ahorcado.c,68 :: 		Glcd_Init();                             // Initialize GLCD
	CALL       _Glcd_Init+0
;PIC887_Ahorcado.c,69 :: 		Glcd_Fill(0x00);                         // Clear GLCD
	CLRF       FARG_Glcd_Fill_pattern+0
	CALL       _Glcd_Fill+0
;PIC887_Ahorcado.c,71 :: 		while(1)
L_main0:
;PIC887_Ahorcado.c,73 :: 		porte=3;
	MOVLW      3
	MOVWF      PORTE+0
;PIC887_Ahorcado.c,74 :: 		delay_ms(2000);
	MOVLW      51
	MOVWF      R11+0
	MOVLW      187
	MOVWF      R12+0
	MOVLW      223
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
	NOP
;PIC887_Ahorcado.c,75 :: 		pos=0;
	CLRF       _pos+0
;PIC887_Ahorcado.c,76 :: 		llave=0;   // para pasar de una etapa del programa a otra
	CLRF       _llave+0
;PIC887_Ahorcado.c,77 :: 		pos=0;     // para determinar la posición del vector
	CLRF       _pos+0
;PIC887_Ahorcado.c,78 :: 		tam=0;     // tamaño de la palabra set
	CLRF       _tam+0
;PIC887_Ahorcado.c,79 :: 		vidas=6;  // numero de vidas
	MOVLW      6
	MOVWF      _vidas+0
;PIC887_Ahorcado.c,80 :: 		setPalabra();                                 // descomentar
	CALL       _setPalabra+0
;PIC887_Ahorcado.c,82 :: 		adivinaPalabra();
	CALL       _adivinaPalabra+0
;PIC887_Ahorcado.c,83 :: 		Lcd_Chr(1, 10, kp);                    // Print key ASCII value on LCD
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      10
	MOVWF      FARG_Lcd_Chr_column+0
	MOVF       _kp+0, 0
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;PIC887_Ahorcado.c,85 :: 		WordToStr(cnt, txt);                   // Transform counter value to string
	MOVF       _cnt+0, 0
	MOVWF      FARG_WordToStr_input+0
	CLRF       FARG_WordToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;PIC887_Ahorcado.c,86 :: 		}
	GOTO       L_main0
;PIC887_Ahorcado.c,87 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_adivinaPalabra:

;PIC887_Ahorcado.c,89 :: 		void adivinaPalabra()
;PIC887_Ahorcado.c,91 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;PIC887_Ahorcado.c,92 :: 		Glcd_Fill(0x00);
	CLRF       FARG_Glcd_Fill_pattern+0
	CALL       _Glcd_Fill+0
;PIC887_Ahorcado.c,94 :: 		Glcd_Write_Text("Adivinar:", 64, 1, 1);
	MOVLW      ?lstr1_PIC887_Ahorcado+0
	MOVWF      FARG_Glcd_Write_Text_text+0
	MOVLW      64
	MOVWF      FARG_Glcd_Write_Text_x_pos+0
	MOVLW      1
	MOVWF      FARG_Glcd_Write_Text_page_num+0
	MOVLW      1
	MOVWF      FARG_Glcd_Write_Text_color+0
	CALL       _Glcd_Write_Text+0
;PIC887_Ahorcado.c,98 :: 		Glcd_V_Line(5, 55, 50, 1);
	MOVLW      5
	MOVWF      FARG_Glcd_V_Line_y_start+0
	MOVLW      55
	MOVWF      FARG_Glcd_V_Line_y_end+0
	MOVLW      50
	MOVWF      FARG_Glcd_V_Line_x_pos+0
	MOVLW      1
	MOVWF      FARG_Glcd_V_Line_color+0
	CALL       _Glcd_V_Line+0
;PIC887_Ahorcado.c,99 :: 		Glcd_H_Line(40, 60, 55, 1);             // inicio, fin, transversal, color
	MOVLW      40
	MOVWF      FARG_Glcd_H_Line_x_start+0
	MOVLW      60
	MOVWF      FARG_Glcd_H_Line_x_end+0
	MOVLW      55
	MOVWF      FARG_Glcd_H_Line_y_pos+0
	MOVLW      1
	MOVWF      FARG_Glcd_H_Line_color+0
	CALL       _Glcd_H_Line+0
;PIC887_Ahorcado.c,100 :: 		Glcd_H_Line(25, 50, 5, 1);             // inicio, fin, transversal, color
	MOVLW      25
	MOVWF      FARG_Glcd_H_Line_x_start+0
	MOVLW      50
	MOVWF      FARG_Glcd_H_Line_x_end+0
	MOVLW      5
	MOVWF      FARG_Glcd_H_Line_y_pos+0
	MOVLW      1
	MOVWF      FARG_Glcd_H_Line_color+0
	CALL       _Glcd_H_Line+0
;PIC887_Ahorcado.c,101 :: 		Glcd_V_Line(5, 15, 25, 1);
	MOVLW      5
	MOVWF      FARG_Glcd_V_Line_y_start+0
	MOVLW      15
	MOVWF      FARG_Glcd_V_Line_y_end+0
	MOVLW      25
	MOVWF      FARG_Glcd_V_Line_x_pos+0
	MOVLW      1
	MOVWF      FARG_Glcd_V_Line_color+0
	CALL       _Glcd_V_Line+0
;PIC887_Ahorcado.c,103 :: 		tam=strlen(pCorrec);
	MOVLW      _pCorrec+0
	MOVWF      FARG_strlen_s+0
	CALL       _strlen+0
	MOVF       R0+0, 0
	MOVWF      _tam+0
;PIC887_Ahorcado.c,104 :: 		cnt=0;
	CLRF       _cnt+0
;PIC887_Ahorcado.c,105 :: 		kp=0;
	CLRF       _kp+0
;PIC887_Ahorcado.c,106 :: 		adivino=0;
	CLRF       _adivino+0
;PIC887_Ahorcado.c,107 :: 		while (vidas>0)
L_adivinaPalabra3:
	MOVLW      128
	XORLW      0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _vidas+0, 0
	SUBWF      R0+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_adivinaPalabra4
;PIC887_Ahorcado.c,109 :: 		acierto=0;
	CLRF       _acierto+0
;PIC887_Ahorcado.c,110 :: 		pos=0;
	CLRF       _pos+0
;PIC887_Ahorcado.c,111 :: 		leeLetra2();                  // enfocado a leer solo 1 letra, no 1 palabra
	CALL       _leeLetra2+0
;PIC887_Ahorcado.c,112 :: 		pos=0;
	CLRF       _pos+0
;PIC887_Ahorcado.c,113 :: 		for  (pos=0;pos<strlen(pCorrec);pos++)
	CLRF       _pos+0
L_adivinaPalabra5:
	MOVLW      _pCorrec+0
	MOVWF      FARG_strlen_s+0
	CALL       _strlen+0
	MOVLW      128
	BTFSC      _pos+0, 7
	MOVLW      127
	MOVWF      R2+0
	MOVLW      128
	XORWF      R0+1, 0
	SUBWF      R2+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__adivinaPalabra133
	MOVF       R0+0, 0
	SUBWF      _pos+0, 0
L__adivinaPalabra133:
	BTFSC      STATUS+0, 0
	GOTO       L_adivinaPalabra6
;PIC887_Ahorcado.c,115 :: 		if (!pAdiv[pos])
	MOVF       _pos+0, 0
	ADDLW      _pAdiv+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_adivinaPalabra8
;PIC887_Ahorcado.c,117 :: 		pAdiv[pos]='_';
	MOVF       _pos+0, 0
	ADDLW      _pAdiv+0
	MOVWF      FSR
	MOVLW      95
	MOVWF      INDF+0
;PIC887_Ahorcado.c,118 :: 		}
L_adivinaPalabra8:
;PIC887_Ahorcado.c,119 :: 		if(lAdiv[0]==pCorrec[pos])
	MOVF       _pos+0, 0
	ADDLW      _pCorrec+0
	MOVWF      FSR
	MOVF       _lAdiv+0, 0
	XORWF      INDF+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L_adivinaPalabra9
;PIC887_Ahorcado.c,121 :: 		if(pAdiv[pos]=='_')
	MOVF       _pos+0, 0
	ADDLW      _pAdiv+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	XORLW      95
	BTFSS      STATUS+0, 2
	GOTO       L_adivinaPalabra10
;PIC887_Ahorcado.c,123 :: 		pAdiv[pos]=lAdiv[0];
	MOVF       _pos+0, 0
	ADDLW      _pAdiv+0
	MOVWF      FSR
	MOVF       _lAdiv+0, 0
	MOVWF      INDF+0
;PIC887_Ahorcado.c,124 :: 		adivino+=1;            // bandera para indicar un acierto
	INCF       _adivino+0, 1
;PIC887_Ahorcado.c,125 :: 		acierto=1;
	MOVLW      1
	MOVWF      _acierto+0
;PIC887_Ahorcado.c,127 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC887_Ahorcado.c,128 :: 		LCD_Out(1,1,"Correcto");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_PIC887_Ahorcado+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PIC887_Ahorcado.c,129 :: 		sonido2();
	CALL       _sonido2+0
;PIC887_Ahorcado.c,130 :: 		}
L_adivinaPalabra10:
;PIC887_Ahorcado.c,131 :: 		}
L_adivinaPalabra9:
;PIC887_Ahorcado.c,113 :: 		for  (pos=0;pos<strlen(pCorrec);pos++)
	INCF       _pos+0, 1
;PIC887_Ahorcado.c,132 :: 		} //  fin for
	GOTO       L_adivinaPalabra5
L_adivinaPalabra6:
;PIC887_Ahorcado.c,133 :: 		if(acierto==0)
	MOVF       _acierto+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_adivinaPalabra11
;PIC887_Ahorcado.c,135 :: 		vidas-=1;
	DECF       _vidas+0, 1
;PIC887_Ahorcado.c,136 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;PIC887_Ahorcado.c,137 :: 		LCD_Out(1,1,"Fallo");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_PIC887_Ahorcado+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PIC887_Ahorcado.c,138 :: 		sonido1();
	CALL       _sonido1+0
;PIC887_Ahorcado.c,139 :: 		}
L_adivinaPalabra11:
;PIC887_Ahorcado.c,140 :: 		if (adivino==strlen(pCorrec))
	MOVLW      _pCorrec+0
	MOVWF      FARG_strlen_s+0
	CALL       _strlen+0
	MOVLW      0
	BTFSC      _adivino+0, 7
	MOVLW      255
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__adivinaPalabra134
	MOVF       R0+0, 0
	XORWF      _adivino+0, 0
L__adivinaPalabra134:
	BTFSS      STATUS+0, 2
	GOTO       L_adivinaPalabra12
;PIC887_Ahorcado.c,142 :: 		Glcd_Fill(0x00);
	CLRF       FARG_Glcd_Fill_pattern+0
	CALL       _Glcd_Fill+0
;PIC887_Ahorcado.c,143 :: 		while(1)
L_adivinaPalabra13:
;PIC887_Ahorcado.c,145 :: 		Glcd_Write_Text("GANADOR", 65, 1, 1);
	MOVLW      ?lstr4_PIC887_Ahorcado+0
	MOVWF      FARG_Glcd_Write_Text_text+0
	MOVLW      65
	MOVWF      FARG_Glcd_Write_Text_x_pos+0
	MOVLW      1
	MOVWF      FARG_Glcd_Write_Text_page_num+0
	MOVLW      1
	MOVWF      FARG_Glcd_Write_Text_color+0
	CALL       _Glcd_Write_Text+0
;PIC887_Ahorcado.c,146 :: 		Glcd_Write_Text("Presione", 65, 2, 1);
	MOVLW      ?lstr5_PIC887_Ahorcado+0
	MOVWF      FARG_Glcd_Write_Text_text+0
	MOVLW      65
	MOVWF      FARG_Glcd_Write_Text_x_pos+0
	MOVLW      2
	MOVWF      FARG_Glcd_Write_Text_page_num+0
	MOVLW      1
	MOVWF      FARG_Glcd_Write_Text_color+0
	CALL       _Glcd_Write_Text+0
;PIC887_Ahorcado.c,147 :: 		Glcd_Write_Text("Reset", 65, 3, 1);
	MOVLW      ?lstr6_PIC887_Ahorcado+0
	MOVWF      FARG_Glcd_Write_Text_text+0
	MOVLW      65
	MOVWF      FARG_Glcd_Write_Text_x_pos+0
	MOVLW      3
	MOVWF      FARG_Glcd_Write_Text_page_num+0
	MOVLW      1
	MOVWF      FARG_Glcd_Write_Text_color+0
	CALL       _Glcd_Write_Text+0
;PIC887_Ahorcado.c,149 :: 		}
	GOTO       L_adivinaPalabra13
;PIC887_Ahorcado.c,150 :: 		}
L_adivinaPalabra12:
;PIC887_Ahorcado.c,151 :: 		Glcd_Write_Text(pAdiv, 65, 5, 1);
	MOVLW      _pAdiv+0
	MOVWF      FARG_Glcd_Write_Text_text+0
	MOVLW      65
	MOVWF      FARG_Glcd_Write_Text_x_pos+0
	MOVLW      5
	MOVWF      FARG_Glcd_Write_Text_page_num+0
	MOVLW      1
	MOVWF      FARG_Glcd_Write_Text_color+0
	CALL       _Glcd_Write_Text+0
;PIC887_Ahorcado.c,152 :: 		switch (vidas)
	GOTO       L_adivinaPalabra15
;PIC887_Ahorcado.c,155 :: 		case  5: Glcd_Circle_Fill(25,20,5,1); break; //  cabeza
L_adivinaPalabra17:
	MOVLW      25
	MOVWF      FARG_Glcd_Circle_Fill_x_center+0
	MOVLW      0
	MOVWF      FARG_Glcd_Circle_Fill_x_center+1
	MOVLW      20
	MOVWF      FARG_Glcd_Circle_Fill_y_center+0
	MOVLW      0
	MOVWF      FARG_Glcd_Circle_Fill_y_center+1
	MOVLW      5
	MOVWF      FARG_Glcd_Circle_Fill_radius+0
	MOVLW      0
	MOVWF      FARG_Glcd_Circle_Fill_radius+1
	MOVLW      1
	MOVWF      FARG_Glcd_Circle_Fill_color+0
	CALL       _Glcd_Circle_Fill+0
	GOTO       L_adivinaPalabra16
;PIC887_Ahorcado.c,156 :: 		case  4: Glcd_V_Line(25, 38, 25, 1); break; //   tronco
L_adivinaPalabra18:
	MOVLW      25
	MOVWF      FARG_Glcd_V_Line_y_start+0
	MOVLW      38
	MOVWF      FARG_Glcd_V_Line_y_end+0
	MOVLW      25
	MOVWF      FARG_Glcd_V_Line_x_pos+0
	MOVLW      1
	MOVWF      FARG_Glcd_V_Line_color+0
	CALL       _Glcd_V_Line+0
	GOTO       L_adivinaPalabra16
;PIC887_Ahorcado.c,157 :: 		case  3: Glcd_Line(30,32,20,32,1); break; //     brazo
L_adivinaPalabra19:
	MOVLW      30
	MOVWF      FARG_Glcd_Line_x_start+0
	MOVLW      0
	MOVWF      FARG_Glcd_Line_x_start+1
	MOVLW      32
	MOVWF      FARG_Glcd_Line_y_start+0
	MOVLW      0
	MOVWF      FARG_Glcd_Line_y_start+1
	MOVLW      20
	MOVWF      FARG_Glcd_Line_x_end+0
	MOVLW      0
	MOVWF      FARG_Glcd_Line_x_end+1
	MOVLW      32
	MOVWF      FARG_Glcd_Line_y_end+0
	MOVLW      0
	MOVWF      FARG_Glcd_Line_y_end+1
	MOVLW      1
	MOVWF      FARG_Glcd_Line_color+0
	CALL       _Glcd_Line+0
	GOTO       L_adivinaPalabra16
;PIC887_Ahorcado.c,158 :: 		case  2: Glcd_Line(25,38,15,48,1); break; //     pierna
L_adivinaPalabra20:
	MOVLW      25
	MOVWF      FARG_Glcd_Line_x_start+0
	MOVLW      0
	MOVWF      FARG_Glcd_Line_x_start+1
	MOVLW      38
	MOVWF      FARG_Glcd_Line_y_start+0
	MOVLW      0
	MOVWF      FARG_Glcd_Line_y_start+1
	MOVLW      15
	MOVWF      FARG_Glcd_Line_x_end+0
	MOVLW      0
	MOVWF      FARG_Glcd_Line_x_end+1
	MOVLW      48
	MOVWF      FARG_Glcd_Line_y_end+0
	MOVLW      0
	MOVWF      FARG_Glcd_Line_y_end+1
	MOVLW      1
	MOVWF      FARG_Glcd_Line_color+0
	CALL       _Glcd_Line+0
	GOTO       L_adivinaPalabra16
;PIC887_Ahorcado.c,159 :: 		case  1: Glcd_Line(25,38,35,48,1); break; //     pierna
L_adivinaPalabra21:
	MOVLW      25
	MOVWF      FARG_Glcd_Line_x_start+0
	MOVLW      0
	MOVWF      FARG_Glcd_Line_x_start+1
	MOVLW      38
	MOVWF      FARG_Glcd_Line_y_start+0
	MOVLW      0
	MOVWF      FARG_Glcd_Line_y_start+1
	MOVLW      35
	MOVWF      FARG_Glcd_Line_x_end+0
	MOVLW      0
	MOVWF      FARG_Glcd_Line_x_end+1
	MOVLW      48
	MOVWF      FARG_Glcd_Line_y_end+0
	MOVLW      0
	MOVWF      FARG_Glcd_Line_y_end+1
	MOVLW      1
	MOVWF      FARG_Glcd_Line_color+0
	CALL       _Glcd_Line+0
	GOTO       L_adivinaPalabra16
;PIC887_Ahorcado.c,160 :: 		}
L_adivinaPalabra15:
	MOVF       _vidas+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_adivinaPalabra17
	MOVF       _vidas+0, 0
	XORLW      4
	BTFSC      STATUS+0, 2
	GOTO       L_adivinaPalabra18
	MOVF       _vidas+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_adivinaPalabra19
	MOVF       _vidas+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_adivinaPalabra20
	MOVF       _vidas+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_adivinaPalabra21
L_adivinaPalabra16:
;PIC887_Ahorcado.c,161 :: 		} // mientras haya vidas
	GOTO       L_adivinaPalabra3
L_adivinaPalabra4:
;PIC887_Ahorcado.c,162 :: 		delay_ms(1000);
	MOVLW      26
	MOVWF      R11+0
	MOVLW      94
	MOVWF      R12+0
	MOVLW      110
	MOVWF      R13+0
L_adivinaPalabra22:
	DECFSZ     R13+0, 1
	GOTO       L_adivinaPalabra22
	DECFSZ     R12+0, 1
	GOTO       L_adivinaPalabra22
	DECFSZ     R11+0, 1
	GOTO       L_adivinaPalabra22
	NOP
;PIC887_Ahorcado.c,163 :: 		while(1)
L_adivinaPalabra23:
;PIC887_Ahorcado.c,165 :: 		Glcd_Write_Text("PERDEDOR", 65, 1, 1);
	MOVLW      ?lstr7_PIC887_Ahorcado+0
	MOVWF      FARG_Glcd_Write_Text_text+0
	MOVLW      65
	MOVWF      FARG_Glcd_Write_Text_x_pos+0
	MOVLW      1
	MOVWF      FARG_Glcd_Write_Text_page_num+0
	MOVLW      1
	MOVWF      FARG_Glcd_Write_Text_color+0
	CALL       _Glcd_Write_Text+0
;PIC887_Ahorcado.c,166 :: 		Glcd_Write_Text("Presione", 65, 2, 1);
	MOVLW      ?lstr8_PIC887_Ahorcado+0
	MOVWF      FARG_Glcd_Write_Text_text+0
	MOVLW      65
	MOVWF      FARG_Glcd_Write_Text_x_pos+0
	MOVLW      2
	MOVWF      FARG_Glcd_Write_Text_page_num+0
	MOVLW      1
	MOVWF      FARG_Glcd_Write_Text_color+0
	CALL       _Glcd_Write_Text+0
;PIC887_Ahorcado.c,167 :: 		Glcd_Write_Text("Reset", 65, 3, 1);
	MOVLW      ?lstr9_PIC887_Ahorcado+0
	MOVWF      FARG_Glcd_Write_Text_text+0
	MOVLW      65
	MOVWF      FARG_Glcd_Write_Text_x_pos+0
	MOVLW      3
	MOVWF      FARG_Glcd_Write_Text_page_num+0
	MOVLW      1
	MOVWF      FARG_Glcd_Write_Text_color+0
	CALL       _Glcd_Write_Text+0
;PIC887_Ahorcado.c,168 :: 		}
	GOTO       L_adivinaPalabra23
;PIC887_Ahorcado.c,170 :: 		}
L_end_adivinaPalabra:
	RETURN
; end of _adivinaPalabra

_sonido1:

;PIC887_Ahorcado.c,172 :: 		void sonido1()
;PIC887_Ahorcado.c,174 :: 		for(so=0;so<80;so++)
	CLRF       _so+0
	CLRF       _so+1
L_sonido125:
	MOVLW      128
	XORWF      _so+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sonido1136
	MOVLW      80
	SUBWF      _so+0, 0
L__sonido1136:
	BTFSC      STATUS+0, 0
	GOTO       L_sonido126
;PIC887_Ahorcado.c,176 :: 		PORTE=255;      // on
	MOVLW      255
	MOVWF      PORTE+0
;PIC887_Ahorcado.c,177 :: 		delay_ms(2);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_sonido128:
	DECFSZ     R13+0, 1
	GOTO       L_sonido128
	DECFSZ     R12+0, 1
	GOTO       L_sonido128
	NOP
	NOP
;PIC887_Ahorcado.c,178 :: 		PORTE=0;      // off
	CLRF       PORTE+0
;PIC887_Ahorcado.c,179 :: 		delay_ms(2);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_sonido129:
	DECFSZ     R13+0, 1
	GOTO       L_sonido129
	DECFSZ     R12+0, 1
	GOTO       L_sonido129
	NOP
	NOP
;PIC887_Ahorcado.c,174 :: 		for(so=0;so<80;so++)
	INCF       _so+0, 1
	BTFSC      STATUS+0, 2
	INCF       _so+1, 1
;PIC887_Ahorcado.c,180 :: 		}
	GOTO       L_sonido125
L_sonido126:
;PIC887_Ahorcado.c,181 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_sonido130:
	DECFSZ     R13+0, 1
	GOTO       L_sonido130
	DECFSZ     R12+0, 1
	GOTO       L_sonido130
	DECFSZ     R11+0, 1
	GOTO       L_sonido130
	NOP
	NOP
;PIC887_Ahorcado.c,182 :: 		for(so=0;so<80;so++)
	CLRF       _so+0
	CLRF       _so+1
L_sonido131:
	MOVLW      128
	XORWF      _so+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sonido1137
	MOVLW      80
	SUBWF      _so+0, 0
L__sonido1137:
	BTFSC      STATUS+0, 0
	GOTO       L_sonido132
;PIC887_Ahorcado.c,184 :: 		PORTE=255;      // on
	MOVLW      255
	MOVWF      PORTE+0
;PIC887_Ahorcado.c,185 :: 		delay_ms(2);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_sonido134:
	DECFSZ     R13+0, 1
	GOTO       L_sonido134
	DECFSZ     R12+0, 1
	GOTO       L_sonido134
	NOP
	NOP
;PIC887_Ahorcado.c,186 :: 		PORTE=0;      // off
	CLRF       PORTE+0
;PIC887_Ahorcado.c,187 :: 		delay_ms(2);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_sonido135:
	DECFSZ     R13+0, 1
	GOTO       L_sonido135
	DECFSZ     R12+0, 1
	GOTO       L_sonido135
	NOP
	NOP
;PIC887_Ahorcado.c,182 :: 		for(so=0;so<80;so++)
	INCF       _so+0, 1
	BTFSC      STATUS+0, 2
	INCF       _so+1, 1
;PIC887_Ahorcado.c,188 :: 		}
	GOTO       L_sonido131
L_sonido132:
;PIC887_Ahorcado.c,189 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_sonido136:
	DECFSZ     R13+0, 1
	GOTO       L_sonido136
	DECFSZ     R12+0, 1
	GOTO       L_sonido136
	DECFSZ     R11+0, 1
	GOTO       L_sonido136
	NOP
	NOP
;PIC887_Ahorcado.c,190 :: 		for(so=0;so<80;so++)
	CLRF       _so+0
	CLRF       _so+1
L_sonido137:
	MOVLW      128
	XORWF      _so+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sonido1138
	MOVLW      80
	SUBWF      _so+0, 0
L__sonido1138:
	BTFSC      STATUS+0, 0
	GOTO       L_sonido138
;PIC887_Ahorcado.c,192 :: 		PORTE=255;      // on
	MOVLW      255
	MOVWF      PORTE+0
;PIC887_Ahorcado.c,193 :: 		delay_ms(2);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_sonido140:
	DECFSZ     R13+0, 1
	GOTO       L_sonido140
	DECFSZ     R12+0, 1
	GOTO       L_sonido140
	NOP
	NOP
;PIC887_Ahorcado.c,194 :: 		PORTE=0;      // off
	CLRF       PORTE+0
;PIC887_Ahorcado.c,195 :: 		delay_ms(2);
	MOVLW      13
	MOVWF      R12+0
	MOVLW      251
	MOVWF      R13+0
L_sonido141:
	DECFSZ     R13+0, 1
	GOTO       L_sonido141
	DECFSZ     R12+0, 1
	GOTO       L_sonido141
	NOP
	NOP
;PIC887_Ahorcado.c,190 :: 		for(so=0;so<80;so++)
	INCF       _so+0, 1
	BTFSC      STATUS+0, 2
	INCF       _so+1, 1
;PIC887_Ahorcado.c,196 :: 		}
	GOTO       L_sonido137
L_sonido138:
;PIC887_Ahorcado.c,197 :: 		}
L_end_sonido1:
	RETURN
; end of _sonido1

_sonido2:

;PIC887_Ahorcado.c,199 :: 		void sonido2()
;PIC887_Ahorcado.c,201 :: 		for(so=0;so<80;so++)
	CLRF       _so+0
	CLRF       _so+1
L_sonido242:
	MOVLW      128
	XORWF      _so+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sonido2140
	MOVLW      80
	SUBWF      _so+0, 0
L__sonido2140:
	BTFSC      STATUS+0, 0
	GOTO       L_sonido243
;PIC887_Ahorcado.c,203 :: 		PORTE=255;      // on
	MOVLW      255
	MOVWF      PORTE+0
;PIC887_Ahorcado.c,204 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_sonido245:
	DECFSZ     R13+0, 1
	GOTO       L_sonido245
	DECFSZ     R12+0, 1
	GOTO       L_sonido245
;PIC887_Ahorcado.c,205 :: 		PORTE=0;      // off
	CLRF       PORTE+0
;PIC887_Ahorcado.c,206 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_sonido246:
	DECFSZ     R13+0, 1
	GOTO       L_sonido246
	DECFSZ     R12+0, 1
	GOTO       L_sonido246
;PIC887_Ahorcado.c,201 :: 		for(so=0;so<80;so++)
	INCF       _so+0, 1
	BTFSC      STATUS+0, 2
	INCF       _so+1, 1
;PIC887_Ahorcado.c,207 :: 		}
	GOTO       L_sonido242
L_sonido243:
;PIC887_Ahorcado.c,208 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_sonido247:
	DECFSZ     R13+0, 1
	GOTO       L_sonido247
	DECFSZ     R12+0, 1
	GOTO       L_sonido247
	DECFSZ     R11+0, 1
	GOTO       L_sonido247
	NOP
	NOP
;PIC887_Ahorcado.c,209 :: 		for(so=0;so<80;so++)
	CLRF       _so+0
	CLRF       _so+1
L_sonido248:
	MOVLW      128
	XORWF      _so+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sonido2141
	MOVLW      80
	SUBWF      _so+0, 0
L__sonido2141:
	BTFSC      STATUS+0, 0
	GOTO       L_sonido249
;PIC887_Ahorcado.c,211 :: 		PORTE=255;      // on
	MOVLW      255
	MOVWF      PORTE+0
;PIC887_Ahorcado.c,212 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_sonido251:
	DECFSZ     R13+0, 1
	GOTO       L_sonido251
	DECFSZ     R12+0, 1
	GOTO       L_sonido251
;PIC887_Ahorcado.c,213 :: 		PORTE=0;      // off
	CLRF       PORTE+0
;PIC887_Ahorcado.c,214 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_sonido252:
	DECFSZ     R13+0, 1
	GOTO       L_sonido252
	DECFSZ     R12+0, 1
	GOTO       L_sonido252
;PIC887_Ahorcado.c,209 :: 		for(so=0;so<80;so++)
	INCF       _so+0, 1
	BTFSC      STATUS+0, 2
	INCF       _so+1, 1
;PIC887_Ahorcado.c,215 :: 		}
	GOTO       L_sonido248
L_sonido249:
;PIC887_Ahorcado.c,216 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_sonido253:
	DECFSZ     R13+0, 1
	GOTO       L_sonido253
	DECFSZ     R12+0, 1
	GOTO       L_sonido253
	DECFSZ     R11+0, 1
	GOTO       L_sonido253
	NOP
	NOP
;PIC887_Ahorcado.c,217 :: 		for(so=0;so<80;so++)
	CLRF       _so+0
	CLRF       _so+1
L_sonido254:
	MOVLW      128
	XORWF      _so+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sonido2142
	MOVLW      80
	SUBWF      _so+0, 0
L__sonido2142:
	BTFSC      STATUS+0, 0
	GOTO       L_sonido255
;PIC887_Ahorcado.c,219 :: 		PORTE=255;      // on
	MOVLW      255
	MOVWF      PORTE+0
;PIC887_Ahorcado.c,220 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_sonido257:
	DECFSZ     R13+0, 1
	GOTO       L_sonido257
	DECFSZ     R12+0, 1
	GOTO       L_sonido257
;PIC887_Ahorcado.c,221 :: 		PORTE=0;      // off
	CLRF       PORTE+0
;PIC887_Ahorcado.c,222 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_sonido258:
	DECFSZ     R13+0, 1
	GOTO       L_sonido258
	DECFSZ     R12+0, 1
	GOTO       L_sonido258
;PIC887_Ahorcado.c,217 :: 		for(so=0;so<80;so++)
	INCF       _so+0, 1
	BTFSC      STATUS+0, 2
	INCF       _so+1, 1
;PIC887_Ahorcado.c,223 :: 		}
	GOTO       L_sonido254
L_sonido255:
;PIC887_Ahorcado.c,224 :: 		for(so=0;so<80;so++)
	CLRF       _so+0
	CLRF       _so+1
L_sonido259:
	MOVLW      128
	XORWF      _so+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sonido2143
	MOVLW      80
	SUBWF      _so+0, 0
L__sonido2143:
	BTFSC      STATUS+0, 0
	GOTO       L_sonido260
;PIC887_Ahorcado.c,226 :: 		PORTE=255;      // on
	MOVLW      255
	MOVWF      PORTE+0
;PIC887_Ahorcado.c,227 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_sonido262:
	DECFSZ     R13+0, 1
	GOTO       L_sonido262
	DECFSZ     R12+0, 1
	GOTO       L_sonido262
;PIC887_Ahorcado.c,228 :: 		PORTE=0;      // off
	CLRF       PORTE+0
;PIC887_Ahorcado.c,229 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_sonido263:
	DECFSZ     R13+0, 1
	GOTO       L_sonido263
	DECFSZ     R12+0, 1
	GOTO       L_sonido263
;PIC887_Ahorcado.c,224 :: 		for(so=0;so<80;so++)
	INCF       _so+0, 1
	BTFSC      STATUS+0, 2
	INCF       _so+1, 1
;PIC887_Ahorcado.c,230 :: 		}
	GOTO       L_sonido259
L_sonido260:
;PIC887_Ahorcado.c,231 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_sonido264:
	DECFSZ     R13+0, 1
	GOTO       L_sonido264
	DECFSZ     R12+0, 1
	GOTO       L_sonido264
	DECFSZ     R11+0, 1
	GOTO       L_sonido264
	NOP
	NOP
;PIC887_Ahorcado.c,232 :: 		for(so=0;so<80;so++)
	CLRF       _so+0
	CLRF       _so+1
L_sonido265:
	MOVLW      128
	XORWF      _so+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sonido2144
	MOVLW      80
	SUBWF      _so+0, 0
L__sonido2144:
	BTFSC      STATUS+0, 0
	GOTO       L_sonido266
;PIC887_Ahorcado.c,234 :: 		PORTE=255;      // on
	MOVLW      255
	MOVWF      PORTE+0
;PIC887_Ahorcado.c,235 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_sonido268:
	DECFSZ     R13+0, 1
	GOTO       L_sonido268
	DECFSZ     R12+0, 1
	GOTO       L_sonido268
;PIC887_Ahorcado.c,236 :: 		PORTE=0;      // off
	CLRF       PORTE+0
;PIC887_Ahorcado.c,237 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_sonido269:
	DECFSZ     R13+0, 1
	GOTO       L_sonido269
	DECFSZ     R12+0, 1
	GOTO       L_sonido269
;PIC887_Ahorcado.c,232 :: 		for(so=0;so<80;so++)
	INCF       _so+0, 1
	BTFSC      STATUS+0, 2
	INCF       _so+1, 1
;PIC887_Ahorcado.c,238 :: 		}
	GOTO       L_sonido265
L_sonido266:
;PIC887_Ahorcado.c,239 :: 		delay_ms(50);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      69
	MOVWF      R12+0
	MOVLW      169
	MOVWF      R13+0
L_sonido270:
	DECFSZ     R13+0, 1
	GOTO       L_sonido270
	DECFSZ     R12+0, 1
	GOTO       L_sonido270
	DECFSZ     R11+0, 1
	GOTO       L_sonido270
	NOP
	NOP
;PIC887_Ahorcado.c,240 :: 		for(so=0;so<80;so++)
	CLRF       _so+0
	CLRF       _so+1
L_sonido271:
	MOVLW      128
	XORWF      _so+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__sonido2145
	MOVLW      80
	SUBWF      _so+0, 0
L__sonido2145:
	BTFSC      STATUS+0, 0
	GOTO       L_sonido272
;PIC887_Ahorcado.c,242 :: 		PORTE=255;      // on
	MOVLW      255
	MOVWF      PORTE+0
;PIC887_Ahorcado.c,243 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_sonido274:
	DECFSZ     R13+0, 1
	GOTO       L_sonido274
	DECFSZ     R12+0, 1
	GOTO       L_sonido274
;PIC887_Ahorcado.c,244 :: 		PORTE=0;      // off
	CLRF       PORTE+0
;PIC887_Ahorcado.c,245 :: 		delay_ms(1);
	MOVLW      7
	MOVWF      R12+0
	MOVLW      125
	MOVWF      R13+0
L_sonido275:
	DECFSZ     R13+0, 1
	GOTO       L_sonido275
	DECFSZ     R12+0, 1
	GOTO       L_sonido275
;PIC887_Ahorcado.c,240 :: 		for(so=0;so<80;so++)
	INCF       _so+0, 1
	BTFSC      STATUS+0, 2
	INCF       _so+1, 1
;PIC887_Ahorcado.c,246 :: 		}
	GOTO       L_sonido271
L_sonido272:
;PIC887_Ahorcado.c,247 :: 		}
L_end_sonido2:
	RETURN
; end of _sonido2

_leeLetra2:

;PIC887_Ahorcado.c,249 :: 		void leeLetra2()    // lee solo una letra, no almacena palabra
;PIC887_Ahorcado.c,251 :: 		while(1)
L_leeLetra276:
;PIC887_Ahorcado.c,253 :: 		kp = 0;
	CLRF       _kp+0
;PIC887_Ahorcado.c,254 :: 		do
L_leeLetra278:
;PIC887_Ahorcado.c,256 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;PIC887_Ahorcado.c,257 :: 		if(kp!=1){
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra281
;PIC887_Ahorcado.c,258 :: 		Glcd_Write_Text(lAdiv, 64, 3, 1);  // muestra la letra
	MOVLW      _lAdiv+0
	MOVWF      FARG_Glcd_Write_Text_text+0
	MOVLW      64
	MOVWF      FARG_Glcd_Write_Text_x_pos+0
	MOVLW      3
	MOVWF      FARG_Glcd_Write_Text_page_num+0
	MOVLW      1
	MOVWF      FARG_Glcd_Write_Text_color+0
	CALL       _Glcd_Write_Text+0
;PIC887_Ahorcado.c,259 :: 		}
L_leeLetra281:
;PIC887_Ahorcado.c,260 :: 		}while (!kp); // MIENTRAS NO SE PRESIONE UNA TECLA
	MOVF       _kp+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra278
;PIC887_Ahorcado.c,262 :: 		switch (kp)
	GOTO       L_leeLetra282
;PIC887_Ahorcado.c,265 :: 		case  2: kp = 97; break; //
L_leeLetra284:
	MOVLW      97
	MOVWF      _kp+0
	GOTO       L_leeLetra283
;PIC887_Ahorcado.c,266 :: 		case  3: kp = 100; break; //
L_leeLetra285:
	MOVLW      100
	MOVWF      _kp+0
	GOTO       L_leeLetra283
;PIC887_Ahorcado.c,268 :: 		case  5: kp = 103; break; //
L_leeLetra286:
	MOVLW      103
	MOVWF      _kp+0
	GOTO       L_leeLetra283
;PIC887_Ahorcado.c,269 :: 		case  6: kp = 106; break; //
L_leeLetra287:
	MOVLW      106
	MOVWF      _kp+0
	GOTO       L_leeLetra283
;PIC887_Ahorcado.c,270 :: 		case  7: kp = 109; break; //
L_leeLetra288:
	MOVLW      109
	MOVWF      _kp+0
	GOTO       L_leeLetra283
;PIC887_Ahorcado.c,272 :: 		case  9: kp = 112; break; //
L_leeLetra289:
	MOVLW      112
	MOVWF      _kp+0
	GOTO       L_leeLetra283
;PIC887_Ahorcado.c,273 :: 		case 10: kp = 116; break; //
L_leeLetra290:
	MOVLW      116
	MOVWF      _kp+0
	GOTO       L_leeLetra283
;PIC887_Ahorcado.c,274 :: 		case 11: kp = 119; break; //
L_leeLetra291:
	MOVLW      119
	MOVWF      _kp+0
	GOTO       L_leeLetra283
;PIC887_Ahorcado.c,276 :: 		case 13:   /////////////////////// Ok Letra /////////////////////////////
L_leeLetra292:
;PIC887_Ahorcado.c,277 :: 		oldstate=3;
	MOVLW      3
	MOVWF      _oldstate+0
;PIC887_Ahorcado.c,278 :: 		kp=0;
	CLRF       _kp+0
;PIC887_Ahorcado.c,279 :: 		cnt=0;
	CLRF       _cnt+0
;PIC887_Ahorcado.c,281 :: 		return;
	GOTO       L_end_leeLetra2
;PIC887_Ahorcado.c,284 :: 		}
L_leeLetra282:
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra284
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra285
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra286
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra287
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra288
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra289
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra290
	MOVF       _kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra291
	MOVF       _kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra292
L_leeLetra283:
;PIC887_Ahorcado.c,286 :: 		if (kp != oldstate)  // si se presiona una nueva tecla
	MOVF       _kp+0, 0
	XORWF      _oldstate+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra293
;PIC887_Ahorcado.c,288 :: 		cnt = 0;
	CLRF       _cnt+0
;PIC887_Ahorcado.c,289 :: 		oldstate = kp;
	MOVF       _kp+0, 0
	MOVWF      _oldstate+0
;PIC887_Ahorcado.c,290 :: 		}
	GOTO       L_leeLetra294
L_leeLetra293:
;PIC887_Ahorcado.c,293 :: 		if (cnt<2)                // para las teclas normales
	MOVLW      2
	SUBWF      _cnt+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_leeLetra295
;PIC887_Ahorcado.c,295 :: 		cnt++;
	INCF       _cnt+0, 1
;PIC887_Ahorcado.c,296 :: 		}
	GOTO       L_leeLetra296
L_leeLetra295:
;PIC887_Ahorcado.c,297 :: 		else if(cnt<3)            // para teclas de 4 repeticiones
	MOVLW      3
	SUBWF      _cnt+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_leeLetra297
;PIC887_Ahorcado.c,299 :: 		if((kp==80)||(kp==81)||(kp==82)||(kp==87)||(kp==88)||(kp==89)||(kp==80+32)||(kp==81+32)||(kp==82+32)||(kp==87+32)||(kp==88+32)||(kp==89+32))
	MOVF       _kp+0, 0
	XORLW      80
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra2129
	MOVF       _kp+0, 0
	XORLW      81
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra2129
	MOVF       _kp+0, 0
	XORLW      82
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra2129
	MOVF       _kp+0, 0
	XORLW      87
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra2129
	MOVF       _kp+0, 0
	XORLW      88
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra2129
	MOVF       _kp+0, 0
	XORLW      89
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra2129
	MOVLW      0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__leeLetra2147
	MOVLW      112
	XORWF      _kp+0, 0
L__leeLetra2147:
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra2129
	MOVLW      0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__leeLetra2148
	MOVLW      113
	XORWF      _kp+0, 0
L__leeLetra2148:
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra2129
	MOVLW      0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__leeLetra2149
	MOVLW      114
	XORWF      _kp+0, 0
L__leeLetra2149:
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra2129
	MOVLW      0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__leeLetra2150
	MOVLW      119
	XORWF      _kp+0, 0
L__leeLetra2150:
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra2129
	MOVLW      0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__leeLetra2151
	MOVLW      120
	XORWF      _kp+0, 0
L__leeLetra2151:
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra2129
	MOVLW      0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__leeLetra2152
	MOVLW      121
	XORWF      _kp+0, 0
L__leeLetra2152:
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra2129
	GOTO       L_leeLetra2100
L__leeLetra2129:
;PIC887_Ahorcado.c,301 :: 		cnt++;
	INCF       _cnt+0, 1
;PIC887_Ahorcado.c,302 :: 		}
L_leeLetra2100:
;PIC887_Ahorcado.c,303 :: 		}
L_leeLetra297:
L_leeLetra296:
;PIC887_Ahorcado.c,304 :: 		}
L_leeLetra294:
;PIC887_Ahorcado.c,305 :: 		kp+=cnt;
	MOVF       _cnt+0, 0
	ADDWF      _kp+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;PIC887_Ahorcado.c,306 :: 		lAdiv[pos]=kp;
	MOVF       _pos+0, 0
	ADDLW      _lAdiv+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;PIC887_Ahorcado.c,307 :: 		}
	GOTO       L_leeLetra276
;PIC887_Ahorcado.c,308 :: 		}
L_end_leeLetra2:
	RETURN
; end of _leeLetra2

_setPalabra:

;PIC887_Ahorcado.c,310 :: 		void setPalabra()
;PIC887_Ahorcado.c,312 :: 		LCD_Out(1,1,"* Ok");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr10_PIC887_Ahorcado+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PIC887_Ahorcado.c,313 :: 		LCD_Out(2,1,"# terminado");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr11_PIC887_Ahorcado+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;PIC887_Ahorcado.c,314 :: 		llave=0;
	CLRF       _llave+0
;PIC887_Ahorcado.c,315 :: 		Glcd_Write_Text("Ingrese ", 70, 1, 1);
	MOVLW      ?lstr12_PIC887_Ahorcado+0
	MOVWF      FARG_Glcd_Write_Text_text+0
	MOVLW      70
	MOVWF      FARG_Glcd_Write_Text_x_pos+0
	MOVLW      1
	MOVWF      FARG_Glcd_Write_Text_page_num+0
	MOVLW      1
	MOVWF      FARG_Glcd_Write_Text_color+0
	CALL       _Glcd_Write_Text+0
;PIC887_Ahorcado.c,316 :: 		Glcd_Write_Text("Set: ", 70, 2, 1);
	MOVLW      ?lstr13_PIC887_Ahorcado+0
	MOVWF      FARG_Glcd_Write_Text_text+0
	MOVLW      70
	MOVWF      FARG_Glcd_Write_Text_x_pos+0
	MOVLW      2
	MOVWF      FARG_Glcd_Write_Text_page_num+0
	MOVLW      1
	MOVWF      FARG_Glcd_Write_Text_color+0
	CALL       _Glcd_Write_Text+0
;PIC887_Ahorcado.c,317 :: 		pos=0;
	CLRF       _pos+0
;PIC887_Ahorcado.c,318 :: 		while(llave==0)
L_setPalabra101:
	MOVF       _llave+0, 0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L_setPalabra102
;PIC887_Ahorcado.c,320 :: 		cnt=0;
	CLRF       _cnt+0
;PIC887_Ahorcado.c,321 :: 		leeLetra();
	CALL       _leeLetra+0
;PIC887_Ahorcado.c,322 :: 		pos++;
	INCF       _pos+0, 1
;PIC887_Ahorcado.c,323 :: 		}
	GOTO       L_setPalabra101
L_setPalabra102:
;PIC887_Ahorcado.c,324 :: 		return;
;PIC887_Ahorcado.c,325 :: 		}
L_end_setPalabra:
	RETURN
; end of _setPalabra

_leeLetra:

;PIC887_Ahorcado.c,327 :: 		void leeLetra()
;PIC887_Ahorcado.c,329 :: 		while(1)
L_leeLetra103:
;PIC887_Ahorcado.c,331 :: 		kp = 0;
	CLRF       _kp+0
;PIC887_Ahorcado.c,332 :: 		do
L_leeLetra105:
;PIC887_Ahorcado.c,334 :: 		kp = Keypad_Key_Click();             // Store key code in kp variable
	CALL       _Keypad_Key_Click+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;PIC887_Ahorcado.c,335 :: 		if(kp!=1){
	MOVF       R0+0, 0
	XORLW      1
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra108
;PIC887_Ahorcado.c,336 :: 		Glcd_Write_Text(pCorrec, 70, 5, 1);  // muestra la letra
	MOVLW      _pCorrec+0
	MOVWF      FARG_Glcd_Write_Text_text+0
	MOVLW      70
	MOVWF      FARG_Glcd_Write_Text_x_pos+0
	MOVLW      5
	MOVWF      FARG_Glcd_Write_Text_page_num+0
	MOVLW      1
	MOVWF      FARG_Glcd_Write_Text_color+0
	CALL       _Glcd_Write_Text+0
;PIC887_Ahorcado.c,337 :: 		}
L_leeLetra108:
;PIC887_Ahorcado.c,338 :: 		}while (!kp); // MIENTRAS NO SE PRESIONE UNA TECLA
	MOVF       _kp+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra105
;PIC887_Ahorcado.c,340 :: 		switch (kp)
	GOTO       L_leeLetra109
;PIC887_Ahorcado.c,343 :: 		case  2: kp = 97; break; //
L_leeLetra111:
	MOVLW      97
	MOVWF      _kp+0
	GOTO       L_leeLetra110
;PIC887_Ahorcado.c,344 :: 		case  3: kp = 100; break; //
L_leeLetra112:
	MOVLW      100
	MOVWF      _kp+0
	GOTO       L_leeLetra110
;PIC887_Ahorcado.c,346 :: 		case  5: kp = 103; break; //
L_leeLetra113:
	MOVLW      103
	MOVWF      _kp+0
	GOTO       L_leeLetra110
;PIC887_Ahorcado.c,347 :: 		case  6: kp = 106; break; //
L_leeLetra114:
	MOVLW      106
	MOVWF      _kp+0
	GOTO       L_leeLetra110
;PIC887_Ahorcado.c,348 :: 		case  7: kp = 109; break; //
L_leeLetra115:
	MOVLW      109
	MOVWF      _kp+0
	GOTO       L_leeLetra110
;PIC887_Ahorcado.c,350 :: 		case  9: kp = 112; break; //
L_leeLetra116:
	MOVLW      112
	MOVWF      _kp+0
	GOTO       L_leeLetra110
;PIC887_Ahorcado.c,351 :: 		case 10: kp = 116; break; //
L_leeLetra117:
	MOVLW      116
	MOVWF      _kp+0
	GOTO       L_leeLetra110
;PIC887_Ahorcado.c,352 :: 		case 11: kp = 119; break; //
L_leeLetra118:
	MOVLW      119
	MOVWF      _kp+0
	GOTO       L_leeLetra110
;PIC887_Ahorcado.c,354 :: 		case 13:   /////////////////////// Ok Letra /////////////////////////////
L_leeLetra119:
;PIC887_Ahorcado.c,355 :: 		oldstate=3;
	MOVLW      3
	MOVWF      _oldstate+0
;PIC887_Ahorcado.c,356 :: 		kp=1;
	MOVLW      1
	MOVWF      _kp+0
;PIC887_Ahorcado.c,357 :: 		cnt=0;
	CLRF       _cnt+0
;PIC887_Ahorcado.c,359 :: 		return;
	GOTO       L_end_leeLetra
;PIC887_Ahorcado.c,362 :: 		case 15:
L_leeLetra120:
;PIC887_Ahorcado.c,363 :: 		llave=1;
	MOVLW      1
	MOVWF      _llave+0
;PIC887_Ahorcado.c,364 :: 		return;
	GOTO       L_end_leeLetra
;PIC887_Ahorcado.c,367 :: 		}
L_leeLetra109:
	MOVF       _kp+0, 0
	XORLW      2
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra111
	MOVF       _kp+0, 0
	XORLW      3
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra112
	MOVF       _kp+0, 0
	XORLW      5
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra113
	MOVF       _kp+0, 0
	XORLW      6
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra114
	MOVF       _kp+0, 0
	XORLW      7
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra115
	MOVF       _kp+0, 0
	XORLW      9
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra116
	MOVF       _kp+0, 0
	XORLW      10
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra117
	MOVF       _kp+0, 0
	XORLW      11
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra118
	MOVF       _kp+0, 0
	XORLW      13
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra119
	MOVF       _kp+0, 0
	XORLW      15
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra120
L_leeLetra110:
;PIC887_Ahorcado.c,369 :: 		if (kp != oldstate)  // si se presiona una nueva tecla
	MOVF       _kp+0, 0
	XORWF      _oldstate+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_leeLetra121
;PIC887_Ahorcado.c,371 :: 		cnt = 0;
	CLRF       _cnt+0
;PIC887_Ahorcado.c,372 :: 		oldstate = kp;
	MOVF       _kp+0, 0
	MOVWF      _oldstate+0
;PIC887_Ahorcado.c,373 :: 		}
	GOTO       L_leeLetra122
L_leeLetra121:
;PIC887_Ahorcado.c,376 :: 		if (cnt<2)                // para las teclas normales
	MOVLW      2
	SUBWF      _cnt+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_leeLetra123
;PIC887_Ahorcado.c,378 :: 		cnt++;
	INCF       _cnt+0, 1
;PIC887_Ahorcado.c,379 :: 		}
	GOTO       L_leeLetra124
L_leeLetra123:
;PIC887_Ahorcado.c,380 :: 		else if(cnt<3)            // para teclas de 4 repeticiones
	MOVLW      3
	SUBWF      _cnt+0, 0
	BTFSC      STATUS+0, 0
	GOTO       L_leeLetra125
;PIC887_Ahorcado.c,382 :: 		if((kp==80)||(kp==81)||(kp==82)||(kp==87)||(kp==88)||(kp==89)||(kp==80+32)||(kp==81+32)||(kp==82+32)||(kp==87+32)||(kp==88+32)||(kp==89+32))
	MOVF       _kp+0, 0
	XORLW      80
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra130
	MOVF       _kp+0, 0
	XORLW      81
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra130
	MOVF       _kp+0, 0
	XORLW      82
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra130
	MOVF       _kp+0, 0
	XORLW      87
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra130
	MOVF       _kp+0, 0
	XORLW      88
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra130
	MOVF       _kp+0, 0
	XORLW      89
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra130
	MOVLW      0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__leeLetra155
	MOVLW      112
	XORWF      _kp+0, 0
L__leeLetra155:
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra130
	MOVLW      0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__leeLetra156
	MOVLW      113
	XORWF      _kp+0, 0
L__leeLetra156:
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra130
	MOVLW      0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__leeLetra157
	MOVLW      114
	XORWF      _kp+0, 0
L__leeLetra157:
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra130
	MOVLW      0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__leeLetra158
	MOVLW      119
	XORWF      _kp+0, 0
L__leeLetra158:
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra130
	MOVLW      0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__leeLetra159
	MOVLW      120
	XORWF      _kp+0, 0
L__leeLetra159:
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra130
	MOVLW      0
	XORLW      0
	BTFSS      STATUS+0, 2
	GOTO       L__leeLetra160
	MOVLW      121
	XORWF      _kp+0, 0
L__leeLetra160:
	BTFSC      STATUS+0, 2
	GOTO       L__leeLetra130
	GOTO       L_leeLetra128
L__leeLetra130:
;PIC887_Ahorcado.c,384 :: 		cnt++;
	INCF       _cnt+0, 1
;PIC887_Ahorcado.c,385 :: 		}
L_leeLetra128:
;PIC887_Ahorcado.c,386 :: 		}
L_leeLetra125:
L_leeLetra124:
;PIC887_Ahorcado.c,387 :: 		}
L_leeLetra122:
;PIC887_Ahorcado.c,388 :: 		WordToStr(cnt, txt);                   // Transform counter value to string
	MOVF       _cnt+0, 0
	MOVWF      FARG_WordToStr_input+0
	CLRF       FARG_WordToStr_input+1
	MOVLW      _txt+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;PIC887_Ahorcado.c,389 :: 		kp+=cnt;
	MOVF       _cnt+0, 0
	ADDWF      _kp+0, 0
	MOVWF      R0+0
	MOVF       R0+0, 0
	MOVWF      _kp+0
;PIC887_Ahorcado.c,390 :: 		pCorrec[pos]=kp;
	MOVF       _pos+0, 0
	ADDLW      _pCorrec+0
	MOVWF      FSR
	MOVF       R0+0, 0
	MOVWF      INDF+0
;PIC887_Ahorcado.c,391 :: 		}
	GOTO       L_leeLetra103
;PIC887_Ahorcado.c,392 :: 		}
L_end_leeLetra:
	RETURN
; end of _leeLetra
