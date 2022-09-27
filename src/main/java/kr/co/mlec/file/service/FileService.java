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

	// ���� ��� ���
	public void fileUpload(MultipartHttpServletRequest mRequest) throws Exception {
		FileVO fileVO = new FileVO();
//		System.out.println("getparam no: " + mRequest.getParameter("bizRegisNum"));
//		fileVO.setNo(Integer.parseInt(mRequest.getParameter("no")));
		if(mRequest.getParameter("bizRegisNum") != null) {
			fileVO.setBizRegisNum(mRequest.getParameter("bizRegisNum"));
		}
		fileVO.setOriginFileName("");
		fileVO.setStoredFileName("");
		// ����Ǵ� �����ø����̼��� ���� ��� ��������
		String uploadDir = servletContext.getRealPath("/upload/");
//		System.out.println(uploadDir);

		Iterator<String> iter = mRequest.getFileNames();
//		System.out.println("FileService���� ȣ��: " + mRequest.getFileNames());
		while (iter.hasNext()) {

			String formFileName = iter.next();
			// ������ ������ �������� �ʾƵ� ��ü ������
			MultipartFile mFile = mRequest.getFile(formFileName);

			// ���� ���ϸ�
			String oriFileName = mFile.getOriginalFilename();
//			System.out.println("���� ���ϸ� : " + oriFileName);
			fileVO.setOriginFileName(oriFileName);

			if (oriFileName != null && !oriFileName.equals("")) {

				// Ȯ���� ó��
				String ext = "";
				// ���ʿ� �ִ� . �� ��ġ
				int index = oriFileName.lastIndexOf(".");
				if (index != -1) {
					// ���ϸ��� Ȯ���ڸ�(.����)�� ����
					ext = oriFileName.substring(index);
				}

				// ���� ������
				long fileSize = mFile.getSize();
//				System.out.println("���� ������ : " + fileSize);

				// ������ ���ϸ� �����
				String saveFileName = oriFileName + UUID.randomUUID().toString() + ext;
//				System.out.println("������ ���ϸ� : " + saveFileName);
				fileVO.setStoredFileName(saveFileName);
				// �ӽ������ ������ ���ϴ� ��ο� ����
				mFile.transferTo(new File(uploadDir + saveFileName));
			}
//			System.out.println(fileVO.getOriginFileName());
			// ���⼭ ���� ȣ��.

//			System.out.println(fileVO);
			fileDAO.insertFileDB(fileVO);
		}

	}

	//÷�� ���� ��� select �ؿ���
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