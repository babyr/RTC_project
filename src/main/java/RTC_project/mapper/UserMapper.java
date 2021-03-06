package RTC_project.mapper;

import RTC_project.dto.Friend;
import RTC_project.dto.Friend_add;
import RTC_project.dto.User;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface UserMapper {
	User selectByLoginId(String loginId);
	void insert(User user);
	void update(User user);
	User selectById(int id);
	List<User> selectById_friend(@Param("fid")String fid,@Param("id") String id);
	List<Friend> friendList(int id);
	List<Friend> friendList_2(int id);
	List<Friend_add> friendList_1(String id);
	void friend_add(@Param("user_id")int user_id,@Param("friend_id")String friend_id,@Param("state")boolean state,@Param("send_data")String send_data,@Param("receive_date")String receive_date);
}
