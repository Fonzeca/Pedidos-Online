package com.mindia.pedidos_online.pedidos_online_back.manager;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mindia.pedidos_online.pedidos_online_back.persistence.ItemRepository;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.Item;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.ItemBase;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.ItemMultiplePrices;
import com.mindia.pedidos_online.pedidos_online_back.view.PojoItem;

@Service
public class ItemManager {
	
	enum ItemTypes
	{
		NORMAL,
		MULTIPLE_PRICES
	}
	
	/**
	 * En los managers se realiza la lógica de las operaciones, como por ejemplo crear un objeto item y asignarle sus campos,
	 *  luego se lo envía al repository.
	 */
	
	@Autowired
	private ItemRepository repo;
	
	//TEST
	public void newItem(String name, String description, String price, String image, String section) {
		Item item = new Item(name, description, price, image, section);
		repo.newItem(item);
	}
	
	//TEST
	public void newItem(String name, String description, List<String> prices, String image, String section) {
		ItemMultiplePrices item = new ItemMultiplePrices(name, description, image, section, prices);
		repo.newItem(item);
	}
	
	//TEST
	public void deleteItem(String name) {
		repo.deleteItem(name);
	}
	
	/**
	 * Recorre todos items traidos de BD, y los convierte a POJO.
	 * @return todos los items.
	 */
	public List<PojoItem> getItems(){
		List<PojoItem> itemsPojo = new ArrayList<PojoItem>();
		
		for (ItemBase item : repo.getItems()) {
			
			PojoItem pojo = new PojoItem(item);
			itemsPojo.add(pojo);
			
		}
		
		return itemsPojo;
	}

	
	public List<PojoItem> getItemsBySection(String section) {
		List<PojoItem> itemsPojo = new ArrayList<PojoItem>();
		
		for (ItemBase item : repo.getItems()) {
			
			if(item.getSection().equals(section)) {
				
				PojoItem itemPojo = new PojoItem(item);
				itemsPojo.add(itemPojo);
			}
		}
		return itemsPojo;
	}
	
}

