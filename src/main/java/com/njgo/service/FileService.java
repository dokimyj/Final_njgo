package com.njgo.service;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
@Service
public class FileService {
	
	//Delete
	public Boolean fileDelete(String fileName, HttpSession session)throws Exception{
		String realPath = session.getServletContext().getRealPath("resources/upload");
		File f = new File(realPath,fileName);
		boolean result =f.delete();
		return result;
	}
	
	//파일에다가 저장하는코드
	public String fileSave(MultipartFile mf, HttpSession session)throws Exception{
		FileSaver fileSaver = new FileSaver();
		String fileName = fileSaver.filesave(session.getServletContext().getRealPath("resources/upload"), mf);
		return fileName;
	}
}
