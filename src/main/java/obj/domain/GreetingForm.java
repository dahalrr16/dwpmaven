package obj.domain;

public class GreetingForm {
	private Greeting greeting;
	private Color color;
	private Order order;
	private String formName;
	
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Greeting getGreeting() {
		return greeting;
	}
	public void setGreeting(Greeting greeting) {
		this.greeting = greeting;
	}
	public Color getColor() {
		return color;
	}
	public void setColor(Color color) {
		this.color = color;
	}
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	
	
	

}
