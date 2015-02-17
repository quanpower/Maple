void setup() {
    pinMode(BOARD_LED_PIN, OUTPUT); // 设定LED引脚为输出模式
}

void loop() {
    digitalWrite(BOARD_LED_PIN, HIGH); // 设定LED引脚为高电平,点亮LED
    delay(1000);                     // 等待1秒钟
    digitalWrite(BOARD_LED_PIN, LOW); // 设定LED引脚为低电平,熄灭LED
    delay(1000);                     // 等待1秒钟
}
