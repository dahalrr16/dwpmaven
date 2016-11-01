package spring.mvc2;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Relative {
	private String name;
	@Id
	private int id;
	private String country;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	@Override
	public String toString() {
		return "Relative [name=" + name + ", id=" + id + ", country=" + country
				+ "]";
	}
	
	

}
