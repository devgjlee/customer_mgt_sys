package kr.co.mlec;

import javax.sql.DataSource;

import org.junit.Ignore;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.mlec.board.dao.BoardDAO;
import kr.co.mlec.board.service.BoardService;
import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.file.dao.FileDAO;
import kr.co.mlec.file.service.FileService;
import kr.co.mlec.file.vo.FileVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:config/spring/*.xml"})
public class Test {
	
	@Autowired
	private BoardService service;
	
	@Autowired
	private FileService fservice;
	
	@org.junit.Test
	public void º°°ª() throws Exception {
		fservice.selectFile(17);
		BoardVO board = service.detailBoard(17);
		System.out.println(board);
		
	}
}
