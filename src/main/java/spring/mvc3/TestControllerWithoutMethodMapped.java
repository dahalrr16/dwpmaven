package spring.mvc3;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import spring.mvc.Book;
import spring.mvc.Subscription;
@Controller
@RequestMapping("start1")
public class TestControllerWithoutMethodMapped {
	
	@Autowired(required=true)
	Book book;
	
	@Autowired(required=true)
	Subscription subscription;
	
	@RequestMapping("get1")
public String redirect(Model model){
		model.addAttribute("bookString", book);
		model.addAttribute("subscriptionString", subscription);
	return "GreetPages/selling";
}//redirect method closer
	
	
	
}//class closer
