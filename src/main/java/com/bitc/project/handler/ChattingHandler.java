package com.bitc.project.handler;

import org.json.JSONObject;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

@Component
@Log4j2
public class ChattingHandler extends TextWebSocketHandler {
  
    private List<WebSocketSession> list = new ArrayList<>();
    // https://dev-gorany.tistory.com/3
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String payload = message.getPayload();
        log.info("payload : " + payload);
        for(WebSocketSession sess: list) {
            sess.sendMessage(message);
        }
    }
    /*
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String payload = message.getPayload();
        JSONObject jsonObject = new JSONObject(payload);
        for (WebSocketSession s : sessions) {
            s.sendMessage(new TextMessage("Hi " + jsonObject.getString("user") + "!"));
        }
    }
    */
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        list.add(session);
        // sessions.add(session);
        log.info(session + " 클라이언트 접속");
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	System.out.println(session + "나감");
        log.info(session + " 클라이언트 접속 해제");
        list.remove(session);
        // sessions.remove(session);
    }
}