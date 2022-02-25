package com.codingdojo.lookify.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.codingdojo.lookify.models.PlayList;

public interface PlayListRepository extends CrudRepository<PlayList, Long> {
	List<PlayList> findAll();
	List<PlayList> findByArtist(String name);
	List<PlayList> findTop100ByOrderByRatingDesc();
	
}
