import processing.serial.*;  // 라이브러리에서 Serial 라이브러리를 선택해 준다.

Serial port;                 // Serial 의 변수 선언
int val;

void setup(){
  size(800, 800);  // 화면 크기를 800x800으로 설정
  noStroke();
  colorMode(HSB, 255);  // 색상 모드를 HSB로 설정
  printArray(Serial.list());  // 아두이노가 연결된 포트 번호 출력하기
  String portName = Serial.list()[0];  // 아두이노 포트 이름을 문자열 변수에 저장하기, 첫번째 ([0]) 포트가 아닌 여러 포트중 다른 포트를 사용하려면 [ ] 안의 숫자를 바꾸면 된다.
  port = new Serial(this, portName, 9600);  // 연결되어있는 포트를 같은 속도(9600bps)로 열기
}

void draw(){
  if (port.available() > 0) {  // 만약 데이터를 읽을 수 있다면 (0이거나 0보다 작다면 데이터를 읽을 수 없는 상태)
    val = port.read();         // 아두이노의 데이터를 읽고 val에 저장
  }
  background(204);
  fill(val, 255, 255);  // HSB 모드에서 색상을 설정
  rect(0, 0, width, height);  // 사각형을 화면 전체 크기로 그린다.
  println(val);  // val 값 확인
}
