package com.dumpster.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
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
	
	@GetMapping("/{id}/edit")
	public String editTrash(@PathVariable("id") Long id, Model model) {
		model.addAttribute("trash", trashServ.getOne(id));
		return "editTrash.jsp";
	}
	
	@PutMapping("/{id}/update")
	public String updateTrash(@Valid @ModelAttribute("trash") Trash trash, BindingResult result, @PathVariable("id") Long trashId) {
		if(result.hasErrors()) {
			System.out.println("Error detected with PUT!");
			System.out.println("Trash message ID: " + trashId);
			System.out.println(result.getAllErrors());
			return "editTrash.jsp";
		} else {
			trash.setId(trashId);
			trashServ.update(trash);
			return "redirect:/dashboard";
		}
	}
	
	@DeleteMapping("/{id}/delete")
	public String deleteTrash(@PathVariable("id") Long id) {
		trashServ.delete(id);
		return "redirect:/dashboard";
	}
}
