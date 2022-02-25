package com.codingdojo.lookify.controllers;

import java.util.ArrayList;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.lookify.models.PlayList;
import com.codingdojo.lookify.services.PlayListService;

@Controller
public class PlayListController {
	@Autowired
	PlayListService service;
	
	@GetMapping("")
	public String initScreen () {
		return "main.jsp";
	}
	
	@GetMapping("/dashboard")
	public String main(Model model) {		
		model.addAttribute("playLists", service.getAll());
	    return "index.jsp";
	}
	
	@GetMapping("/songs/new")
	public String add(@ModelAttribute("playlist") PlayList playlist) {
	    return "add.jsp";
	}	
	 
   @PostMapping("/songs/new")
   public String create(@Valid @ModelAttribute("playlist") PlayList playlist,
    		BindingResult result,
    		RedirectAttributes redirectAttributes)
    {    	
        if (result.hasErrors()) {
        	redirectAttributes.addFlashAttribute("message", "Errors make corrections"); 
        	return "add.jsp";
        }
        
        service.create(playlist);
        redirectAttributes.addFlashAttribute("message", "Playlist added");
        
        return "redirect:/dashboard";
    }
   
   @GetMapping("/songs/{id}")
   public String show(@PathVariable("id") Long id, Model model) {
       model.addAttribute("playlist", service.getById(id));
       return "show.jsp";
   }
   
   @DeleteMapping("/songs/{id}")    
   public String destroy(@PathVariable("id") Long id) {
   	service.delete(id);
       return "redirect:/dashboard";
   }
   
   @PostMapping("/search")
   public String searchByName(@RequestParam("artist") String artist) {			   
	   return "redirect:/search/" + artist;
   }
   
   @RequestMapping("/search/{artist}")
   public String searchByNme(@PathVariable("artist") String artist, Model model) 
   {
	   List<PlayList> artistList = (ArrayList<PlayList>) service.searchByInput(artist);
	   model.addAttribute("artist", artist);
	   model.addAttribute("songsByArtist", artistList);
	   return "artist.jsp";	   
   }
   
   @RequestMapping("/search/topTen")
   public String topTen(Model model) {
	   List<PlayList> topEntries = service.showTopTen();
	   model.addAttribute("topTenSongs", topEntries);
	   
	   return "topTen.jsp";	   
   }
  
   
}

