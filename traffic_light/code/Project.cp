#line 1 "C:/Users/Eng.Abdoulla/OneDrive - Benha University (Faculty Of engineering)/Desktop/first_project/flasher/traffic_light/code/Project.c"
void main() {
 int counter=0,i,j;
 trisb=0;
 portb=0;
 trisc=0b11000000;
 RC0_bit=RC1_bit=RC2_bit=RC3_bit=RC4_bit=RC5_bit=0;
 trisd=0;
 portd=0;
 while(1){
 if(RC6_bit==0){
 RC0_bit=RC4_bit=RC5_bit=0;
 for(i=35;i>0;i--){
 portc.RC3=1;
 portb=i;
 portd=i;
 if(i>32){
 portc.b1=1;
 portc.b2=0;
 }
 else{
 portc.b1=0;
 portc.b2=1;
 }
 if(RC6_bit==1)
 break;
 delay_ms(1000);
 if(i==32)
 i=26;
 else if(i==16)
 i=10;
 }
 }
 if(RC6_bit==0){
 RC1_bit=RC2_bit=RC3_bit=0;
 for(i=21;i>0;i--){
 portc.RC0=1;
 portb=i;
 portd=i;
 if(i>18){
 portc.b4=1;
 portc.b5=0;
 }
 else{
 portc.b4=0;
 portc.b5=1;
 }
 if(RC6_bit==1)
 break;
 delay_ms(1000);
 if(i==16)
 i=10;

 }
 }
 if(RC6_bit==1){
 if(RC7_bit==0){
 if(RC3_bit==1&&RC1_bit==1){
 delay_ms(3000);
 RC1_bit=0;
 RC2_bit=1;
 }
 else if(RC3_bit==1&&RC2_bit==1){
 while(RC7_bit==0){}
 RC3_bit=RC2_bit=0;
 RC0_bit=RC4_bit=1;
 }
 else if(RC0_bit==1&&RC4_bit==1){
 delay_ms(3000);
 RC4_bit=0;
 RC5_bit=1;
 }
 else{
 while(RC7_bit==0){}
 RC0_bit=RC5_bit=0;
 RC3_bit=RC1_bit=1;
 }
 }
 }
 }

}
