package com.dumpster.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.dumpster.models.LoginUser;
import com.dumpster.models.User;
import com.dumpster.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	UserRepository userRepo;

	public User create(User u) {
		return userRepo.save(u);
	}
	
	public User getOne(Long id) {
		Optional<User> optUser = userRepo.findById(id);
		if(optUser.isPresent()) {
			return optUser.get();
		} else {
			return null;
		}
	}
	
	public User register(User createdUser, BindingResult result) {
		if(!createdUser.getPassword().equals(createdUser.getConfirm())) {
			result.rejectValue("confirm","Match", "Passwords musty match!");
			return null;
		}
		
		if(!result.hasErrors()) {
			String hashed = BCrypt.hashpw(createdUser.getPassword(), BCrypt.gensalt());
			createdUser.setPassword(hashed);
			return this.create(createdUser);
		}
		
		return null;
	}
	
	public User login(LoginUser logUser, BindingResult result) {
		Optional<User> user = userRepo.findByEmail(logUser.getEmail());
		if(user.isPresent() && BCrypt.checkpw(logUser.getPassword(), user.get().getPassword())) {
			return user.get();
		}
		result.rejectValue("password", "Invalid", "Invalid credentials!");
		return null;
	}
	
	
}
