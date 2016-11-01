package spring.mvc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;



/**
 * @author raj123
 *
 */
public class Book {
	
	
	private Subscription subscription;	
	
 String authorName;
private int pages;
private double price;
private List<String> pageList;

public List<String> getPageList() {
	return pageList;
}
public void setPageList(List<String> pageList) {
	this.pageList = pageList;
}

public Subscription getSubscription() {
	return subscription;
}
@Autowired(required=true)
public void setSubscription(Subscription subscription) {
	this.subscription = subscription;
}


public String getAuthorName() {
	return authorName;
}
public void setAuthorName(String authorName) {
	this.authorName = authorName;
}
public int getPages() {
	return pages;
}
public void setPages(int pages) {
	this.pages = pages;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
@Override
public String toString() {
	return "Book [authorName=" + authorName + ", pages=" + pages + ", price="
			+ price + ", subscription=" + subscription +pageList+ "]";
}


}
