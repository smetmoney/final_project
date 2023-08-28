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

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@Component
public class ChattingHandler extends TextWebSocketHandler {
  
    private List<WebSocketSession> list = new ArrayList<>();
    private Map<String, List<WebSocketSession>> room = new HashMap<>();

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        
    	String payload = message.getPayload();
        String[] code = payload.split(":");  
        
        if(code[0].equals("ENTER")) {
            String roomCode = code[1];
            String userId = code[2];
            
            session.getAttributes().put("userId",userId);
            
            room.putIfAbsent(roomCode, new ArrayList<>());
            List<WebSocketSession> roomSessions = room.get(roomCode);
            roomSessions.add(session);
            
            for (WebSocketSession user : roomSessions) {
            	if(user.isOpen()) {
            		user.sendMessage(new TextMessage(userId+"님이 접속하였습니다!"));
            	}
            }
        }else {
        	List<WebSocketSession> roomSessions = room.get(code[0]);
            for (WebSocketSession user : roomSessions) {
            	if(user.isOpen()) {
            		user.sendMessage(new TextMessage(code[1]+":"+code[2]));
            	}
            }
        }
    }

	@Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        list.add(session);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	list.remove(session);
    	List<WebSocketSession> list = null;
    	String userId = (String) session.getAttributes().get("userId");
        for (List<WebSocketSession> roomSessions : room.values()) {
            if(roomSessions.contains(session)) {
            	roomSessions.remove(session);
            	list = roomSessions;
            	break;
            }
        }
        for(WebSocketSession s : list) {
        	s.sendMessage(new TextMessage(userId+"님이 탈주하였습니다!"));
        }
    }
    
    public Map<String, List<WebSocketSession>> getRoom() {
		return room;
	}
	public void setRoom(Map<String, List<WebSocketSession>> room) {
		this.room = room;
	}
}