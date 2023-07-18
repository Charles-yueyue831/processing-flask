import processing.net.*;

Client client;
String serverIP = "127.0.0.1";
int serverPort = 1252;

void setup() {
  size(400, 200);
  client = new Client(this, serverIP, serverPort);
  
  // 向Flask发送GET请求
  //String dataToSend = "Hello, Flask!";
  String dataToSend = "name=" + urlEncode("John Doe") + "&age=" + urlEncode("30") + "&email=" + urlEncode("john@example.com");
  client.write("GET /ajax HTTP/1.1\r\n");
  client.write("Host: " + serverIP + "\r\n");
  client.write("Content-Type: application/x-www-form-urlencoded\r\n");
  client.write("Content-Length: " + dataToSend.length() + "\r\n");
  client.write("\r\n");
  client.write(dataToSend);
}

void draw() {
  // 检查是否有响应
  if (client.available() > 0) {
    // 读取响应
    String response = client.readString();
    println("Received response: \n" + response);
    // 关闭连接
    client.stop();
  }
}
