#line 1 "E:/trabajo/2022/PIC_Ahorcado/PIC887_Ahorcado.c"
char GLCD_DataPort at PORTD;

sbit GLCD_CS1 at RB0_bit;
sbit GLCD_CS2 at RB1_bit;
sbit GLCD_RS at RB2_bit;
sbit GLCD_RW at RB3_bit;
sbit GLCD_EN at RB4_bit;
sbit GLCD_RST at RB5_bit;

sbit GLCD_CS1_Direction at TRISB0_bit;
sbit GLCD_CS2_Direction at TRISB1_bit;
sbit GLCD_RS_Direction at TRISB2_bit;
sbit GLCD_RW_Direction at TRISB3_bit;
sbit GLCD_EN_Direction at TRISB4_bit;
sbit GLCD_RST_Direction at TRISB5_bit;


unsigned short kp, cnt, oldstate = 0;
short llave=0;
short pos=0;
char pCorrec[10]="";
char pAdiv[10]="";
char lAdiv[2]="";
char txt[10];
short tam=0;
short vidas=6;
short adivino=0;
short acierto=0;
int so=0;


char keypadPort at PORTC;



sbit LCD_RS at RA4_bit;
sbit LCD_EN at RA5_bit;
sbit LCD_D4 at RA0_bit;
sbit LCD_D5 at RA1_bit;
sbit LCD_D6 at RA2_bit;
sbit LCD_D7 at RA3_bit;

sbit LCD_RS_Direction at TRISA4_bit;
sbit LCD_EN_Direction at TRISA5_bit;
sbit LCD_D4_Direction at TRISA0_bit;
sbit LCD_D5_Direction at TRISA1_bit;
sbit LCD_D6_Direction at TRISA2_bit;
sbit LCD_D7_Direction at TRISA3_bit;

void setPalabra(void);
void leeLetra(void);
void adivinaPalabra();
void leeLetra2();
void sonido1();
void sonido2();

void main()
{
 ANSEL = 0;
 ANSELH = 0;
 TRISE=0;
 cnt = 0;

 Keypad_Init();
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Glcd_Init();
 Glcd_Fill(0x00);

 while(1)
 {
 porte=3;
 delay_ms(2000);
 pos=0;
 llave=0;
 pos=0;
 tam=0;
 vidas=6;
 setPalabra();

 adivinaPalabra();
 Lcd_Chr(1, 10, kp);

 WordToStr(cnt, txt);
 }
}

void adivinaPalabra()
{
 Lcd_Init();
 Glcd_Fill(0x00);

 Glcd_Write_Text("Adivinar:", 64, 1, 1);



 Glcd_V_Line(5, 55, 50, 1);
 Glcd_H_Line(40, 60, 55, 1);
 Glcd_H_Line(25, 50, 5, 1);
 Glcd_V_Line(5, 15, 25, 1);

 tam=strlen(pCorrec);
 cnt=0;
 kp=0;
 adivino=0;
 while (vidas>0)
 {
 acierto=0;
 pos=0;
 leeLetra2();
 pos=0;
 for (pos=0;pos<strlen(pCorrec);pos++)
 {
 if (!pAdiv[pos])
 {
 pAdiv[pos]='_';
 }
 if(lAdiv[0]==pCorrec[pos])
 {
 if(pAdiv[pos]=='_')
 {
 pAdiv[pos]=lAdiv[0];
 adivino+=1;
 acierto=1;

 Lcd_Cmd(_LCD_CLEAR);
 LCD_Out(1,1,"Correcto");
 sonido2();
 }
 }
 }
 if(acierto==0)
 {
 vidas-=1;
 Lcd_Cmd(_LCD_CLEAR);
 LCD_Out(1,1,"Fallo");
 sonido1();
 }
 if (adivino==strlen(pCorrec))
 {
 Glcd_Fill(0x00);
 while(1)
 {
 Glcd_Write_Text("GANADOR", 65, 1, 1);
 Glcd_Write_Text("Presione", 65, 2, 1);
 Glcd_Write_Text("Reset", 65, 3, 1);

 }
 }
 Glcd_Write_Text(pAdiv, 65, 5, 1);
 switch (vidas)
 {

 case 5: Glcd_Circle_Fill(25,20,5,1); break;
 case 4: Glcd_V_Line(25, 38, 25, 1); break;
 case 3: Glcd_Line(30,32,20,32,1); break;
 case 2: Glcd_Line(25,38,15,48,1); break;
 case 1: Glcd_Line(25,38,35,48,1); break;
 }
 }
 delay_ms(1000);
 while(1)
 {
 Glcd_Write_Text("PERDEDOR", 65, 1, 1);
 Glcd_Write_Text("Presione", 65, 2, 1);
 Glcd_Write_Text("Reset", 65, 3, 1);
 }

}

void sonido1()
{
 for(so=0;so<80;so++)
 {
 PORTE=255;
 delay_ms(2);
 PORTE=0;
 delay_ms(2);
 }
 delay_ms(50);
 for(so=0;so<80;so++)
 {
 PORTE=255;
 delay_ms(2);
 PORTE=0;
 delay_ms(2);
 }
 delay_ms(50);
 for(so=0;so<80;so++)
 {
 PORTE=255;
 delay_ms(2);
 PORTE=0;
 delay_ms(2);
 }
}

void sonido2()
{
 for(so=0;so<80;so++)
 {
 PORTE=255;
 delay_ms(1);
 PORTE=0;
 delay_ms(1);
 }
 delay_ms(50);
 for(so=0;so<80;so++)
 {
 PORTE=255;
 delay_ms(1);
 PORTE=0;
 delay_ms(1);
 }
 delay_ms(50);
 for(so=0;so<80;so++)
 {
 PORTE=255;
 delay_ms(1);
 PORTE=0;
 delay_ms(1);
 }
 for(so=0;so<80;so++)
 {
 PORTE=255;
 delay_ms(1);
 PORTE=0;
 delay_ms(1);
 }
 delay_ms(50);
 for(so=0;so<80;so++)
 {
 PORTE=255;
 delay_ms(1);
 PORTE=0;
 delay_ms(1);
 }
 delay_ms(50);
 for(so=0;so<80;so++)
 {
 PORTE=255;
 delay_ms(1);
 PORTE=0;
 delay_ms(1);
 }
}

void leeLetra2()
{
 while(1)
 {
 kp = 0;
 do
 {
 kp = Keypad_Key_Click();
 if(kp!=1){
 Glcd_Write_Text(lAdiv, 64, 3, 1);
 }
 }while (!kp);

 switch (kp)
 {

 case 2: kp = 97; break;
 case 3: kp = 100; break;

 case 5: kp = 103; break;
 case 6: kp = 106; break;
 case 7: kp = 109; break;

 case 9: kp = 112; break;
 case 10: kp = 116; break;
 case 11: kp = 119; break;

 case 13:
 oldstate=3;
 kp=0;
 cnt=0;

 return;
 break;

 }

 if (kp != oldstate)
 {
 cnt = 0;
 oldstate = kp;
 }
 else
 {
 if (cnt<2)
 {
 cnt++;
 }
 else if(cnt<3)
 {
 if((kp==80)||(kp==81)||(kp==82)||(kp==87)||(kp==88)||(kp==89)||(kp==80+32)||(kp==81+32)||(kp==82+32)||(kp==87+32)||(kp==88+32)||(kp==89+32))
 {
 cnt++;
 }
 }
 }
 kp+=cnt;
 lAdiv[pos]=kp;
 }
}

void setPalabra()
{
 LCD_Out(1,1,"* Ok");
 LCD_Out(2,1,"# terminado");
 llave=0;
 Glcd_Write_Text("Ingrese ", 70, 1, 1);
 Glcd_Write_Text("Set: ", 70, 2, 1);
 pos=0;
 while(llave==0)
 {
 cnt=0;
 leeLetra();
 pos++;
 }
 return;
}

void leeLetra()
{
 while(1)
 {
 kp = 0;
 do
 {
 kp = Keypad_Key_Click();
 if(kp!=1){
 Glcd_Write_Text(pCorrec, 70, 5, 1);
 }
 }while (!kp);

 switch (kp)
 {

 case 2: kp = 97; break;
 case 3: kp = 100; break;

 case 5: kp = 103; break;
 case 6: kp = 106; break;
 case 7: kp = 109; break;

 case 9: kp = 112; break;
 case 10: kp = 116; break;
 case 11: kp = 119; break;

 case 13:
 oldstate=3;
 kp=1;
 cnt=0;

 return;
 break;

 case 15:
 llave=1;
 return;
 break;

 }

 if (kp != oldstate)
 {
 cnt = 0;
 oldstate = kp;
 }
 else
 {
 if (cnt<2)
 {
 cnt++;
 }
 else if(cnt<3)
 {
 if((kp==80)||(kp==81)||(kp==82)||(kp==87)||(kp==88)||(kp==89)||(kp==80+32)||(kp==81+32)||(kp==82+32)||(kp==87+32)||(kp==88+32)||(kp==89+32))
 {
 cnt++;
 }
 }
 }
 WordToStr(cnt, txt);
 kp+=cnt;
 pCorrec[pos]=kp;
 }
}
