package com.njgo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.njgo.dto.MemberDTO;
import com.njgo.util.ListInfo;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE ="MemberMapper.";
	
	
	// ========================== Login , Delete, Update 관련 =====================
	//memberLogin
	public MemberDTO memberLogin(MemberDTO memberDTO){
		String path ="memberLogin";
		//SNS 로그인
		if(memberDTO.getLogin_mode().equals("SNS_join")){
			path ="memberSNSLogin";
		}
		return sqlSession.selectOne(NAMESPACE+path, memberDTO);
	}
	
	//find_password
	public MemberDTO find_password(String email){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("email", email);
		
		//email로 검색 
		return sqlSession.selectOne(NAMESPACE+"emailCheck", email);
	}
	
	//Delete
	public int memberDelete(MemberDTO memberDTO) {
		
		//SNS 탈퇴
		if(memberDTO.getLogin_mode().equals("SNS_join")){
			return sqlSession.delete(NAMESPACE+"memberSNSDelete",memberDTO);
		}
		// 일반 회원탈퇴
		else{
			return sqlSession.delete(NAMESPACE+"memberDelete", memberDTO);	
		}
	}
	

	
	//Update
	public int memberUpdate(String data, String type,String email){
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("data", data);
		map.put("type", type);
		map.put("email", email);
		
		return sqlSession.update(NAMESPACE+"memberUpdate", map);
		
	}
	public int pointUpdate(MemberDTO memberDTO) {
		
		return sqlSession.update(NAMESPACE+"pointUpdate",memberDTO);
	}
	
	
	// =========================== 회원 가입 관련 ================================
	//join
	public int memberJoin(MemberDTO memberDTO){
		
		return sqlSession.insert(NAMESPACE+"join", memberDTO);
	}
	
	//email중복체크
	public MemberDTO emailCheck(String email){
		return sqlSession.selectOne(NAMESPACE+"emailCheck", email);
	}

	//nickName 중복체크
	public MemberDTO nickNameCheck(String nickName) {
		
		return sqlSession.selectOne(NAMESPACE+"nickNameCheck", nickName);
	}
	//List
	public List<MemberDTO> memberList(ListInfo listInfo) {
			
		return sqlSession.selectList(NAMESPACE+"memberList", listInfo);
		
	}
	//Warning List
	public List<MemberDTO> memberWarningList(ListInfo listInfo) {
		
		return sqlSession.selectList(NAMESPACE+"warningList",listInfo);
	}
	// 등급 순서대로 
	public List<MemberDTO> memberGradeList(ListInfo listInfo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE+"gradeList",listInfo);
	}
	
	// 멤버 총인원
	public int memberTotalCount() {
		
		return sqlSession.selectOne(NAMESPACE+"totalCount");
	}
	// 경고를 받은 멤버수 or 등급이 1이상인 멤버 수
	//data 의 값에 따라 다름
	public int memberTotalCount(String data) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("data", data);
		
		return sqlSession.selectOne(NAMESPACE+"total", map);
	}

	
	//1. 이메일 인증 확인
	public MemberDTO emailConfrim(String joinCode,String email) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("joinCode", joinCode);
		map.put("email", email);
		//링크로 받아온 이메일 값 확인 
		//DB에는 joinCode가 미리 생성되있기때문에 링크로 받아온 joinCode와 일치할경우 성공
		MemberDTO memberDTO = sqlSession.selectOne(NAMESPACE+"emailConfirm", map);
		int result =0;
		//이메일 인증이 완료되면 grade 값 1로 변경 
		if(memberDTO != null){
			result = sqlSession.update(NAMESPACE+"join_success",map);
			memberDTO.setGrade("1");
		}
		
		return memberDTO;
	}

	public MemberDTO kakaoIDCheck(String kakaoID) {
		
		return sqlSession.selectOne(NAMESPACE+"kakaoIDCheck", kakaoID);
	}

	public int memberSNSJoin(MemberDTO memberDTO) {
		
		return sqlSession.insert(NAMESPACE+"SNSJoin",memberDTO);
	}




	
}
