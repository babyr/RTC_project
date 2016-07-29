package RTC_project.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import RTC_project.dto.File;

public interface FileMapper {
	List<File> selectByBoardId(int boardId);
	File selectById(int id);
	void insert(File file);
	void delete(int id);
	void deleteByBoard(int boardId);
}
