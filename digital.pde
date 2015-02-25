//设置连接到段码的阴极引脚
int a = 0;
int b = 1;
int c = 2;
int d = 3;
int e = 4;
int f = 5;
int g = 6;
int dp = 7;

//设置阳极引脚
int d1 = 8;
int d2 = 9;
int d3 = 10;

//初始化段码引脚
void initSegDisplay(){
  pinMode(a, OUTPUT);
  pinMode(b, OUTPUT);
  pinMode(c, OUTPUT);
  pinMode(d, OUTPUT);
  pinMode(e, OUTPUT);
  pinMode(f, OUTPUT);
  pinMode(g, OUTPUT);
  pinMode(dp, OUTPUT);
  pinMode(d1, OUTPUT);
  pinMode(d2, OUTPUT);
  pinMode(d3, OUTPUT);
}

//每一位的显示
void DisplayS(int n,int x){
//清空每位
  digitalWrite(d1, LOW);
  digitalWrite(d2, LOW);
  digitalWrite(d3, LOW);

  if(x==1){
    digitalWrite(d1, HIGH);
    }  
  else if(x==2){
    digitalWrite(d2, HIGH);
  }
  else if(x==3){
    digitalWrite(d3, HIGH);
  }

//n为10~20时为其个位加上小数点
  if(n>9 && n<21){
    n = n-10;
    digitalWrite(dp, LOW);
  }
  else {
    digitalWrite(dp, HIGH);
  }

//显示0~9以及“E”、“”和“-”的字符模板
  if(n==0){
    digitalWrite(a, LOW);
    digitalWrite(b, LOW);
    digitalWrite(c, LOW);
    digitalWrite(d, LOW);
    digitalWrite(e, LOW);
    digitalWrite(f, LOW);
    digitalWrite(g, HIGH);
    }
  else if(n==1){
    digitalWrite(a, HIGH);
    digitalWrite(b, LOW);
    digitalWrite(c, LOW);
    digitalWrite(d, HIGH);
    digitalWrite(e, HIGH);
    digitalWrite(f, HIGH);
    digitalWrite(g, HIGH);     
  }
  else if(n==2){
    digitalWrite(a, LOW);
    digitalWrite(b, LOW);
    digitalWrite(c, HIGH);
    digitalWrite(d, LOW);
    digitalWrite(e, LOW);
    digitalWrite(f, HIGH);
    digitalWrite(g, LOW);     
  }
  else if(n==3){
    digitalWrite(a, LOW);
    digitalWrite(b, LOW);
    digitalWrite(c, LOW);
    digitalWrite(d, LOW);
    digitalWrite(e, HIGH);
    digitalWrite(f, HIGH);
    digitalWrite(g, LOW);     
  }
  else if(n==4){
    digitalWrite(a, HIGH);
    digitalWrite(b, LOW);
    digitalWrite(c, LOW);
    digitalWrite(d, HIGH);
    digitalWrite(e, HIGH);
    digitalWrite(f, LOW);
    digitalWrite(g, LOW);     
  }
  else if(n==5){
    digitalWrite(a, LOW);
    digitalWrite(b, HIGH);
    digitalWrite(c, LOW);
    digitalWrite(d, LOW);
    digitalWrite(e, HIGH);
    digitalWrite(f, LOW);
    digitalWrite(g, LOW);     
  }
  else if(n==6){
    digitalWrite(a, LOW);
    digitalWrite(b, HIGH);
    digitalWrite(c, LOW);
    digitalWrite(d, LOW);
    digitalWrite(e, LOW);
    digitalWrite(f, LOW);
    digitalWrite(g, LOW);     
  }
  else if(n==7){
    digitalWrite(a, LOW);
    digitalWrite(b, LOW);
    digitalWrite(c, LOW);
    digitalWrite(d, HIGH);
    digitalWrite(e, HIGH);
    digitalWrite(f, HIGH);
    digitalWrite(g, HIGH);     
  }
  else if(n==8){
    digitalWrite(a, LOW);
    digitalWrite(b, LOW);
    digitalWrite(c, LOW);
    digitalWrite(d, LOW);
    digitalWrite(e, LOW);
    digitalWrite(f, LOW);
    digitalWrite(g, LOW);     
  }
  else if(n==9){
    digitalWrite(a, LOW);
    digitalWrite(b, LOW);
    digitalWrite(c, LOW);
    digitalWrite(d, LOW);
    digitalWrite(e, HIGH);
    digitalWrite(f, LOW);
    digitalWrite(g, LOW);     
  }
  else if(n==21){//n==21时显示负号
    digitalWrite(a, HIGH);
    digitalWrite(b, HIGH);
    digitalWrite(c, HIGH);
    digitalWrite(d, HIGH);
    digitalWrite(e, HIGH);
    digitalWrite(f, HIGH);
    digitalWrite(g, LOW);     
  }
  else if(n==22){//n==22时无显示
    digitalWrite(a, HIGH);
    digitalWrite(b, HIGH);
    digitalWrite(c, HIGH);
    digitalWrite(d, HIGH);
    digitalWrite(e, HIGH);
    digitalWrite(f, HIGH);
    digitalWrite(g, HIGH);     
  }
  else if(n==23){//n==23时显示E
    digitalWrite(a, LOW);
    digitalWrite(b, HIGH);
    digitalWrite(c, HIGH);
    digitalWrite(d, LOW);
    digitalWrite(e, LOW);
    digitalWrite(f, LOW);
    digitalWrite(g, LOW);     
  }
  delay(5);

}

//显示正整数的函数，每次会显示约5ms*4=20ms
void Display(unsigned int n){
  if(n<999){//如果需要显示的数字大于999是无法被显示的
    if(n>99){//n在100~999之间
      DisplayS(n/100,3);
      DisplayS((n%100)/10,2);
      DisplayS(n%10,1);        
    }
    else if(n>9){//n在10~99间最高位无显示
      DisplayS(22,3);
      DisplayS(n/10,2);
      DisplayS(n%10,1);
    }
    else if(n>=0){//n为个位时，最高2位无显示
      DisplayS(22,3);
      DisplayS(22,2);
      DisplayS(n,1);
    } 
  }
  else{//如果n大于999，显示E表示错误
    DisplayE();
  }
}

//显示整数
void Display(int n){
  if(n>=0){//当这个整数为正时直接用显示无符号的整数函数处理
    Display((unsigned int) n);  
  }
  else if(-100<n){//当n为-99~0时可以被显示
    DisplayS(21,3);//最高位显示负号
    n = 0-n;//n转为正数
    if(n>9){
      DisplayS(n/10,2);
      DisplayS(n%10,1);
    }
    else if(n>0){
      DisplayS(22,2);
      DisplayS(n,1);
    }
  }
  else{
    DisplayE();
  }
}

//显示错误时显示的符号E
void DisplayE(){
  DisplayS(22,3);
  DisplayS(22,2);
  DisplayS(23,1);
}

void setup(){
  initSegDisplay();//初始化段码显示的引脚
  for(int i=-110; i<1100; i=i+5){
    for(int j=0; j<50; j++){
      Display(i);
    }
  }
}

int v = 0;

void loop(){
//显示引脚15 ADC 读取的电压
  v = analogRead(15);
  for(int k=0; k<5; k++){
    Display(v);
      
  }
}
