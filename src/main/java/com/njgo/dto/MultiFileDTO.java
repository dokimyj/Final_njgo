package com.njgo.dto;

import org.springframework.web.multipart.MultipartFile;

public class MultiFileDTO extends FileDTO{
	private MultipartFile f2;

	public MultipartFile getF2() {
		return f2;
	}

	public void setF2(MultipartFile f2) {
		this.f2 = f2;
	}
}
