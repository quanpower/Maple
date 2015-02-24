//引用库
#include <LiquidCrystal.h>

//初始化
LiquidCrystal lcd(12,11,5,4,3,2);

//创建字符模板
//心
byte heart[8] = {
  0b00000,
  0b01010,
  0b11111,
  0b11111,
  0b11111,
  0b01110,
  0b00100,
  0b00000
};

//定义笑脸符号
byte smiley[8] = {
  0b00000,
  0b00000,
  0b01010,
  0b00000,
  0b00000,
  0b10001,
  0b01110,
  0b00000
};

//定义手臂向下的小人符号
byte armsDown[8] = {
  0b00100,
  0b01010,
  0b00100,
  0b00100,
  0b01110,
  0b10101,
  0b00100,
  0b01010
};

//定义手臂向上的小人符号
byte armsUp[8] = {
  0b00100,
  0b01010,
  0b00100,
  0b10101,
  0b01110,
  0b00100,
  0b00100,
  0b01010
};

void setup(){
  //向液晶屏存入上面自定义的字符
  lcd.createChar(0, heart);
  lcd.createChar(1, smiley);
  lcd.createChar(2, armsDown);
  lcd.createChar(3, armsUp);
  
  //设定屏幕的行列数
  lcd.begin(16, 2);
  lcd.print("I");
  
  lcd.write(0);//显示自定义的心形
  
  lcd.print("my Character!");
  
  lcd.write(1);//显示自定义的笑脸
}

void loop() {
  //在第4列第一行交替写入手臂上下挥动的小人
  lcd.setCursor(4, 1);
  lcd.write(2);
  delay(500);
  
  lcd.setCursor(4, 1);
  lcd.write(3);
  delay(500);
}
