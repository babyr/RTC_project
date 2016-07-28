package RTC_project.mapper;

import RTC_project.dto.User;

public interface UserMapper {
	User selectByLoginId(String loginId);
	void insert(User user);
	void update(User user);
	User selectById(int id);
}
