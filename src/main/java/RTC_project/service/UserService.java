package RTC_project.service;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import RTC_project.dto.User;
import RTC_project.mapper.UserMapper;

@Service
public class UserService {

	@Autowired
	UserMapper userMapper;
	
	public String validateBeforeInsert(User user){
		String s = user.getLoginId();
		User user2 = userMapper.selectByLoginId(s);
		if(user2!=null)
			return "로그인 ID가 중복됩니다.";
		
		if(StringUtils.isBlank(s))
			return "로그인 ID를 입력하세요.";
		
		s = user.getPasswd();
		if(StringUtils.isBlank(s))
			return "비밀번호를 입력하세요.";
		
		s = user.getName();
		if(StringUtils.isBlank(s))
			return "이름을 입력하세요.";
		
		s = user.getPhoneNumber();
		if(StringUtils.isBlank(s))
			return "전화번호를 입력하세요.";
		
		s = user.getBirth();
		if(StringUtils.isBlank(s))
			return"생년월일을 입력하세요.";
		
		s = user.getEmail();
		if(StringUtils.isBlank(s))
			return "이메일을 입력하세요.";
		
		return null;
	}
	
	public String validateBeforeUpdate(User user){
		String s =user.getPasswd();
		if(StringUtils.isBlank(s))
			return "비밀번호를 입력하세요.";
		
		s = user.getBirth();
		if(StringUtils.isBlank(s))
			return "생년월일을 입력하세요.";
		
		s = user.getPhoneNumber();
		if(StringUtils.isBlank(s))
			return "전화번호를 입력하세요.";
		
		s = user.getEmail();
		if(StringUtils.isBlank(s))
			return "이메일을 입력하세요.";
		
		return null;
		
	}
	  public static User getCurrentUser() {
	        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
	        if (authentication instanceof MyAuthenticationProvider.MyAuthenticaion)
	            return ((MyAuthenticationProvider.MyAuthenticaion) authentication).getUser();
	        return null;
	    }

	    public static void setCurrentUser(User user) {
	        ((MyAuthenticationProvider.MyAuthenticaion)
	                SecurityContextHolder.getContext().getAuthentication()).setUser(user);
	    }

}
