package spring.mvc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import obj.domain.Color;
import obj.domain.Greeting;
import obj.domain.GreetingForm;
import obj.domain.Order;






import org.fidel.SpringContextLocator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
@RequestMapping("/class")
public class ServletControllerAnnotated implements ServletControllerAnnotatedInterface {
	@Autowired
 private Book book;
	/* (non-Javadoc)
	 * @see spring.mvc.ServletControllerAnnotatedInterface#helloWorld()
	 */
	@Override
	@RequestMapping("/hello")
    public ModelAndView helloWorld() { 
        String message = "Hello World, Spring 3.0!";
        System.out.println(message);
        return new ModelAndView("GreetPages/hello", "message", message);
    }
    
    /* (non-Javadoc)
	 * @see spring.mvc.ServletControllerAnnotatedInterface#welcomeWorld()
	 */
    @Override
	@RequestMapping("/wello")
    public ModelAndView welcomeWorld() {
 
        String message = "Welcome World, Spring 3.0!";
        System.out.println(message);
        return new ModelAndView("GreetPages/welcome", "message", message);
    }
    
    /* (non-Javadoc)
	 * @see spring.mvc.ServletControllerAnnotatedInterface#sell(org.springframework.ui.Model)
	 */
 
    
    
    @Override
	@RequestMapping(value="/sello",method=RequestMethod.GET)
    public String sell( Map<String, String> map) {
 
        String message = "Welcome to Sales Department, Spring 3.0!";
        ApplicationContext context=(ApplicationContext) SpringContextLocator.getApplicationContext();
        
        
        ApplicationContext context2=new ClassPathXmlApplicationContext("spring/applicationContext2.xml");
        System.out.println(((Book)context2.getBean("book2")).authorName);
        map= new HashMap<String, String>();
        
        System.out.println(((Book)context.getBean("book")).authorName);
        System.out.println(message);
        map.put("msg", message);
        book=new Book();
		book.setAuthorName("Gautam");
		book.setPrice(101);
		map.put("book2","book");
        return "GreetPages/selling";
        
    }
    
    
    
    
    
    
    /* (non-Javadoc)
	 * @see spring.mvc.ServletControllerAnnotatedInterface#tell(obj.domain.GreetingForm, java.util.Map)
	 */
    @Override
	@RequestMapping(value="/addGreeting", method=RequestMethod.GET)
    public String tell(@ModelAttribute("greetingForm")GreetingForm greetingForm, Map<String, Object> model) {
 
        /*Greeting greeting=greetingForm.getGreeting();
        model.put("greeting", greeting);
       String selectedColorCode=greetingForm.getColor().getColorCode();
       model.put("selectedColorCode", selectedColorCode);
        */
    	List<Color> colorList=new ArrayList<Color>();// initalization without request information
    	colorList.add(new Color("Indian Red", "F75D59"));
    	colorList.add(new Color("Red", "FF0000"));
    	colorList.add(new Color("Salmon", "F9966B"));
    	model.put("colorList", colorList);
    	
    	List<String> stringList=new ArrayList<String>();
    	stringList.add("Dallas");
    	stringList.add("Irving");
    	stringList.add("Fort-Worth");
    	stringList.add("Houston");
    	stringList.add("Austin");
    	model.put("stringList", stringList);
    	
        return "GreetPages/addgreeting";
        
    }
    
    /* (non-Javadoc)
	 * @see spring.mvc.ServletControllerAnnotatedInterface#showGreeting(obj.domain.GreetingForm, java.util.Map)
	 */
    @Override
	@RequestMapping(value="/greeting", method=RequestMethod.POST)
    public String showGreeting(@ModelAttribute("greetingForm")GreetingForm greetingForm, Map<String, Object> model) {
 
        
    	String formName=greetingForm.getFormName();
    	model.put("formName", formName);
    	
    	
    	
    	Greeting greeting=greetingForm.getGreeting();//request.getParameter from request(
        System.out.println(greeting.getGreetingText());
        System.out.println(greeting.getGreetingId());
        model.put("greeting", greeting);
        
        Order order=greetingForm.getOrder();
        model.put("order", order);
        
       String selectedColorCode=greetingForm.getColor().getColorCode();
   	if(selectedColorCode.equals("")) //if no color selected, then make default white
   		selectedColorCode="FFFFFF";
       model.put("colorCode", selectedColorCode);
        
        return "greeting";
        
    }
    
    
    // from the program copied****************************************************************
    //****************************************************************************************
    
    //note there is no actual greetings.html file!! 
   	/* (non-Javadoc)
	 * @see spring.mvc.ServletControllerAnnotatedInterface#showAddGreetingPage(obj.domain.GreetingForm)
	 */
   	@Override
	@RequestMapping(value = "/addgreeting.html", method = RequestMethod.GET)
       public String showAddGreetingPage(@ModelAttribute("greetingform") GreetingForm greetingForm) {		
   		
   	
   		
   		//no need to add colorlist to the model anymore since it is defined at method level below
   		//no need to have the model object in this method either
   		
       	//resolves to /WEB-INF/jsp/addgreeting.jsp
       	return "addgreeting1";
   	}	
   	
  /* 	@ModelAttribute("colorlist")
   	public List<Color> populateColorList() {
   		//color list is hardcoded for now...
   		List<Color> colorList = new ArrayList<Color>();
   		colorList.add(new Color("Indian Red", "F75D59"));
   		colorList.add(new Color("Red", "FF0000"));
   		colorList.add(new Color("Salmon", "F9966B"));
   		colorList.add(new Color("Lemon Chiffon", "FFF8C6"));
   		colorList.add(new Color("Olive Green", "BCE954"));
   		colorList.add(new Color("Steel Blue", "C6DEFF"));
   		colorList.add(new Color("Medium Purple", "9E7BFF"));
   		return colorList;
   	}	*/
   	
   	/* (non-Javadoc)
	 * @see spring.mvc.ServletControllerAnnotatedInterface#addGreetingAndShowAll(obj.domain.GreetingForm, java.util.Map)
	 */
   	@Override
	@RequestMapping(value = "/greetings.html", method = RequestMethod.POST)
   	public String addGreetingAndShowAll(@ModelAttribute("greetingform") GreetingForm greetingForm,
   			Map<String, Object> model) {		
   	    			
   			Greeting greeting = greetingForm.getGreeting();
   			model.put("greeting", greeting);
   			
   	    	String selectedColorCode=greetingForm.getColor().getColorCode(); 
   	    	if(selectedColorCode.equals("")) //if no color selected, then make default white
   	    		selectedColorCode="FFFFFF";
   	    	model.put("colorcode", selectedColorCode);
   	    	
   	    	// This will resolve to /WEB-INF/jsp/greetings.jsp
   	    	return "greetings1";
   	} 
   	
   	//define the same url with GET so users can skip to the greetings page
   	/* (non-Javadoc)
	 * @see spring.mvc.ServletControllerAnnotatedInterface#showAllGreetings(java.util.Map)
	 */
   	@Override
	@RequestMapping(value = "/greetings.html", method = RequestMethod.GET)
   	public String showAllGreetings(Map<String, Object> model) {		
   	    		
   			
   	    			
   			model.put("colorcode", "FFFFFF");
   			
   	    	// This will resolve to /WEB-INF/jsp/greetings.jsp
   	    	return "greetings1";
   	}

	@Override
	public String sell(Model model) {
		// TODO Auto-generated method stub
		return null;
	}
}
