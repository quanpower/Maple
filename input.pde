void setup() {
    pinMode(0,INPUT);   // 设定PIN0引脚为输出模式,INPUT_PULLUP
}

void loop() {
    SerialUSB.println(digitalRead(0)); //通过USB虚拟串口返回读取的值
    delay(1000);    //延时1000毫秒,也就是1秒
}
