package RTC_project;

public interface UserMapper {
	User selectByLoginId(String loginId);
	void insert(User user);
	void update(User user);
	User selectById(int id);
}
