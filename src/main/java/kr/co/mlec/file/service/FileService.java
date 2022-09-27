package kr.co.mlec.file.service;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.mlec.board.vo.BoardVO;
import kr.co.mlec.file.dao.FileDAO;
import kr.co.mlec.file.vo.FileVO;

@Service
public class FileService {
	@Autowired
	private FileDAO fileDAO;

	@Autowired
	ServletContext servletContext;

	// 파일 등록 기능
	public void fileUpload(MultipartHttpServletRequest mRequest) throws Exception {
		FileVO fileVO = new FileVO();
//		System.out.println("getparam no: " + mRequest.getParameter("bizRegisNum"));
//		fileVO.setNo(Integer.parseInt(mRequest.getParameter("no")));
		if(mRequest.getParameter("bizRegisNum") != null) {
			fileVO.setBizRegisNum(mRequest.getParameter("bizRegisNum"));
		}
		fileVO.setOriginFileName("");
		fileVO.setStoredFileName("");
		// 실행되는 웹어플리케이션의 실제 경로 가져오기
		String uploadDir = servletContext.getRealPath("/upload/");
//		System.out.println(uploadDir);

		Iterator<String> iter = mRequest.getFileNames();
//		System.out.println("FileService에서 호출: " + mRequest.getFileNames());
		while (iter.hasNext()) {

			String formFileName = iter.next();
			// 폼에서 파일을 선택하지 않아도 객체 생성됨
			MultipartFile mFile = mRequest.getFile(formFileName);

			// 원본 파일명
			String oriFileName = mFile.getOriginalFilename();
//			System.out.println("원본 파일명 : " + oriFileName);
			fileVO.setOriginFileName(oriFileName);

			if (oriFileName != null && !oriFileName.equals("")) {

				// 확장자 처리
				String ext = "";
				// 뒤쪽에 있는 . 의 위치
				int index = oriFileName.lastIndexOf(".");
				if (index != -1) {
					// 파일명에서 확장자명(.포함)을 추출
					ext = oriFileName.substring(index);
				}

				// 파일 사이즈
				long fileSize = mFile.getSize();
//				System.out.println("파일 사이즈 : " + fileSize);

				// 고유한 파일명 만들기
				String saveFileName = oriFileName + UUID.randomUUID().toString() + ext;
//				System.out.println("저장할 파일명 : " + saveFileName);
				fileVO.setStoredFileName(saveFileName);
				// 임시저장된 파일을 원하는 경로에 저장
				mFile.transferTo(new File(uploadDir + saveFileName));
			}
//			System.out.println(fileVO.getOriginFileName());
			// 여기서 서비스 호출.

//			System.out.println(fileVO);
			fileDAO.insertFileDB(fileVO);
		}

	}

	//첨부 파일 목록 select 해오기
	public List<FileVO> selectFile(int no) {
		List<FileVO> fileList = fileDAO.selectFile(no);
		return fileList;
	}

	public FileVO fileInfo(int fileNo) {
		FileVO fileInfo = fileDAO.fileInfo(fileNo);
		
		return fileInfo;
	}

	public void fileDelete(String fileNo) {
		fileDAO.fileDelete(fileNo);
	}

}