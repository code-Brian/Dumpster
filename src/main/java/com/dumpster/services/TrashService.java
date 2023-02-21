package com.dumpster.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dumpster.models.Trash;
import com.dumpster.repositories.TrashRepository;

@Service
public class TrashService {
	@Autowired
	TrashRepository trashRepo;
	
	public Trash create(Trash t) {
		return trashRepo.save(t);
	}

	public Trash update(Trash t) {
		return trashRepo.save(t);
	}
	
	public Trash getOne(Long id) {
		Optional<Trash> optTrash = trashRepo.findById(id);
		if(optTrash.isPresent()) {
			return optTrash.get();
		} else {
			return null;
		}
	}
	
	public void delete(Long id) {
		trashRepo.deleteById(id);
	}
	
	public List<Trash> getAllByReceiver(Long receiverId) {
		return trashRepo.findAllByReceiverId(receiverId);
	}
	
	public List<Trash> getAllBySender(Long senderId){
		return trashRepo.findAllBySenderId(senderId);
	}
}
