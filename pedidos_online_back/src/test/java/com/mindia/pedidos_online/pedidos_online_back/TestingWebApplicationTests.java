package com.mindia.pedidos_online.pedidos_online_back;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.SpringBootTest.WebEnvironment;
import org.springframework.boot.web.server.LocalServerPort;

import com.mindia.pedidos_online.pedidos_online_back.controller.ItemController;
import com.mindia.pedidos_online.pedidos_online_back.controller.SectionController;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.Item;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.Section;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.SectionMultipleCategories;
import com.mindia.pedidos_online.pedidos_online_back.view.PojoItem;
import com.mindia.pedidos_online.pedidos_online_back.view.PojoSection;

@SpringBootTest(webEnvironment = WebEnvironment.RANDOM_PORT) 
public class TestingWebApplicationTests { 
 
	@LocalServerPort 
	private int serverPort; 
 
	@Autowired 
	private ItemController itemController; 
	
	@Autowired
	private SectionController sectionController;
 
	@Test 
	public void itemControllerTest() { 
		Item item = new Item("Item prueba " + Math.random()*100, "Este item es de prueba", "20.0", "", "");
		
		assertNotNull(itemController, "Se inyecto el controller exitosamente!");
		
		itemController.newItem(item.getName(), item.getDescription(), item.getPrice(), item.getImage(), item.getSection());

		
		List<PojoItem> items = itemController.getAllItems();
		items = items.stream().filter(x -> x.getName().equals(item.getName())).collect(Collectors.toList());
		
		assertEquals(true, items.size() == 1, "Se obtuvo correctamente el item");
		
		
		itemController.deleteItem(item.getName());
		
		items = itemController.getAllItems();
		items = items.stream().filter(x -> x.getName().equals(item.getName())).collect(Collectors.toList());
		
		assertEquals(true, items.size() == 0, "Se borro correctamente el item");
	}
	
	@Test
	public void sectionControllerTest() {
		Section section = new Section("Section prueba", "image");
		
		assertNotNull(sectionController, "Se inyecto el controller exitosamente!");
		
		sectionController.newSection(section.getName(), section.getImage());
		
		List<PojoSection> sections = sectionController.getAllSections();
		
		sections = sections.stream().filter(x -> x.getName().equals(section.getName())).collect(Collectors.toList());
		
		assertEquals(true, sections.size() == 1, "Se obtuvo correctamente la seccion");
		
		sectionController.deleteSection(section.getName());
		
		sections = sectionController.getAllSections();
		sections = sections.stream().filter(x -> x.getName().equals(section.getName())).collect(Collectors.toList());
		
		assertEquals(true, sections.size() == 0, "Se borro correctamente el item");
		
		//SectionMultipleCategories
		
		SectionMultipleCategories secMultCat = new SectionMultipleCategories("Section test", "image", 1, Arrays.asList("Categoria 1", "Categoria 2"));
		
		sectionController.newSection(secMultCat.getName(), secMultCat.getImage(), secMultCat.getType(), secMultCat.getCategories());
		
		sections = sectionController.getAllSections();
		sections = sections.stream().filter(x -> x.getCategories() != null && x.getCategories().equals(secMultCat.getCategories())).collect(Collectors.toList());

		assertEquals(true, sections.size() == 1, "Se obtuvo correctamente la seccion");
		
		sectionController.deleteSection(secMultCat.getName());
		
		sections = sectionController.getAllSections();
		sections = sections.stream().filter(x -> x.getCategories() != null && x.getCategories().equals(secMultCat.getCategories())).collect(Collectors.toList());
		
		assertEquals(true, sections.size() == 0, "Se borro correctamente el item");
		
	}
 
}