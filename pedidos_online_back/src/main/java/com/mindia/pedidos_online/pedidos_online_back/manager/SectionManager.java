package com.mindia.pedidos_online.pedidos_online_back.manager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mindia.pedidos_online.pedidos_online_back.persistence.SectionRepository;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.SectionBase;
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

}
