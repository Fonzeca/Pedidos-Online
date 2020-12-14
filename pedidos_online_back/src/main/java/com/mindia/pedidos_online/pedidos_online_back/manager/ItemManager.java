package com.mindia.pedidos_online.pedidos_online_back.manager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mindia.pedidos_online.pedidos_online_back.persistence.ItemRepository;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.Item;
import com.mindia.pedidos_online.pedidos_online_back.view.PojoItem;

@Service
public class ItemManager {
	
	/**
	 * En los managers se realiza la lógica de las operaciones, como por ejemplo crear un objeto item y asignarle sus campos,
	 *  luego se lo envía al repository.
	 */
	
	@Autowired
	private ItemRepository repo;
	
//	public void newItem(String name, String description, String price, String image) {
//		Item item = new Item(name, description, price);
//		repo.newItem(item);
//	}
	
	public List<PojoItem> getItems(){
		List<PojoItem> itemsPojo= new ArrayList<PojoItem>();
		for (Item item : repo.getItems()) {
			PojoItem pojo = new PojoItem(item);
			itemsPojo.add(pojo);
		}
		
		return itemsPojo;
	}

	public List<PojoItem> getItemsBySection(String section) {
		List<PojoItem> itemsPojo= new ArrayList<PojoItem>();
		for (Item item : repo.getItems()) {
			if(item.getSection().equals(section)) {
				PojoItem itemPojo= new PojoItem(item);
				itemsPojo.add(itemPojo);
			}
		}
		return itemsPojo;
	}
	
}
