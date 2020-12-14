package com.mindia.pedidos_online.pedidos_online_back.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.mindia.pedidos_online.pedidos_online_back.manager.ItemManager;
import com.mindia.pedidos_online.pedidos_online_back.view.PojoItem;

@RestController
@RequestMapping("/item")
public class ItemController {
	
	/**
	 * Los controladores funcionan meramente como pasa manos ya que son llamados por el usuario a través de sus acciones
	 * para que luego el controlador se comunique con el manager, habiendo en todo momento mínimo una capa de seguridad
	 * entre los usuarios finales y los datos.
	 */
	
	@Autowired
	private ItemManager manager;
	
	
	@GetMapping("/list")
	public List<PojoItem> getAllItems(){
		return manager.getItems();
	}
	@GetMapping("/listBySection")
	public List<PojoItem> getItemsBySection(@RequestParam String section){
		return manager.getItemsBySection(section);
	}
//	public void newItem (String name, String description, String price, String image) {
//		manager.newItem(name, description, price, image);
//	}

}
