package RTC_project.mapper;

import java.util.List;

import RTC_project.dto.Board;
import RTC_project.dto.Pagination;

public interface BoardMapper {
	Board selectById(int id);
	List<Board> selectPage(Pagination pagination);
	int selectCount(Pagination pagination);
	void insert(Board board);
	void updateReadCount(int id);
	void update(Board board);
	void delete(int id);
}
