package com.codingdojo.lookify.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.lookify.models.PlayList;
import com.codingdojo.lookify.repositories.PlayListRepository;

@Service
public class PlayListService {
	@Autowired
	private PlayListRepository repository;
	
    public List<PlayList> getAll() {
        return repository.findAll();
    }
    
    public PlayList create(PlayList item) {
        return repository.save(item);
    }
    
	public PlayList getById(Long id) {
        Optional<PlayList> optionalLanguage = repository.findById(id);
        if(optionalLanguage.isPresent()) {
            return optionalLanguage.get();
        } else {
            return null;
        }
	}
	
	public void delete(long id) {
		repository.deleteById(id);
	}
	
	public List<PlayList> searchByInput(String name) {
		return repository.findByArtist(name);		
	}
	
	public List<PlayList> showTopTen() {
		return repository.findTop100ByOrderByRatingDesc();
	}

}
