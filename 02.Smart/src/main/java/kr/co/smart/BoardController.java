package kr.co.smart;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller @RequestMapping("/board")
public class BoardController {

	//방명록 목록화면 요청
	@RequestMapping("/list")
	public String list() {
		return "board/list";
	}
	
}
