package spring.mvc;

import org.springframework.beans.factory.annotation.Autowired;

public class Subscription {
	
	private Order order;
	
	
	public Order getOrder() {
		return order;
	}
	@Autowired
	public void setOrder(Order order) {
		this.order = order;
	}
	private int isbn;
	private String type;
	
	
	public int getIsbn() {
		return isbn;
	}
	public void setIsbn(int isbn) {
		this.isbn = isbn;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	@Override
	public String toString() {
		return "Subscription [order=" + order + ", isbn=" + isbn + ", type="
				+ type + "]";
	}
	

}
