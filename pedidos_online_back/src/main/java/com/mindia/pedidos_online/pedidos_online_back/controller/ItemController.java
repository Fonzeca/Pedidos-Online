package com.mindia.pedidos_online.pedidos_online_back.controller;

import com.mindia.pedidos_online.pedidos_online_back.manager.ItemManager;

public class ItemController {
	
	/**
	 * Los controladores funcionan meramente como pasa manos ya que son llamados por el usuario a través de sus acciones
	 * para que luego el controlador se comunique con el manager, habiendo en todo momento mínimo una capa de seguridad
	 * entre los usuarios finales y los datos.
	 */
	
	private ItemManager manager;
	
	public void newItem (String name, String description, String price, String image) {
		manager.newItem(name, description, price, image);
	}

}
