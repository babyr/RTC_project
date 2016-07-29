package RTC_project;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface FriendMapper {
	void approve(@Param("id")String id,@Param("user")String f_id );
	List<Friend> friendList(int id);
	List<Friend> friendList_2(String id);
	List<Friend_add> friendList_1(String id);
	void friend_add(@Param("user_id")int user_id,@Param("friend_id")String friend_id,@Param("state")boolean state,@Param("send_data")String send_data,@Param("receive_date")String receive_date);
}
