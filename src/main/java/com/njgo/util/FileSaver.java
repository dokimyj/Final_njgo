package com.njgo.util;

import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileSaver {
	public String fileSave(String realPath, String oriName, byte[] fileData) throws Exception{
		File f = new File(realPath);
		if(!f.exists()){
			f.mkdirs();
		}
		
		//upload에 저장되는 실제 파일 name
		String fileName = UUID.randomUUID().toString() + "_" + oriName;
		File target = new File(f, fileName);
		FileCopyUtils.copy(fileData, target);
		
		return fileName;		
	}
	
	public String fileSave(String realPath, MultipartFile m) throws Exception{
		File f = new File(realPath);
		if(!f.exists()){
			f.mkdirs();
		}
		
		Calendar c = Calendar.getInstance();
		String fileName = c.getTimeInMillis() + "_" + m.getOriginalFilename();
		
		File target = new File(f, fileName);
		m.transferTo(target);
		
		return fileName;
	}
	
	public void proFileSave() throws Exception{
		
	}
}
