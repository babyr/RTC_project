package RTC_project.controller;

import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import RTC_project.dto.Board;
import RTC_project.dto.File;
import RTC_project.dto.Image;
import RTC_project.dto.Pagination;
import RTC_project.mapper.BoardImageMapper;
import RTC_project.mapper.BoardMapper;
import RTC_project.mapper.FileMapper;
import RTC_project.mapper.ImageMapper;
import RTC_project.service.BoardService;
import RTC_project.service.UserService;

@Controller
public class BoardController {
	@Autowired
	BoardMapper boardMapper;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	FileMapper fileMapper;
	
	@Autowired
	ImageMapper imageMapper;
	
	@Autowired
	BoardImageMapper boardImageMapper;
	
	@RequestMapping("/Board/list.do")
	public String list(Model model, Pagination pagination){
		pagination.setRecordCount(boardMapper.selectCount(pagination));
		model.addAttribute("list",boardMapper.selectPage(pagination));
		return "Board/list";
	}
	
	@RequestMapping("/Board/board.do")
	public String board(Model model, @RequestParam("id") int id, Pagination pagination){
		Board board = boardMapper.selectById(id);
		//if(!boardService.isAuthor(board))
			boardMapper.updateReadCount(id);
		model.addAttribute("board",board);
		model.addAttribute("canEdit",boardService.canEdit(board));
		model.addAttribute("canDelete",boardService.canDelete(board));
		model.addAttribute("files",fileMapper.selectByBoardId(id));
		return "Board/board";
	}
	
	@Secured("ROLE_전체")
	@RequestMapping(value="/Board/create.do", method=RequestMethod.GET)
	public String create(Model model, Pagination pagination){
		return "Board/create";
	}
	
	@Secured("ROLE_전체")
	@RequestMapping(value="/Board/create.do", method=RequestMethod.POST)
	public String create(Model model, Pagination pagination, Board board ,@RequestParam("file") MultipartFile[] uploadedFiles ) throws IOException{
		String errMsg = boardService.validate(board);
		if(errMsg!=null){
			model.addAttribute("errMsg",errMsg);
			return "Board/create";
		}
		if(boardService.canCreate(pagination.getBoardId())){
			board.setId(pagination.getBoardId());
			board.setUserId(UserService.getCurrentUser().getId());
			boardMapper.insert(board);
			boardService.updateBoardImage(board);
			imageMapper.deleteOrphan();
			for(MultipartFile uploadedFile : uploadedFiles){
				if(uploadedFile.getSize()>0){
					File file = new File();
					file.setBoardId(board.getId());
					file.setUserId(UserService.getCurrentUser().getId());
					file.setFileName(Paths.get(uploadedFile.getOriginalFilename()).getFileName().toString());
					file.setFileSize((int)uploadedFile.getSize());
					file.setData(uploadedFile.getBytes());
					fileMapper.insert(file);
				}
			}
		}
		return "redirect:/Board/list.do";
	}
	
	@Secured("ROLE_전체")
	@RequestMapping(value="/Board/edit.do", method=RequestMethod.GET)
	public String edit(Model model, @RequestParam("id") int id, Pagination pagination){
		model.addAttribute("board",boardMapper.selectById(id));
		model.addAttribute("files",fileMapper.selectByBoardId(id));
		return "Board/edit";
	}
	
	@Secured("ROLE_전체")
	@RequestMapping(value="/Board/edit.do", method=RequestMethod.POST, params="cmd=save")
	public String edit(Model model, Pagination pagination, Board board, @RequestParam("file") MultipartFile[] uploadedFiles) throws IOException{
		String errMsg = boardService.validate(board);
		if(errMsg!=null){
			model.addAttribute("errMsg",errMsg);
			return "Board/create";
		}
		if(boardService.canEdit(boardMapper.selectById(board.getId()))){
			boardMapper.update(board);
			boardService.updateBoardImage(board);
			imageMapper.deleteOrphan();
			for(MultipartFile uploadedFile : uploadedFiles){	
				if(uploadedFile.getSize()>0){
					File file = new File();
					file.setBoardId(board.getId());
					file.setUserId(UserService.getCurrentUser().getId());
					file.setFileName(Paths.get(uploadedFile.getOriginalFilename()).getFileName().toString());
					file.setFileSize((int)uploadedFile.getSize());
					file.setData(uploadedFile.getBytes());
					fileMapper.insert(file);
				}
			}
		}
		return "redirect:/Board/board.do?id="+board.getId()+"&"+pagination.getQueryString();
	}
	@Secured("ROLE_전체")
	@RequestMapping(value="/Board/edit.do", method=RequestMethod.POST, params="cmd=deleteFile")
	public String edit(Model model, Pagination pagination, Board board, @RequestParam("fileId") int fileId){
		if(boardService.canEdit(boardMapper.selectById(board.getId())))
			fileMapper.deleteByBoard(fileId);
		model.addAttribute("files",fileMapper.selectByBoardId(board.getId()));
		return "board/edit";
	}
	@Secured("ROLE_전체")
	@RequestMapping("/Board/delete.do")
	public String delete(Model model, @RequestParam("id") int id, Pagination pagination){
		if(boardService.canDelete(boardMapper.selectById(id))){
			fileMapper.deleteByBoard(id);
			boardImageMapper.deleteByBoardId(id);
			boardMapper.delete(id);
			imageMapper.deleteOrphan();
		}
		return "redirect:/Board/list.do?"+pagination.getQueryString();
	}
	
	@RequestMapping("/Board/download.do")
    public void download(@RequestParam("id") int id, HttpServletResponse response) throws IOException {
        File file = fileMapper.selectById(id);
        if (file == null) return;
        String fileName = URLEncoder.encode(file.getFileName(),"UTF-8");
        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ";");
        try (BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream())) {
            output.write(file.getData());
        }
    }

	@RequestMapping("/Board/{id}/image.do")
	public void image(@PathVariable("id") int id, HttpServletResponse response) throws IOException{
		Image image = imageMapper.selectById(id);
		if(image==null) return;
		String fileName = URLEncoder.encode(image.getFileName(),"UTF-8");
		response.setContentType(image.getMimeType());
		response.setHeader("Content-Disposition", "filename="+fileName+";");
		try(BufferedOutputStream output = new BufferedOutputStream(response.getOutputStream())){
			output.write(image.getData());
		}
	}
	
	@Secured("ROLE_전체")
	@RequestMapping(value="/Board/smartEditorUpload.do", method=RequestMethod.POST)
	public String photoUpload(@RequestParam("callback") String callback, @RequestParam("callback_func") String callback_func, @RequestParam("Filedata") MultipartFile uploadedFile)throws IOException{
		String r;
		String fname = Paths.get(uploadedFile.getOriginalFilename()).getFileName().toString();
		if(uploadedFile.getSize()>0){
			Image image = new Image();
			image.setUserId(UserService.getCurrentUser().getId());
			image.setFileName(fname);
			image.setFileSize((int)uploadedFile.getSize());
			image.setData(uploadedFile.getBytes());
			imageMapper.insert(image);
			r = "&bNewLine=true&sFileName=" + fname +
	                "&sFileURL=/RTC_project/Board/"+image.getId()+"/image.do";

		}else
			r="&errstr="+fname;
		String url = callback+"?callback_func=" + callback_func + r;
		return "redirect:"+url;
	}
	
	@Secured("ROLE_전체")
	@RequestMapping(value="/Board/smartEditorUpload5.do", method=RequestMethod.POST)
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){
		try{
			String fileName = request.getHeader("file-name");
			int fileSize = Integer.parseInt(request.getHeader("file-size"));
			InputStream input = request.getInputStream();
			int count =0;
			byte[] data = new byte[fileSize];
			while(count<fileSize)
				count += input.read(data,count,data.length - count);
			Image image = new Image();
			image.setUserId(UserService.getCurrentUser().getId());
			image.setFileName(fileName);
			image.setFileSize(fileSize);
			image.setData(data);
			imageMapper.insert(image);
			
			String s = "&bNewLine=true&sFileName="+ fileName;
            s += "&sFileURL=/RTC_project/Board/"+image.getId()+"/image.do";
            PrintWriter out = response.getWriter();
            out.print(s);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
}
