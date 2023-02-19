package com.dumpster.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.dumpster.models.Trash;

public interface TrashRepository extends CrudRepository<Trash, Long>{
	public List<Trash> findAllByReceiverId(Long id);
}
