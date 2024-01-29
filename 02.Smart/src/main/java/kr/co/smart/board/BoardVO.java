package kr.co.smart.board;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class BoardVO {
	private int id, readcnt, no;
	private String title, content, writer;
	private Date writedate;
	//파일여러건
}
