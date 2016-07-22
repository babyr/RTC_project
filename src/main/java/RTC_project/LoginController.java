package RTC_project;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class LoginController {

	@RequestMapping("/login/login.do")
	public String index(Model model){
		return "/login/login";
	}
	
	@RequestMapping(value="/login/login.do",method=RequestMethod.GET)
	public String login(Model model){
		return "login/login";
	}
}
