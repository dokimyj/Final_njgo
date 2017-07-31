package com.njgo.service;

import java.io.File;
import java.util.Calendar;
import java.util.UUID;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

public class FileSaver {
	
	public String filesave(String realPath,String oriName, byte [] fileData)throws Exception{
		System.out.println(realPath);
		File f = new File(realPath);
		// 저장할 경로에 파일이 없다면 만들어 주세요.
		if(!f.exists()){
			f.mkdirs();
		}
		//upload 저장되는 실제 파일 name
		String fileName=UUID.randomUUID().toString()+"_"+oriName;
		File taget = new File(f, fileName);
		//저장하는 방식 1
		FileCopyUtils.copy(fileData, taget);
		
		return fileName;
	}
	
	public String filesave(String realPath, MultipartFile mf)throws Exception{
		File f = new File(realPath);
		if(!f.exists()){
			f.mkdirs();
		}
		
		Calendar ca = Calendar.getInstance();
		String fileName = ca.getTimeInMillis()+"_"+mf.getOriginalFilename();
		
		File target = new File(f,fileName);
		//저장하는 방식 2
		mf.transferTo(target);
		
		return fileName;
	}
	
}
