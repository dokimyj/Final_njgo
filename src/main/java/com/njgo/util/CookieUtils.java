package com.njgo.util;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtils {
	private static final String encoding = "UTF-8";
	private static final String path = "/";
	
	
	//@description 특정 Key의 쿠키값을 List로 반환한다.	최근 본 상품
	//@param key: 쿠키 이름
	public List<String> getValueList(String key, HttpServletRequest request) throws Exception{
		Cookie[] cookies = request.getCookies();
		String[] cookieValues = null;
		String value = "";
		List<String> list = null;
		
		//특정 Key의 쿠키값을 ","로 구분하여 String 배열에 담아준다
		// ex) 쿠키의 Key/Value ---> key = "clickItems", value = "211, 223, 303" (상품 번호)
		
		if(cookies != null){
			for(int i=0; i<cookies.length; i++){
				if(cookies[i].getName().equals(key)){
					value = cookies[i].getValue();
					cookieValues = (URLDecoder.decode(value, encoding)).split(",");
					break;
				}
			}
		}
		
		//String 배열에 담겼던 값을을 List로 다시 담는다.
		if(cookieValues != null){
			list = new ArrayList<String>(Arrays.asList(cookieValues));		//cookieValues배열을 List로 변환
			if(list.size() > 5){	// 값이 5개를 초과하면(최근 것 5개만 담는다.)
				int start = list.size() - 5;
				List<String> copyList = new ArrayList<String>();
				for(int i = start; i < list.size(); i++){
					copyList.add(list.get(i));
				}
				list = copyList;
			}
		}
		return list;
	}
	
	
	//@description 쿠키를 생성 혹은 업데이트 한다.
	//@param key: 쿠키 이름, value: 쿠키 이름과 짝을 이루는 값, day: 쿠키의 수명
	public void setCookie(String key, String value, int day, HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<String> list = getValueList(key, request);
		String sumValue = "";
		int equalsValueCnt = 0;
		
		if(list != null){
			for(int i=0; i<list.size(); i++){
				sumValue += list.get(i) + ",";
				if(list.get(i).equals(value)){
					equalsValueCnt++;
				}
			}
			if(equalsValueCnt != 0){ //같은 값을 넣으려고 할 때의 처리
				if(sumValue.substring(sumValue.length()-1).equals(",")){
					sumValue = sumValue.substring(0, sumValue.length()-1);
				}
			}else{
				sumValue += value;
			}
		}else{
			sumValue = value;
		}
		
		if(!sumValue.equals(",")){
			Cookie cookie = new Cookie(key, URLEncoder.encode(sumValue, encoding));
			cookie.setMaxAge(60*60*24*day);
			cookie.setPath(path);
			response.addCookie(cookie);
		}
		
	}
	
	
	
	//@description 쿠키값들 중 특정 값을 삭제한다.
	//@params key: 쿠키 이름, value: 쿠키 이름과 짝을 이루는 값
	public void deleteCookie(String key, String value, HttpServletRequest request, HttpServletResponse response) throws Exception{
		List<String> list = getValueList(key, request);
		list.remove(value);
		
		String sumValue = "";
		if(list.size() != 0){
			for(int i=0; i<list.size(); i++){
				sumValue += list.get(i) + ",";
			}
			if(sumValue.substring(sumValue.length()-1).equals(",")){
				sumValue = (sumValue.substring(0, sumValue.length() - 1)).replaceAll(" ", "");
			}
		}
		
		Cookie cookie = null;
		int time = 60*60*24*20;
		if(sumValue.equals("")){
			time = 0;
		}
		
		cookie = new Cookie(key, URLEncoder.encode(sumValue, encoding));
		cookie.setMaxAge(time);
		cookie.setPath(path);
		response.addCookie(cookie);
	}
	
	
	//@description 일반적인 쿠키 생성
	//@params key: 쿠키 이름, value: 쿠키 이름과 짝을 이루는 값, day: 쿠키의 수명
	public Cookie createNewCookie(String key, String value, int day, HttpServletRequest request, HttpServletResponse response) throws Exception{
		Cookie cookie = new Cookie(key, URLEncoder.encode(value, encoding));
		cookie.setPath(path);
		cookie.setMaxAge(60*60*24*day);
		response.addCookie(cookie);
		return cookie;
	}
	
	
	
	//@description 쿠키들을 맵으로 반환한다.
	//@params
	public HashMap<String, Cookie> getValueMap(HttpServletRequest request){
		HashMap<String, Cookie> cookieMap = new HashMap<String, Cookie>();
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for(int i = 0; i < cookies.length; i++){
				cookieMap.put(cookies[i].getName(), cookies[i]);
			}
		}
		return cookieMap;
	}
	
	
	
	//@description ","로 구분된 값이 아닌 단일 값으로 저장된 쿠키의 값을 반환한다.
	//@params key: 쿠키 이름
	public String getValue(String key, HttpServletRequest request) throws Exception{
		Cookie cookie = (Cookie)getValueMap(request).get(key);
		if(cookie == null)	return null;
		
		return URLDecoder.decode(cookie.getValue(), encoding);
	}
	
	
	
	//@description 쿠키가 있는지 확인
	//@params key: 쿠키 이름
	public boolean isExist(String key, HttpServletRequest request){
		return getValueMap(request).get(key)!=null;
	}
}
