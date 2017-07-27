package com.njgo.service;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.njgo.util.FileSaver;


@Service
public class FileService {
	//Save
		public String fileSave(MultipartFile m, HttpSession session) throws Exception{
			FileSaver fileSaver = new FileSaver();
			
			String fileName = fileSaver.fileSave(session.getServletContext().getRealPath("/resources/upload"), m);
			
			return fileName;
		}
		
		//Delete
		public boolean fileDelete(String fileName, HttpSession session) throws Exception{
			String realPath = session.getServletContext().getRealPath("resources/upload");
			File f = new File(realPath, fileName);
			boolean result = f.delete();
			return result;
		}
}
