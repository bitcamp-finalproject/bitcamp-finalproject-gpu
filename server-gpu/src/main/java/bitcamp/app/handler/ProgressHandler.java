package bitcamp.app.handler;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class ProgressHandler extends TextWebSocketHandler {

  private final Set<WebSocketSession> sessions = ConcurrentHashMap.newKeySet();

  @Override
  protected void handleTextMessage(WebSocketSession session, TextMessage message) throws IOException {
    // 클라이언트로부터 메시지를 받았을 때 수행할 작업을 구현합니다.
  }

  @Override
  public void afterConnectionEstablished(WebSocketSession session) {
    sessions.add(session);
  }

  @Override
  public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
    sessions.remove(session);
  }

  // 프로그레스를 클라이언트에게 전송하는 메소드
  public void sendProgress(String progress, WebSocketSession session) {
    try {
      session.sendMessage(new TextMessage(progress));

    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  // 현재 연결된 WebSocket 세션들을 반환하는 메소드
  public Set<WebSocketSession> getSessions() {
    return sessions;
  }
}
