package kr.co.smart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.smart.common.CommonUtility;
import kr.co.smart.member.MemberService;
import kr.co.smart.member.MemberVO;

@Controller @RequestMapping("/member")
public class MemberController {
	@Autowired private CommonUtility common;
	@Autowired private MemberService service;
	@Autowired private BCryptPasswordEncoder pwEncoder;
	
	//로그인 처리 요청
	@ResponseBody @RequestMapping(value="/smartLogin", produces = "text/html; charset=utf-8")
	public String login(HttpServletRequest request, String user_id, String user_pw) {
		//화면에서 입력한 아이디/비번이 일치하는 회원정보를 조회
		MemberVO vo = service.member_info(user_id);
		
		StringBuffer msg = new StringBuffer("<script>");
		
		if( vo == null ) {
			//로그인 되지 않은 경우
			msg.append("alert('아이디나 비밀번호가 일치하지 않습니다'); history.go(-1)");
		}else {
			
			
			//로그인 된 경우 - 웰컴페이지로 연결
			msg.append("location='"). append( common.appURL(request) )  .append("'"); // location=''
		}
		
		msg.append("</script>");
		
		return msg.toString();
	}
	
	
	//로그인 화면 요청
	@RequestMapping("/login")
	public String login(HttpSession session) {
		session.setAttribute("category", "login");
		return "default/member/login";
	}
	
}
