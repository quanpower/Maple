int prc = 1024;//设定闪烁的分辨率
int factor = 5;//设定每单位延时长度

void setup() {
    pinMode(BOARD_LED_PIN, OUTPUT); // 设定LED引脚为输出模式
}

int cuve(int i){
  //将i取sin函数，使渐变变得圆滑，将得到的-1~1的double类型变量映射到0 ~ prc之间才能用于占空率的控制
  double k = (double) i;
  k = sin(k/prc*2*PI);//将K映射到2*PI并取sin
  i = (int) (k*prc/2)+prc/2;//将得到的结果平移到0`~ prc之间
  return i;
}

void loop() {
  for(int i = 0;i <= prc;i++){
    digitalWrite(BOARD_LED_PIN, HIGH); // 设定LED引脚为高电平,点亮LED
    //delay(1000);                     // 等待1秒钟
    delayMicroseconds(cuve(i)*factor+1);
    digitalWrite(BOARD_LED_PIN, LOW); // 设定LED引脚为低电平,熄灭LED
    //delay(1000);                     // 等待1秒钟
    delayMicroseconds((prc-cuve(i))*factor+1);
  }
}
