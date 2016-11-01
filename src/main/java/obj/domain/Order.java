package obj.domain;

public class Order {
	private String orderType;

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	@Override
	public String toString() {
		return "Order [orderType=" + orderType + "]";
	}
	

}
