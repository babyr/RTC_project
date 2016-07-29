package RTC_project;

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



@Controller
public class FriendController {
	
	@Autowired
	UserMapper userMapper;
	@Autowired
	UserService userService;

	@Autowired
		FriendMapper fmap;
	
	
	@RequestMapping(value="/User/searchFriend.do",method=RequestMethod.POST)
	public String serachUser(@RequestParam("name") String name,Model model){
		System.out.println(name);
		boolean check;
		model.addAttribute("list",userMapper.selectByName(name));
		return "User/login";
		
	}
	
	@RequestMapping("/User/searchFriend.do")
	public String FriendList(Model model){
				
		model.addAttribute("flist",fmap.friendList_2(UserService.getCurrentUser().getLoginId()));
		model.addAttribute("present",UserService.getCurrentUser().getLoginId());
		return "friend/FriendList";
		
	}
	@RequestMapping("/User/searchFriend_adding.do")
	public String FriendList_(Model model){
		model.addAttribute("present",UserService.getCurrentUser().getId());
		model.addAttribute("flist",fmap.friendList_1(UserService.getCurrentUser().getLoginId()));
		return "friend/Friendadd";
		
	}
	@RequestMapping("/User/approve.do")
	public String FriendList_approve(Model model,@RequestParam("id") String login){
		fmap.approve(UserService.getCurrentUser().getLoginId(), login);
		return "User/login";
		
	}
	@RequestMapping("/User/Friend_add.do")
	public String Friendadd(Model model,@RequestParam("id") String login){
		SimpleDateFormat date = new SimpleDateFormat("yyyy/mm/dd/hh:mm:ss");
		
		List<Friend> list = new ArrayList<Friend>(); 
		list=fmap.friendList_2(UserService.getCurrentUser().getLoginId());
		for(int a=0;a<list.size();a++){
			if(list.get(a).getFriend_id().equals(login)||list.get(a).getUser_id().equals(login)){
				boolean error=false;
				model.addAttribute("error",error);
				return "User/login"; 
			}
		}
		fmap.friend_add(UserService.getCurrentUser().getId(), login, false, 
				date.format(new Date()), date.format(new Date()));
		System.out.println("asdasdasdasd");
		return "User/login";
		
	}
	
}
