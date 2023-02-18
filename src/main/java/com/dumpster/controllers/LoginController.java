package com.dumpster.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.dumpster.models.LoginUser;
import com.dumpster.models.User;
import com.dumpster.services.UserService;

@Controller
public class LoginController {
	@Autowired
	UserService userServ;
	
	@GetMapping("/")
	public String loginPage(Model model) {
		model.addAttribute("user", new User());
		model.addAttribute("loginUser", new LoginUser());
		return "login.jsp";
	}
	
	@PostMapping("/register")
	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session, Model model) {
		User createdUser = userServ.register(user, result);
		if(createdUser == null) {
			model.addAttribute("loginUser", new LoginUser());
			return "login.jsp";
		} else {
			session.setAttribute("userId", createdUser.getId());
			return "redirect:/dashboard";
		}
	}
	
	@PostMapping("/login")
	public String loginUser(@Valid @ModelAttribute("loginUser")LoginUser loginUser, BindingResult result, HttpSession session, Model model) {
		User loggedUser = userServ.login(loginUser, result);
		if(loggedUser == null) {
			model.addAttribute("user", new User());
			return "login.jsp";
		} else {
			session.setAttribute("userId", loggedUser.getId());
			return "redirect:/dashboard";
		}
	}

	@GetMapping("/logout")
	public String logoutUser(HttpSession session) {
		session.removeAttribute("userId");
		return "redirect:/";
	}
	
}
