package spring.mvc;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

public class ServletController extends AbstractController  {
	private Book book;
	private String message;
	
	public void setBook(Book book) {
		this.book = book;
	}

	public String getMessage() {
		return message;
	}

	public Book getBook() {
		return book;
	}

	
	public void setMessage(String message) {
		this.message = message;
	}

	@Override
	public ModelAndView handleRequestInternal(HttpServletRequest req,
			HttpServletResponse res) throws Exception {
		/*req.setAttribute("myBook", book);
		RequestDispatcher rd=req.getRequestDispatcher("/WEB-INF/Pages/hellopage.jsp");
		rd.forward(req, res);*/
		
		return new ModelAndView("GreetPages/hellopage", "x", book);
		
	}

}
