package RTC_project;

import java.util.List;

public interface UserMapper {
	User selectByLoginId(String loginId);

	void insert(User user);
	void update(User user);
	User selectById(int id);

	List<User> recieve_id(String user_id);
	List<User> send_id(String user_id);
	void approve(String user_id);
	List<User> selectByname(String name);

}
