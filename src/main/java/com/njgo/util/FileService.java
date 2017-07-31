package com.njgo.util;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileService {

	public String fileSave(MultipartFile m, HttpSession session) throws Exception {
		System.out.println("fileService");
		FileSaver fileSaver = new FileSaver();
		String fileName = fileSaver.fileSave(session.getServletContext().getRealPath("resources/upload") , m);
		
		return fileName;
	}
}