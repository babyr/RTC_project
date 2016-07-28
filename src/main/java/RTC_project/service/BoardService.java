package RTC_project.service;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import RTC_project.dto.Board;
import RTC_project.dto.User;
import RTC_project.mapper.BoardImageMapper;

@Service
public class BoardService {

	@Autowired
	BoardImageMapper boardImageMapper;
	
	public boolean isAuthor(Board board){
		return (UserService.getCurrentUser()!=null && (board.getUserId() == UserService.getCurrentUser().getId()));
	}
	
	public boolean canCreate(int boardId){
		User user = UserService.getCurrentUser();
		if(user == null) return false;
		return true;
	}
	
	public boolean canEdit(Board board){
		return isAuthor(board);
	}
	
	public boolean canDelete(Board board){
		User user = UserService.getCurrentUser();
		if(user == null) return false;
		return isAuthor(board);
	}
	
	public String validate(Board board){
		if(StringUtils.isBlank(board.getTitle()))
			return "제목을 입력하세요.";
		if(StringUtils.isBlank(board.getBody()))
			return "내용을 입력하세요,";
		return null;
	}
	
	public void updateBoardImage(Board board){
		boardImageMapper.deleteByBoardId(board.getId());
		String pattern = "Board/([0-9]+)/image.do";
		Pattern r = Pattern.compile(pattern);
		Matcher m = r.matcher(board.getBody());
		while(m.find()){
			int imageId = Integer.parseInt(m.group(1));
			boardImageMapper.insert(board.getId(), imageId);
		}
	}
}
