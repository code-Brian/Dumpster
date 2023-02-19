package com.dumpster.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dumpster.models.Trash;
import com.dumpster.services.TrashService;

@Controller
@RequestMapping("/trash")
public class TrashController {
	@Autowired
	TrashService trashServ;
	
	@PostMapping("/create")
	public String createTrash(@Valid @ModelAttribute("trash") Trash trash, BindingResult result) {
		if(result.hasErrors()) {
			return "userProfile.jsp";
		} else {
			System.out.println("The value of sender is: " + trash.getSender());
			System.out.println("The value of receiver is: " + trash.getReceiver());
			trashServ.create(trash);
			return "redirect:/dashboard";
		}
	}
}
