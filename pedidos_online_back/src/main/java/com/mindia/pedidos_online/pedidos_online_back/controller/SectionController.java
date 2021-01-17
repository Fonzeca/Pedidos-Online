package com.mindia.pedidos_online.pedidos_online_back.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.mindia.pedidos_online.pedidos_online_back.manager.SectionManager;
import com.mindia.pedidos_online.pedidos_online_back.view.PojoSection;

@RestController
@RequestMapping("/section")
public class SectionController {

	@Autowired
	private SectionManager manager;
	
	/**
	 * 
	 * @return una lista de secciones.
	 */
	@GetMapping("/list")
	public List<PojoSection> getAllSections(){
		return manager.getSections();
	}
	
	/**
	 * Solo para uso del unit Test
	 */
	public void newSection (String name, String image) {
		manager.newSection(name, image);
	}
	
	/**
	 * Solo para uso del unit Test
	 */
	public void newSection (String name, String image, int type, List<String> categories) {
		 manager.newSection(name, image, type, categories);
	}
	
	/**
	 * Solo para uso del unit Test
	 */
	public void deleteSection (String name) {
		manager.deleteSection(name);
	}
}
