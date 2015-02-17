void setup() {
    //将需要的引脚设定为数字输出
    pinMode(12, OUTPUT);
    pinMode(11, OUTPUT);
    pinMode(10, OUTPUT);
}
void loop() {
    uint16 data = 500;
    // 引脚10输出高电平表示一个数据传输开始
    digitalWrite(10,HIGH);
    // 移出高位
    shiftOut(12, 11, MSBFIRST, (data >> 8));
    // 移出低位
    shiftOut(12, 11, MSBFIRST, data);
    // 引脚10输出低电平表示一个数据传输结束
    digitalWrite(10,LOW);
}
