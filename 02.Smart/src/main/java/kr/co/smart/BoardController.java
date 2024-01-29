package kr.co.smart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.smart.board.BoardService;
import kr.co.smart.common.PageVO;

@Controller @RequestMapping("/board")
public class BoardController {
	@Autowired private BoardService service;

	//방명록 목록화면 요청
	@RequestMapping("/list")
	public String list(PageVO page, Model model, HttpSession session) {
		session.setAttribute("category", "bo");
		//DB에서 방명록 글을 한 페이지 정보를 조회해와 화면에 출력할 수 있도록 Model에 담기
		model.addAttribute("page",  service.board_list(page) );
		return "board/list";
	}
	
}
