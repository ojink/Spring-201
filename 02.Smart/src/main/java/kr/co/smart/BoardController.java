package kr.co.smart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import kr.co.smart.board.BoardService;
import kr.co.smart.board.BoardVO;
import kr.co.smart.common.CommonUtility;
import kr.co.smart.common.PageVO;

@Controller @RequestMapping("/board")
public class BoardController {
	@Autowired private BoardService service;

	//방명록 정보화면 요청
	@RequestMapping("/info")
	public String info(int id, Model model) {
		//해당 id의 정보를 DB에서 조회해와 정보화면에 출력할 수 있도록 Model에 담기
		service.board_read(id); //조회수변경
		model.addAttribute("vo", service.board_info(id));
		model.addAttribute("crlf", "\r\n");
		return "board/info";
	}
	
	@Autowired private CommonUtility common;
	
	//방명록 신규등록처리 요청
	@RequestMapping("/insert")
	public String insert(BoardVO vo, MultipartFile[] file) {
		//첨부된 파일들을 BoardVO 의 fileList에 담기
		vo.setFileList( common.multipleFileUpload("board", file, null));
		
		//화면에서 입력한 정보로 DB에 신규삽입저장처리 -> 화면연결:목록
		service.board_register(vo);
		return "redirect:list";
	}
	
	
	//방명록 신규등록화면 요청
	@RequestMapping("/register")
	public String register() {
		return "board/register";
	}
	
	//방명록 목록화면 요청
	@RequestMapping("/list")
	public String list(PageVO page, Model model, HttpSession session) {
		session.setAttribute("category", "bo");
		//DB에서 방명록 글을 한 페이지 정보를 조회해와 화면에 출력할 수 있도록 Model에 담기
		model.addAttribute("page",  service.board_list(page) );
		return "board/list";
	}
	
}
