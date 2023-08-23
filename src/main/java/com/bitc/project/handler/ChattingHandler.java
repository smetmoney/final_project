package com.bitc.project.handler;

// import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.log4j.Log4j2;

@Component
@Log4j2
public class ChattingHandler extends TextWebSocketHandler {
  
    private List<WebSocketSession> list = new ArrayList<>();
    // https://dev-gorany.tistory.com/3
    // https://innu3368.tistory.com/214
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
        //String user = (String) session.getAttributes().get("user");
        //for(WebSocketSession sess: list) {
        //    sess.sendMessage(new TextMessage(user+":님이 접속하였습니다!"));
        //}
        log.info(session + " 클라이언트 접속");
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    	System.out.println(session + "나감");
        log.info(session + " 클라이언트 접속 해제");
        list.remove(session);
        // sessions.remove(session);
    }
	/*    
	// websocket 연결 성공 시
	@Override 
	public void afterConnectionEstablished(WebSocketSession session)throws Exception {
		log.info("#ChattingHandler, afterConnectionEstablished");
		sessionList.add(session);
		log.info(session.getPrincipal().getName() + "님이 입장하셨습니다."); 
	}
	// websocket 메세지 수신 및 송신
	@Override 
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
	log.info("#ChattingHandler, handleMessage"); log.info(session.getId() + ": "+ message);
		for(WebSocketSession s : sessionList) { 
			s.sendMessage(new TextMessage(session.getPrincipal().getName() + ":" + message.getPayload()));
		} 
	}
	// websocket 연결 종료 시
	@Override 
	public void afterConnectionClosed(WebSocketSession session,	CloseStatus status) throws Exception {
		log.info("#ChattingHandler, afterConnectionClosed");
		sessionList.remove(session);
		log.info(session.getPrincipal().getName() + "님이 퇴장하셨습니다."); 
	} 
	*/
}