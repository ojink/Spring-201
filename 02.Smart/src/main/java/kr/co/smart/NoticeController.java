package kr.co.smart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.smart.notice.NoticeService;

@Controller @RequestMapping("/notice")
public class NoticeController {
	@Autowired private NoticeService service;
	
	//공지글등록화면 요청
	@RequestMapping("/register")
	public String register() {
		return "notice/register";
	}
	
	//공지글정보화면 요청
	@RequestMapping("/info")
	public String info(int id, Model model) {
		service.notice_read(id);
		//선택한 공지글정보를 DB에서 조회해와 화면에 출력할 수 있도록 Model객체에 담기
		model.addAttribute("vo", service.notice_info(id));
		return "notice/info";
	}
	
	
	//공지글목록화면 요청
	@RequestMapping("/list")
	public String list(Model model, HttpSession session) {
		session.setAttribute("category", "no");
		//DB에서 조회한 정보를 화면에 출력할 수 있도록 Model객체에 담기
		model.addAttribute( "list", service.notice_list() );
		return "notice/list";
	}
	
}
