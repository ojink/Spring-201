package kr.co.smart.common;

import java.util.List;

import kr.co.smart.notice.NoticeVO;
import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class PageVO {
//	  페이지당 보여질 목록 수 : 4
//	  블럭당 보여질 페이지의 수 : 3
//	  총 목록수 : 30
	private int pageList = 10;  //페이지당 보여질 목록 수
	private int blockPage = 10;
	private int totalList;
	private int totalPage;
	private int totalBlock;
	private int beginList, endList;
	private int curBlock, curPage = 1;
	private int beginPage, endPage;
	private List<Object> list;
	private String search="all", keyword="";
	
	public void setTotalList(int totalList) {
		this.totalList = totalList;
//		  총 페이지수 : 39페이지 = 384 / 10 = 38 ... 4
		totalPage = totalList / pageList;
		if( totalList % pageList > 0 ) ++totalPage;
		
//		  총 블록수 : 4블록 = 39 / 10 = 3 ... 9
		totalBlock = totalPage / blockPage;
		if( totalPage % blockPage > 0 ) ++totalBlock;
		
//		각 페이지의 끝 목록번호 :  총 목록수 - (페이지번호-1) * 페이지당 보여질 목록수 
//		각 페이지의 시작 목록번호 :  끝 목록번호 - (페이지당 보여질 목록수-1)
		endList = totalList - (curPage-1) * pageList;
		beginList = endList - (pageList-1);
		
//		 블록번호 : 페이지번호 / 블록당 보여질 페이지수
		curBlock = curPage / blockPage;
		if( curPage % blockPage > 0 ) ++curBlock;
//		 각 블럭의 끝 페이지번호 : 블록번호 * 블록당 보여질 페이지수
//		 각 블럭의 시작 페이지번호 : 끝 페이지번호 - (블럭당 보여질 페이지수-1)
		endPage = curBlock * blockPage;
		beginPage = endPage - (blockPage-1);
		
		//381 .... 384
		if( totalPage < endPage ) endPage = totalPage;
	}
}
