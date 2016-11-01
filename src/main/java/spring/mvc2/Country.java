package spring.mvc2;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="Country")
public class Country { 
	
	public Country() {		
	}
	
	Country(String code, String name){
		this.code=code;
		this.name=name;
	}
	
	@Id
	private String code;
	private String name;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "" + name;
	}
	
	

}
