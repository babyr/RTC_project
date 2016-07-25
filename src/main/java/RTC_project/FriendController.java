package RTC_project;

import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FriendController {
	@Autowired
	UserMapper userMapper;
	
	@RequestMapping(value="/friend/searchUser",method=RequestMethod.POST)
	public String serachUser(@RequestParam("name") String name,Model model){
		model.addAttribute("list",userMapper.selectByname(name));
		return "friend/userlist";
		
	}
	
}
