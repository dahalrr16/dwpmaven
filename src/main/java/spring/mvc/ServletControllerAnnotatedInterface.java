package spring.mvc;

import java.util.Map;

import obj.domain.GreetingForm;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

public interface ServletControllerAnnotatedInterface {

	public abstract ModelAndView helloWorld();

	public abstract ModelAndView welcomeWorld();

	public abstract String sell(Model model);

	public abstract String tell(GreetingForm greetingForm,
			Map<String, Object> model);

	public abstract String showGreeting(GreetingForm greetingForm,
			Map<String, Object> model);

	//note there is no actual greetings.html file!! 
	public abstract String showAddGreetingPage(GreetingForm greetingForm);

	public abstract String addGreetingAndShowAll(GreetingForm greetingForm,
			Map<String, Object> model);

	//define the same url with GET so users can skip to the greetings page
	public abstract String showAllGreetings(Map<String, Object> model);

	public String sell(Map<String, String> map);

}