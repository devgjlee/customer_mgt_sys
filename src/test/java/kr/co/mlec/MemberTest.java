package kr.co.mlec;

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import kr.co.mlec.member.vo.MemberVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"classpath:config/**/*.xml"})
public class MemberTest {
	
	@Autowired
	private SqlSessionTemplate session;

	@Test
	public void ·Î±×ÀÎTest() throws Exception {

		MemberVO loginVO = new MemberVO();
		loginVO.setId("user");
		loginVO.setPassword("user");
		
		MemberVO userVO = session.selectOne("member.dao.MemberDAO.login", loginVO);
		
		assertNotNull(userVO);
	}
}
















