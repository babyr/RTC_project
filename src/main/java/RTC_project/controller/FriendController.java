package RTC_project.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.apache.commons.lang3.StringUtils;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import RTC_project.dto.Friend;
import RTC_project.mapper.FriendMapper;
import RTC_project.mapper.UserMapper;
import RTC_project.service.UserService;



@Controller
public class FriendController {
	
	@Autowired
	UserMapper userMapper;
	@Autowired
	UserService userService;

	@Autowired
		FriendMapper fmap;
	
	
	@RequestMapping(value="/searchFriend.do",method=RequestMethod.POST)
	public String serachUser(@RequestParam("loginId") String name,Model model){
		model.addAttribute("list",userMapper.selectById_friend(name,UserService.getCurrentUser().getLoginId()));
		return "friend/Friend_search";
		
	}
	
	@RequestMapping("/searchFriend.do")
	public String FriendList(Model model){
		model.addAttribute("flist",fmap.friendList_2(UserService.getCurrentUser().getLoginId()));
		model.addAttribute("present",UserService.getCurrentUser().getLoginId());
		return "friend/FriendList";
		
	}
	@RequestMapping("/searchFriend_adding.do")
	public String FriendList_(Model model){
		
		model.addAttribute("present",UserService.getCurrentUser().getId());
		model.addAttribute("flist",fmap.friendList_1(UserService.getCurrentUser().getLoginId()));
		return "friend/Friendadd";
		
	}
	@RequestMapping("/approve.do")
	public String FriendList_approve(Model model,@RequestParam("id") String login){
		System.out.println(login);
		System.out.println(UserService.getCurrentUser().getLoginId());
		fmap.approve(UserService.getCurrentUser().getLoginId(), login);
		return "User/index";
		
	}
	@RequestMapping("/Friend_add.do")
	public String Friendadd(Model model,@RequestParam("id") String login){
		SimpleDateFormat date = new SimpleDateFormat("yyyy/mm/dd/hh:mm:ss");
		
		List<Friend> list = new ArrayList<Friend>(); 
		list=fmap.friendList_2(UserService.getCurrentUser().getLoginId());
		for(int a=0;a<list.size();a++){
			if(list.get(a).getFriend_id().equals(login)||list.get(a).getUser_id().equals(login)){
				boolean error=false;
				model.addAttribute("error",error);
				return "friend/friend_form"; 
			}
		}
		fmap.friend_add(UserService.getCurrentUser().getId(), login, false, 
				date.format(new Date()), date.format(new Date()));
		boolean error=true;
		model.addAttribute("error",error);
		return "friend/friend_form";
		
	}
	@RequestMapping("/friend_form")
	public String se(Model model){
		return "friend/friend_form";
	}
	
}
