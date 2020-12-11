package com.mindia.pedidos_online.pedidos_online_back.manager;

import com.mindia.pedidos_online.pedidos_online_back.persistence.ItemRepository;
import com.mindia.pedidos_online.pedidos_online_back.persistence.model.Item;

public class ItemManager {
	
	/**
	 * En los managers se realiza la lógica de las operaciones, como por ejemplo crear un objeto item y asignarle sus campos,
	 *  luego se lo envía al repository.
	 */

	private ItemRepository repo;
	
	public void newItem(String name, String description, String price, String image) {
		Item item = new Item(name, description, price);
		repo.newItem(item);
	}
}
