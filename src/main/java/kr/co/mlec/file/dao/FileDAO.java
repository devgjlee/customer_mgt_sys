package kr.co.mlec.file.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.mlec.file.vo.FileVO;
@Repository
public class FileDAO {
	@Autowired
	private SqlSessionTemplate session;
	
	public void insertFileDB(FileVO fileVO) {
		session.insert("file.dao.FileDAO.insertFileDB", fileVO);
	}
	
	public List<FileVO> selectFile(int no) {
		List<FileVO> fileList = session.selectList("file.dao.FileDAO.selectFile", no);
		return fileList;
	}

	public FileVO fileInfo(int fileNo) {
		FileVO fileInfo = session.selectOne("file.dao.FileDAO.fileInfo", fileNo);
		return fileInfo;
	}

	public void fileDelete(String fileNo) {
		session.delete("file.dao.FileDAO.fileDelete", fileNo);
	}
}
