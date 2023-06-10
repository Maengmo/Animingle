package com.sist.animingle.board.chat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.http.HttpServlet;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/petsitterview.do")
public class PetsitterChat extends HttpServlet {
	
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnMessage
    public void onMessage(String message, Session session) throws IOException {
        System.out.println(message);
        synchronized(clients) {
            for(Session client : clients) {
                if(!client.equals(session)) {
                    client.getBasicRemote().sendText(message);
                }
            }
        }
    }
    
    @OnOpen
    public void onOpen(Session session) {
        System.out.println(session);
        clients.add(session);
    }
    
    @OnClose
    public void onClose(Session session) {
        clients.remove(session);
    }

}
