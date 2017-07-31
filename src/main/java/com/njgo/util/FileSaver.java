package com.njgo.util;

import java.io.File;
import java.util.Calendar;

import org.springframework.web.multipart.MultipartFile;

// 파일을 디스크에 저장
public class FileSaver {

	public String fileSave(String realPath, MultipartFile m) throws Exception {
		System.out.println("filesave");
		File f = new File(realPath);		// realPath에 해당되는 File객체를 만든다.
	
		if( ! f.exists() ) {
			f.mkdirs();
		}
		
		Calendar c = Calendar.getInstance();
		String fileName = c.getTimeInMillis() + "_" + m.getOriginalFilename();
		
		File target = new File(f, fileName);	// f의 위치에 fileName이라는 이름을 가진 File 객체를 생성한다.
		m.transferTo(target); 		// target파일을 m파일로 넘겨준다. ( 실제 파일을 생성한다. )
		
		System.out.println(realPath);
		
		return fileName;
	}	
}