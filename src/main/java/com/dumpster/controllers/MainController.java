package com.dumpster.controllers;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import com.dumpster.models.Trash;
import com.dumpster.services.TrashService;
import com.dumpster.services.UserService;

@Controller
public class MainController {
	@Autowired
	UserService userServ;
	
	@Autowired
	TrashService trashServ;
	
	@GetMapping("/dashboard")
	public String dashboard(Model model, HttpSession session) {
		Long userId = (Long) session.getAttribute("userId");
		model.addAttribute("user", userServ.getOne(userId));
		System.out.println("User messages: " + userServ.getOne(userId).getTrashReceived());
		model.addAttribute("senderTrash", trashServ.getAllBySender(userId));
		return "index.jsp";
	}
	
	@GetMapping("/profile/{id}/view")
	public String getUserProfile(@PathVariable("id") Long id, Model model, HttpSession session) {
		System.out.println("User id for profile query is: " + id);
		model.addAttribute("user", userServ.getOne(id));
		System.out.println("Username found: " + userServ.getOne(id).getUserName());
		model.addAttribute("trash", new Trash());
		return "userProfile.jsp";
	}
	
}
