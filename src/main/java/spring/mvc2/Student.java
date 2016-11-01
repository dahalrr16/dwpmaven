package spring.mvc2;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
//@Table(name="student")
public class Student implements Serializable, Comparable<Student> {

private static final long serialVersionUID = 9024455757311860269L;
	
	private String name;
	@Id
	private int id;
	private int age;
	
	
	Student(){		
	}
	
	Student(String name, int id, int age){
		this.name=name;
		this.id=id;
		this.age=age;
	}
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	@Override
	public String toString() {
		return "Student [name=" + name + ", id=" + id + ", age=" + age + "]";
	}

	//@Override
	public int compareTo(Student s) {
		int imp=0;
		if(this.age==s.age)imp=0;
		if(this.age>s.age)imp=1;
		if(this.age<s.age)imp=-1;
		return imp;
	}

	
	

}
