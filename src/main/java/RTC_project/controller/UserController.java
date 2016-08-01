package RTC_project.controller;

import java.net.URLEncoder;
import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import RTC_project.dto.User;
import RTC_project.mapper.UserMapper;
import RTC_project.service.UserService;

@Controller
public class UserController {
	
	@Autowired 
		UserMapper map;

	@Autowired
		UserService userService;
	
	
	@RequestMapping(value="/User/login.do",method=RequestMethod.GET)
	public String login(Model model){
			return "User/login";
	
	}
	
	@RequestMapping(value="/User/member.do",method=RequestMethod.GET)
	public String member(Model model){
		User user = new User();
		model.addAttribute("user",user);
		return "User/member";
	}
	
	@RequestMapping(value="/User/id_check.do",method=RequestMethod.GET)
	public @ResponseBody String id_check(@RequestParam("id") String id) throws Exception{
		URLEncoder.encode(id,"UTF-8");
		String msg="";
		if(map.selectByLoginId(id)==null){
			msg="success";
		}else
			msg="fail";
		return msg.toString();
	}
	@RequestMapping(value="/User/member.do",method=RequestMethod.POST)
	public String member(Model model, User user){
		String message= userService.validateBeforeInsert(user);
		if(message == null){
			map.insert(user);
			model.addAttribute("success","회원가입 성공.");
		}else{
			model.addAttribute("error",message);
		}
		return "User/member";
	}
	
	@RequestMapping(value="/User/edit.do",method=RequestMethod.GET)
	public String edit(Model model){
		model.addAttribute("user",UserService.getCurrentUser());
		return "User/edit";
	}
	
	@RequestMapping(value="/User/edit.do",method=RequestMethod.POST)
	public String edit(User user, Model model){
		String message = userService.validateBeforeUpdate(user);
		if(message == null){
			map.update(user);
			UserService.setCurrentUser(user);
			model.addAttribute("success","정보변경 성공.");
		}else{
			return message;
		}
		return "User/edit";
	}
	
}