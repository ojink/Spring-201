package kr.co.smart.common;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service
public class CommonUtility {
	
	// 웹브라우저 요청의 루트반환
	public String appURL(HttpServletRequest request) {
		StringBuffer url = new StringBuffer("http://");
		url.append( request.getServerName() ).append(":"); 	// http://localhost:, http://127.0.0.1:
		url.append( request.getServerPort() ); 				// http://localhost:80, http://127.0.0.1:8080
		url.append( request.getContextPath() ); 			// http://localhost:80/smart, http://127.0.0.1:8080/web
		return url.toString();
	}

}
