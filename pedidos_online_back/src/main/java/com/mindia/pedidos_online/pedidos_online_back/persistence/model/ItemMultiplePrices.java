package com.mindia.pedidos_online.pedidos_online_back.persistence.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.annotation.TypeAlias;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 * Un item que puede tener diferentes precios.
 * Como una pizza napolitana puede ser grande y chica. Tiene 2 precios.
 * @author Alexis Fonzo
 */

@Document(collection = "items")
@TypeAlias("ItemMultiplePrices")
public class ItemMultiplePrices extends ItemBase{
	
	private List<String> prices;

	public ItemMultiplePrices(String name, String description, String image, String section, List<String> prices) {
		super(name, description, image, section);
		this.prices = prices;
		if(prices == null) {
			this.prices = new ArrayList<String>();
		}
	}

	public List<String> getPrices() {
		return prices;
	}

	public void setPrices(List<String> prices) {
		this.prices = prices;
	}
	

}
