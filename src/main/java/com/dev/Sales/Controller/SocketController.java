package com.dev.Sales.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dev.Sales.Model.ChatMessage;

@Controller
public class SocketController {
 
	 @GetMapping("/chat")
	    public String chat () {
	    	return "chat";
	    }
	 @MessageMapping("/chat.sendMessage")
	    @SendTo("/topic/public")
	    public ChatMessage sendMessage(@Payload ChatMessage chatMessage) {
	        return chatMessage;
	    }

	    @MessageMapping("/chat.addUser")
	    @SendTo("/topic/public")
	    public ChatMessage addUser(@Payload ChatMessage chatMessage,
	                               SimpMessageHeaderAccessor headerAccessor) {
	        // Add username in web socket session
	        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
	        return chatMessage;
	    }
}