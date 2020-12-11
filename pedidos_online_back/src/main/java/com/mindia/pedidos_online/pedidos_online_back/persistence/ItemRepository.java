package com.mindia.pedidos_online.pedidos_online_back.persistence;

import com.mindia.pedidos_online.pedidos_online_back.persistence.model.Item;

public class ItemRepository {
	
	/**
	 * Esta clase se debe utilizar para acceder a la tabla de 'item', ya sea para guardar, editar, eliminar registros, etc.
	 * A su vez esta clase será accedida a través de 'itemManager'.
	 */
	
	
	public void newItem(Item item) {
		//TODO: connect to db and upload the item itself ue re yankee
		System.out.println("Producto "+item.getName()+" cargado con éxito!");

	}

}
