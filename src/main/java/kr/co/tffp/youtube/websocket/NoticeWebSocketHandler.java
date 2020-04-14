package kr.co.tffp.youtube.websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class NoticeWebSocketHandler extends TextWebSocketHandler {

	// 클라이언트와의 연결정보를 담고 있는 WebSocketSession객체를 저장하는 Hashset객체를 생성한다.
		private Set<WebSocketSession> sessions 
			= Collections.synchronizedSet(new HashSet<WebSocketSession>());

		
		// 전달받은 메세지를 모든 클라이언트로 보낸다.
		public void sendMessage(String message) throws Exception {
			Iterator<WebSocketSession> iterator = sessions.iterator();
			
			while (iterator.hasNext()) {
				WebSocketSession savedSession = iterator.next();
				try {
					savedSession.sendMessage(new TextMessage(message));
				} catch (IOException e) {
					// 에러 발생시 해당 클라이언트와 연결된 WebSocketSession을 제거한다.
					iterator.remove();
				}
			}
		}
		
		// WebSocket 연결이 열리고 사용할 준비가 됐을 때 실행된다.
		@Override
		public void afterConnectionEstablished(WebSocketSession session) throws Exception {
			// 연결 요청을 보낸 클라이언트와 연결된 WebSocketSession 객체를 HashSet에 저장한다.
			sessions.add(session);
		}
		
		// WebSocket 연결이 닫혔을 때 실행된다.
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
			// 해당 클라이언트와 연결된 WebSocketSession을 제거한다.
			sessions.remove(session);
		}
		
		// 전송 에러가 발생했을 때 실행된다.
		@Override
		public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
			// 해당 클라이언트와 연결된 WebSocketSession을 제거한다.
			sessions.remove(session);
		}
}
