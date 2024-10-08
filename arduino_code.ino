int val;  // 프로세싱에서 보내는 시리얼 포트 값을 저장하기 위한 변수
const int sensorPin = A0;  // LM393 센서가 연결된 아날로그 핀

void setup() {
  Serial.begin(9600);      // 9600bps로 컴퓨터와 시리얼 통신 시작
}

void loop() {
  val = analogRead(sensorPin) / 4;  // 아날로그 핀의 값을 읽고 0~255 범위로 변환
  Serial.write(val);                // 프로세싱으로 val의 값을 보냄
  delay(100);                       // 0.1초 동안 스케치를 멈추고 응답을 기다린다.
}
