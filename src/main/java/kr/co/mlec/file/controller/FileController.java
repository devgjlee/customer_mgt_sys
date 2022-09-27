package kr.co.mlec.file.controller;

import java.io.File;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.co.mlec.file.service.FileService;
import kr.co.mlec.file.vo.FileVO;

@Controller
public class FileController {
	@Autowired
	private FileService service;

	//첨부파일목록 조회
	@RequestMapping("/board/{no}/fileList")
	public ModelAndView selectFileList(@PathVariable("no")String custNo) {
		int customerNo = Integer.parseInt(custNo);
//		System.out.println("고객번호: "  + customerNo);
		List<FileVO> fileList = service.selectFile(customerNo);
		
		ModelAndView mav = new ModelAndView("/file/fileList");
		mav.addObject("fileList", fileList);
		
		return mav;
	}
	
	//다운로드
	@RequestMapping(value = "/download/{no}")
	public void downloadFile(@PathVariable("no")int fileNo, HttpServletResponse response) throws Exception{
		
		FileVO file = 	service.fileInfo(fileNo);
		
		System.out.println("file 정보: " + file);
		
		String orgin = file.getOriginFileName();
		String stored = file.getStoredFileName();
		
		byte[] fileByte = FileUtils.readFileToByteArray(new File("C:\\JAVA\\gjlee-project\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Project-Spring\\upload\\"+stored));
		
		response.setContentType("application/octet-stream");
		response.setContentLength(fileByte.length);
		response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(orgin,"UTF-8")+"\";");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.getOutputStream().write(fileByte);

		response.getOutputStream().flush();
		response.getOutputStream().close();

	}
	
	//삭제
	@RequestMapping("/fileDelete/{customerNo}/{fileNo}")
	public String fileDelete(@PathVariable("fileNo")String fileNo, @PathVariable("customerNo")String customerNo) {
		
		service.fileDelete(fileNo);
		
		return "redirect:/board/" + customerNo + "/fileList";
	}
}
