package com.mindia.pedidos_online.pedidos_online_back.manager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mindia.pedidos_online.pedidos_online_back.persistence.SectionRepository;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.Section;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.SectionBase;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.SectionMultipleCategories;
import com.mindia.pedidos_online.pedidos_online_back.view.PojoSection;

@Service
public class SectionManager {

	@Autowired
	private SectionRepository repo;
	
	/**
	 * Busca a BD las secciones, y las tranforma a POJO.
	 * @return todas las secciones.
	 */
	public List<PojoSection> getSections() {
		List<PojoSection> pojo = new ArrayList<PojoSection>();
		
		for (SectionBase section : repo.getSections()) {
			
			PojoSection pojoSection = new PojoSection(section);
			
			pojo.add(pojoSection);
		}
		return pojo;
	}
	
	/**
	 * Crea una nueva seccion de comida
	 * @param name: nombre de la seccion
	 * @param image: URL local de la web
	 */
	public void newSection(String name, String image) {
		Section section = new Section(name, image);
		repo.newSection(section);
	}
	
	/**
	 * Crea una nueva seccion con categorias de comida
	 * @param name: nombre de la seccion
	 * @param image: URL local de la web
	 * @param type: tipo de section. 1 para el de categorias
	 * @param categories: Lista del nombres de las categorias de la seccion.
	 */
	public void newSection(String name, String image, int type, List<String> categories) {
		if(type == 1) {
			SectionMultipleCategories section = new SectionMultipleCategories(name, image, type, categories);
			repo.newSection(section);
		}
	}
	
	/**
	 * Elimina una seccion por su nombre.
	 */
	public void deleteSection(String name) {
		repo.deleteSection(name);
	}
	
	

}
