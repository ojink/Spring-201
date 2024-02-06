package kr.co.smart;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

import kr.co.smart.common.CommonUtility;

@Controller @RequestMapping("/data")
public class DataController {
	private String key 
	= "FPgj2NXbJw46TcGkmAfZEiYFDbxilys7KLjk3KaB7AfeJE00ZhPNM0M8unwbsI69fSmT8SNfVEimE6ZZ2U14hA%3D%3D";

	@Autowired private CommonUtility common;
	
	private String animalURL = "http://apis.data.go.kr/1543061/abandonmentPublicSrvc/";
	
	//유기동물 시도조회 요청
	@RequestMapping("/animal/sido")
	public Object animal_sido( Model model ) {
		StringBuffer url = new StringBuffer( animalURL );
		url.append( "sido?serviceKey=" ).append( key );
		url.append( "&_type=json" );
		url.append( "&numOfRows=50" );
		model.addAttribute("list", responseAPI(url));
		return "data/animal/sido";
	}
	
	
	//유기동물 목록조회 요청
	@RequestMapping("/animal/list")
	public Object animal_list(int pageNo, int numOfRows, Model model) {
		StringBuffer url = new StringBuffer( animalURL );
		url.append( "abandonmentPublic?serviceKey=" ).append( key );
		url.append("&_type=json");
		url.append("&pageNo=").append(pageNo);
		url.append("&numOfRows=").append(numOfRows);
		
		//return responseAPI(url);
		model.addAttribute("list", responseAPI(url));
		return "data/animal/animal_list";
	}
	
	
	//약국정보조회 요청
	@ResponseBody @RequestMapping("/pharmacy")
	public Object pharmacy_list(int pageNo, int numOfRows) {
		//공공데이터 포털에서 약국정보를 조회해오기
		//"https://apis.data.go.kr/B551182/pharmacyInfoService/getParmacyBasisList
		//?_type=json
		//&ServiceKey=FPgj2NXbJw46TcGkmAfZEiYFDbxilys7KLjk3KaB7AfeJE00ZhPNM0M8unwbsI69fSmT8SNfVEimE6ZZ2U14hA%3D%3D";
		StringBuffer url 
		= new StringBuffer("https://apis.data.go.kr/B551182/pharmacyInfoService/getParmacyBasisList");
		url.append("?ServiceKey=").append(key);
		url.append("&_type=json");
		url.append("&pageNo=").append(pageNo);
		url.append("&numOfRows=").append(numOfRows);
		
//		new Gson().fromJson( common.requestAPI(url.toString())
//							, new TypeToken< HashMap<String, Object> >(){}.getType() ) ;
		
		return responseAPI(url);
	}
	
	
	private HashMap<String, Object> responseAPI( StringBuffer url ) {
		return new Gson().fromJson( common.requestAPI(url.toString())
				, new TypeToken< HashMap<String, Object> >(){}.getType() ) ;
	}
	
	
	//공공데이터 목록화면 요청
	@RequestMapping("/list")
	public String list(HttpSession session) {
		session.setAttribute("category", "da");
		return "data/list";
	}
	
	
}