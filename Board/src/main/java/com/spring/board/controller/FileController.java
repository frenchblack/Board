package com.spring.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.output.ByteArrayOutputStream;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@RestController
@RequestMapping(value = "/File")
public class FileController {
	private static final Logger logger = LoggerFactory.getLogger(FileController.class);
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST) 
	public @ResponseBody Map<String, Object> fileUpload(HttpSession session, MultipartHttpServletRequest mtfRequest) throws Exception {
		logger.info("FileController");
		
		SimpleDateFormat sdf = new SimpleDateFormat ( "yyyyMMddHHmmss");
		Date date = new Date();
		
//		CommonUtil commonUtil = new CommonUtil();
//		JSONObject result = new JSONObject();
//		MailVO mailVO = new MailVO();
		Map<String, Object> result = new HashMap<String, Object>();
		
		String PATH = "D:/file/upload/";
		String fileName = ""; // 파일 이름(확장자 제외)
		String fileFullName = ""; // 파일 이름(확장자 포함)
		String fileType = ""; // 파일 확장자
		
		String fileUploadTime = sdf.format(date); //파일 업로드 시간(yyyymmddhhmmss)
//		String[] mailTitle = mtfRequest.getParameterValues("mailTitle");
//		String[] mailContent = mtfRequest.getParameterValues("CkmailContent"); 
		
		// FormData 사용시 한글이 깨지는 것을 방지
//		String convertTomailTitle = new String(mailTitle[0].getBytes("8859_1"),"utf-8");
//		String convertToContent = new String(mailContent[0].getBytes("8859_1"),"utf-8");
		
		logger.info("before try");
		
		try { 
			Iterator<String> itr = mtfRequest.getFileNames();
			if(itr.hasNext()) {
				List<MultipartFile> mpf = mtfRequest.getFiles((String) itr.next());
				for(int i = 0; i < mpf.size(); i++) {
					File file = new File(PATH + mpf.get(i).getOriginalFilename());
					fileFullName = mpf.get(i).getOriginalFilename();
					fileName = FilenameUtils.getBaseName(mpf.get(i).getOriginalFilename());
					fileType = fileFullName.substring(fileFullName.lastIndexOf(".")+1, fileFullName.length());
					file = new File(PATH + fileName + "_" + fileUploadTime + "." + fileType);
					logger.info("----------------------- FILE UPLOAD START ---------------------------");
					logger.info(PATH + fileName + "_" + fileUploadTime + "." + fileType);
					logger.info("FILE : " + file.getAbsolutePath());
					logger.info("SIZE : " + mpf.get(i).getSize() + "bytes");
					logger.info("----------------------- FILE UPLOAD END -----------------------------");
					mpf.get(i).transferTo(file); // 파일 전송 
				}
			}
			
			result.put("uploaded", true);
			result.put("fileName", fileName);
			result.put("url", "/File/getImg.do?file_name=" + fileName + "_" + fileUploadTime + "." + fileType);
		} catch (Exception e) { 
			e.printStackTrace();
			result.put("uploaded", false); 
		} 
		
		return result;
	}

	@GetMapping(value="/getImg")
    public @ResponseBody byte[] getImage(@RequestParam("file_name") String file_name) // A
            throws IOException{
		logger.info("getImg");
		
        FileInputStream fis = null;
        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        //String filePath = fileAr[0];

        String fileDir = "D:/file/upload/" + file_name; // 파일경로

        try{
            fis = new FileInputStream(fileDir);
        } catch(FileNotFoundException e){
            e.printStackTrace();
        }

        int readCount = 0;
        byte[] buffer = new byte[1024];
        byte[] fileArray = null;

        try{
            while((readCount = fis.read(buffer)) != -1){
                baos.write(buffer, 0, readCount);
            }
            fileArray = baos.toByteArray();
            fis.close();
            baos.close();
        } catch(IOException e){
            throw new RuntimeException("File Error");
        }
        return fileArray;
    }	
}
