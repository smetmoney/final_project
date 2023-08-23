package com.bitc.project.handler;

// import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j2;

@Component
@Log4j2
public class ChattingHandler extends TextWebSocketHandler {
  
	// 연결된 모든 유저
    private List<WebSocketSession> list = new ArrayList<>();
    // https://dev-gorany.tistory.com/3
    // https://innu3368.tistory.com/214
    private Map<String, List<WebSocketSession>> room = new HashMap<>();

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        
    	String payload = message.getPayload();
        String[] code = payload.split(":");
        System.out.println(payload);
        
        if (code[0].equals("ENTER")) {
            String roomCode = code[1];
            // Initialize the room if not exists
            room.putIfAbsent(roomCode, new ArrayList<>());
            List<WebSocketSession> roomSessions = room.get(roomCode);
            roomSessions.add(session);
            for (WebSocketSession user : roomSessions) {
            	if(user.isOpen()) {
            		user.sendMessage(new TextMessage(code[2]+"님이 접속하였습니다!"));
            	}
            }
        }else {
        	System.out.println("여기 들어왔니 혹시?");
        	List<WebSocketSession> roomSessions = room.get(code[0]);
            for (WebSocketSession user : roomSessions) {
            	if(user.isOpen()) {
            		user.sendMessage(new TextMessage(code[1]+":"+code[2]));
            	}
            }
        }
        log.info("payload: " + payload);
    }
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        list.add(session);
        log.info(session + " 클라이언트 접속");
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	list.remove(session);
        log.info(session + " 클라이언트 접속 해제");
    }
    
}