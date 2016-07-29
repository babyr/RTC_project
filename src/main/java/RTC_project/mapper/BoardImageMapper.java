package RTC_project.mapper;

import org.apache.ibatis.annotations.Param;

public interface BoardImageMapper {
	void insert(@Param("boardId") int boardId, @Param("imageId") int imageId);
	void deleteByBoardId(int boardId);
}
