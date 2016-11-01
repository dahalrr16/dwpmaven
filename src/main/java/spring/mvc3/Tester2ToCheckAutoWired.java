package spring.mvc3;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.Book;
import spring.mvc.Order;
import spring.mvc.Subscription;

@Controller
@RequestMapping("start2")
public class Tester2ToCheckAutoWired {

	@Autowired(required=true)
	Book book;
	
	@Autowired(required=true)
	Subscription subscription;
	
	@Autowired(required=true)
	Order order;
	
	@RequestMapping("get2")
public String redirect(Model model){
		model.addAttribute("bookString", book);
		model.addAttribute("subscriptionString", subscription);
		model.addAttribute("orderString", order);
	return "GreetPages/selling";
}//redirect method closer
	
}
