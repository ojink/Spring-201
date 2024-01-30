package kr.co.smart.board;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import kr.co.smart.common.PageVO;

@Service
public class BoardService {
	@Autowired @Qualifier("hanul") private SqlSession sql;
	
	//신규 방명록 글 저장처리
	public int board_register(BoardVO vo) {
		int dml = sql.insert("board.register", vo);
		if( dml==1 && vo.getFileList()!=null ) {
			sql.insert( "board.fileInsert", vo );
		}
		return dml;
	}
	//방명록 목록 조회
	public PageVO board_list(PageVO page) {
		page.setTotalList( sql.selectOne("board.totalList", page) );
		page.setList( sql.selectList("board.list", page) );
		return page;
	}
	//선택한 방명록 정보 조회
	public BoardVO board_info(int id) {
		return sql.selectOne("board.info", id);
	}
	//방명록 정보 변경저장처리
	public int board_update(BoardVO vo) {
		return 0;
	}
	//방명록 정보 조회수 변경저장
	public int board_read(int id) {
		return sql.update("board.read", id);
	}
	//방명록 정보 삭제처리
	public int board_delete(int id) {
		return 0;
	}
}
