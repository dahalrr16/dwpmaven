package spring.mvc2;

import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.List;
import java.util.Map;













import net.sf.json.JSONArray;
import net.sf.json.JSONSerializer;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;



import org.fidel.SpringContextLocator;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.json.JSONObject;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import spring.mvc.Book;
@Controller
@RequestMapping(value="start")
public class StudentController {
	
	private static final Log log=LogFactory.getLog(StudentController.class);
	Book book;
	
	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}
	
	//**********************getAll in Table**************************************************************
	
	@RequestMapping(value="get/all", method=RequestMethod.GET)
	public @ResponseBody String getAllStudent( @ModelAttribute("formBean") FormBean formBean, Model model){
		
		SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		
		
		Query query=session.createQuery(" from Student");      //select name, id, age from Student    //from Student
   
		List<Student> studentList=query.list();		
		
		model.addAttribute("studentList",studentList);
	
		JSONArray jsonArray=(JSONArray)JSONSerializer.toJSON(studentList);
		System.out.println(jsonArray);
		
		session.getTransaction().commit();
		session.close();
		return jsonArray.toString();
	//	return "StudentPages/info";
	}//getAllStudent method closer
	
	
	//**********************getAll in Table**************************************************************
	
		@RequestMapping(value="get/all/sort", method=RequestMethod.GET)
		public @ResponseBody String getAllStudentSorted( @ModelAttribute("formBean") FormBean formBean, Model model){
			
			SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
			Session session=sessionFactory.openSession();
			session.beginTransaction();
			
			
			Query query=session.createQuery(" from Student");      //select name, id, age from Student    //from Student
	   
			List<Student> studentList=query.list();		
		Collections.sort(studentList);
		System.out.println(studentList);
			model.addAttribute("studentList",studentList);
		
			JSONArray jsonArray=(JSONArray)JSONSerializer.toJSON(studentList);
			System.out.println(jsonArray);
			
			session.getTransaction().commit();
			session.close();
			return jsonArray.toString();
		//	return "StudentPages/info";
		}//getAllStudent method closer
	
	//***********************UpdateFrom Table***************************************************************
	
	@RequestMapping(value="updateFromTable", method=RequestMethod.POST, consumes = "application/json",
			produces = "application/json")
	//    produces = MediaType.APPLICATION_JSON_VALUE,    consumes = MediaType.APPLICATION_JSON_VALUE
	public @ResponseBody String updateStudent(@RequestBody Student student, @ModelAttribute("formBean") FormBean formBean,
			Model model){		
		
		ObjectMapper mapper = new ObjectMapper();
		String result="ERROR creating student";
		
			try {
				result = mapper.writeValueAsString(student);
			} catch (JsonGenerationException e) {
				e.printStackTrace();
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
				
			SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
			Session session=sessionFactory.openSession();
			session.beginTransaction();
			int x=student.getId();
			System.out.println("the id of student retured from request body   "+x);
		session.saveOrUpdate(student);
		JSONObject jsonObj = new JSONObject(student);
		model.addAttribute("student",student);
					
		session.getTransaction().commit();
		session.close();
		return result;	
	}// updateFromMethod closer 
	
	
	//***********************DeleteFrom Table***************************************************************
	
		@RequestMapping(value="deleteFromTable", method=RequestMethod.POST, consumes = "application/json",
				produces = "application/json")
		//    produces = MediaType.APPLICATION_JSON_VALUE,    consumes = MediaType.APPLICATION_JSON_VALUE
		public @ResponseBody String deleteStudent(@RequestBody Student student, @ModelAttribute("formBean") FormBean formBean,
				Model model){		
			
			ObjectMapper mapper = new ObjectMapper();
			String result="ERROR creating student";
			
				try {
					result = mapper.writeValueAsString(student);
				} catch (JsonGenerationException e) {
					e.printStackTrace();
				} catch (JsonMappingException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
					
				SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
				Session session=sessionFactory.openSession();
				session.beginTransaction();
				int x=student.getId();
				System.out.println("the id of student retured from request body   "+x);
			session.delete(student);
			JSONObject jsonObj = new JSONObject(student);
			model.addAttribute("student",student);
						
			session.getTransaction().commit();
			session.close();
			return null;	
		}// updateFromMethod closer 
	
	
	
	
	
	
	
	
	
	
	

	@RequestMapping(value="get/{sId}", method=RequestMethod.GET)
	public @ResponseBody String getStudent(@PathVariable int sId, @ModelAttribute("formBean") FormBean formBean, Model model){
		
		SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		int x=sId;;
		
		Query query=session.createQuery(" from Student where id="+x);      //select name, id, age from Student    //from Student
   
		List<Student> studentList=query.list();
		
		Student s=studentList.get(0);
		JSONObject jsonObj = new JSONObject(s);
		model.addAttribute("student",s);
		model.addAttribute("studentList", studentList);
	
		
		/*for(Student s:studentList){
			System.out.println(s.getName());
		}*/
	//	System.out.println(student);		
	//	model.addAttribute("student", student);// when Model type is used for model
	//	model.put("studentList", studentList); // when Map type is used for model
		
		/*Query query=session.createQuery("FROM Student");
		List<Student> studentList=query.list();
		System.out.println(studentList);		
		model.addAttribute("studentList", studentList);*/
		
		/*Student student=new Student();
		student.setAge(50);
		student.setId(3);
		student.setName("Krishna");
		session.saveOrUpdate(student);*/
		
		
		
		session.getTransaction().commit();
		session.close();
		return jsonObj.toString();
	//	return "StudentPages/info";
	}// get/id method closer 
	
	//*******************************************************************************************
	
	@RequestMapping(value="/add", method=RequestMethod.GET)
	public String addStudentWithId( @ModelAttribute("formBean") FormBean formBean, Model model){
		return "StudentPages/add";
	}// addStudentWithId method closer
	
	
	//*********************************************************************************************
	@RequestMapping(value="/registered", method=RequestMethod.POST)
	public String registered(@ModelAttribute("formBean") FormBean formBean, Map<String, Object> model){
		
		String name=formBean.getName();
		int id=formBean.getId();
		int age=formBean.getAge();
		Student s=new Student();
		s.setName(name);
		s.setId(id);
		s.setAge(age);
		model.put("newComer", s);
		System.out.println(s);
		
		SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(s);
		session.getTransaction().commit();
		session.close();
		return "StudentPages/registered";
	}//registered method closer
	
	
	

	@RequestMapping(value="/delete/{sId}", method=RequestMethod.GET)
	public String deleteStudent(@PathVariable int sId, @ModelAttribute("formBean") FormBean formBean, Model model){
		
		SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		int x=sId;;
		
		Query query=session.createQuery(" from Student where id="+x);      //select name, id, age from Student    //from Student
   
		List<Student> studentList=query.list();
		
		Student s=studentList.get(0);
		model.addAttribute("student",s);
		model.addAttribute("studentList", studentList);
	
		
		session.delete(s);
		
		
		session.getTransaction().commit();
		session.close();
		return "StudentPages/info";
	}
	
	//*******************************************************************************************
	
	@RequestMapping(value="/{dName}/{id}", method=RequestMethod.GET)// dName is department name
	public String getStudentOrTeacher(@PathVariable String dName, @PathVariable int id,
			@ModelAttribute("formBean") FormBean formBean, Model model){
		
		SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		String dept=null;
		int idNo=id;
		if(dName.startsWith("s"))dept="Student";
		if(dName.startsWith("t"))dept="Teacher";
		
		
		Query query=session.createQuery(" from"+"  "+dept+" where id="+idNo);      //select name, id, age from Student    //from Student
   System.out.println(" from"+dName+" where id="+idNo);
		
   List list=query.list();
	
		model.addAttribute("student",list.get(0));
	model.addAttribute("studentList", list);
   
   /*List<Student> studentList=query.list();
		
		Student s=studentList.get(0);
		model.addAttribute("student",s);
		model.addAttribute("studentList", studentList);*/
	
		
		/*for(Student s:studentList){
			System.out.println(s.getName());
		}*/
	//	System.out.println(student);		
	//	model.addAttribute("student", student);// when Model type is used for model
	//	model.put("studentList", studentList); // when Map type is used for model
		
		/*Query query=session.createQuery("FROM Student");
		List<Student> studentList=query.list();
		System.out.println(studentList);		
		model.addAttribute("studentList", studentList);*/
		
		/*Student student=new Student();
		student.setAge(50);
		student.setId(3);
		student.setName("Krishna");
		session.saveOrUpdate(student);*/
		
		
		
		session.getTransaction().commit();
		session.close();
		return "StudentPages/info";
	}// getStudentOrTeacher method closer
	
	@RequestMapping(value="/addRelative", method=RequestMethod.GET)
	public String addRelative( @ModelAttribute("formBean") FormBean formBean, Model model){
		SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		Query query2=session.createQuery(" from Country");
		List<Country> countryList=query2.list();
		model.addAttribute("countryList", countryList);
		System.out.println(countryList);
		session.getTransaction().commit();
		session.close();
		return "RelativePages/addRelative";
	}// addStudentWithId method closer
	
	
	//*********************************************************************************************
	@RequestMapping(value="/relativeRegister", method=RequestMethod.POST)
	public String Relativeregistered(@ModelAttribute("formBean") FormBean formBean, Map<String, Object> model){
		
		
		ApplicationContext context=new ClassPathXmlApplicationContext("Application-context.xml");
		System.out.println("book from the application-context  "+(Book)context.getBean("book"));	
		System.out.println("book from the application-context  "+context.getBean("book",Book.class));	
		String name=formBean.getCountry().getName();
		System.out.println("name of selected Country =  "+name);
		int id=formBean.getId();
		int age=formBean.getAge();
		Student s=new Student();
		s.setName(name);
		s.setId(id);
		s.setAge(age);
		model.put("newComer", s);
		System.out.println(s);
		
		SessionFactory sessionFactory=new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session session=sessionFactory.openSession();
		session.beginTransaction();
		session.saveOrUpdate(s);
		session.getTransaction().commit();
		session.close();
		return "StudentPages/registered";
	}//registered method closer
	
	
	
	@RequestMapping(value="getAjax", method=RequestMethod.GET)
	public @ResponseBody String callAjax( @ModelAttribute("formBean") FormBean formBean, Model model){
		
		SessionFactory sessionFactory=new Configuration().configure().buildSessionFactory();
		Session session=sessionFactory.openSession();
		session.beginTransaction();
	
		
		System.out.println("mapped without / after class and method");
		
		Query query=session.createQuery(" from Student where id=199");      //select name, id, age from Student    //from Student
   
		List<Student> studentList=query.list();
		
		Student s=studentList.get(0);
		JSONObject jsonObj = new JSONObject(s);
		model.addAttribute("student",s);
		model.addAttribute("studentList", studentList);
			
		session.getTransaction().commit();
		session.close();
		return jsonObj.toString();
	//	return "StudentPages/info";
	}
	

	@RequestMapping(value="/goAjax", method=RequestMethod.GET)
	public String checkAjax(){
		return "StudentPages/TryAjax";
	}
	
	@RequestMapping(value="/goSimple", method=RequestMethod.GET)
	public String goSimple(){
		ApplicationContext context=SpringContextLocator.getApplicationContext();
		if(context!=null){
		Book bok=(Book) context.getBean("book");
		log.info("this is from logger "+bok.getAuthorName());
		System.out.println(bok.getAuthorName());
		}
		return "LearnJSPRules/simple";
	}
	
	@RequestMapping(value="/goJs", method=RequestMethod.GET)
	public String checkJs(){
		return "StudentPages/TryJs";
	}
}// class closer
