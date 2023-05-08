package mul.cam.a.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.servlet.view.AbstractView;

import mul.cam.a.service.CommuService;

public class DownloadView extends AbstractView{

	@Autowired
	CommuService service;
	
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("DownloadView renderMergedOutputModel");
		
		File downloadFile = (File)model.get("downloadFile");
		String filename = (String)model.get("filename");		// 원본 파일명
		int seq = (Integer)model.get("seq");
		
		response.setContentType(this.getContentType());
		response.setContentLength((int)downloadFile.length());
		
		// 한글명 파일의 경우 깨지는 것을 방지
		filename = URLEncoder.encode(filename, "utf-8");
		
		// 다운로드 창이 나타나도록
		response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\";");	// 다운로드 받을 때 원본 파일명으로 받도록
		response.setHeader("Content-Transfer-Encoding", "binary;");									// 이진수 형태로 다운로드
		response.setHeader("Content-Length", "" + downloadFile.length());							
		response.setHeader("Pragma", "no-cache;"); 
		response.setHeader("Expires", "-1;");
		
		OutputStream os = response.getOutputStream();
		FileInputStream fis = new FileInputStream(downloadFile);
		
		// 실제 데이터를 기입하는 부분
		FileCopyUtils.copy(fis, os);
		
		if(fis != null) {
			fis.close();
		}
		
	}
	
}
