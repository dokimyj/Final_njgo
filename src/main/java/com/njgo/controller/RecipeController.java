package com.njgo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.njgo.dto.CategoryDTO;
import com.njgo.dto.HashtagDTO;
import com.njgo.dto.IngredientsDTO;
import com.njgo.dto.RecipeDTO;
import com.njgo.dto.RecipeReplyDTO;
import com.njgo.dto.RecipeReviewDTO;
import com.njgo.dto.ScrapDTO;
import com.njgo.dto.StepsDTO;
import com.njgo.service.RecipeService;
import com.njgo.util.FileService;
import com.njgo.util.ListInfo;

@Controller
@RequestMapping(value="/recipe/**")
public class RecipeController {
	@Inject
	private RecipeService recipeService;
	
	@RequestMapping(value="recipeView", method=RequestMethod.GET)
	public void view(Integer num, String[] curIng, Model model) throws Exception{
		HashMap<String, Object> results=recipeService.view(num);
		results.put("curIng", curIng);
		List<Integer> count = new ArrayList<Integer>();
		List<IngredientsDTO> inArray=(List<IngredientsDTO>)results.get("ingredients");
		int tmp = 0;
		for(int i=0;i<inArray.size();i++) {	
			if(i+1 < inArray.size()) {
				if(inArray.get(i).getKind().equals(inArray.get(i+1).getKind())) {
					tmp++;
				} else {
					count.add(tmp);
					tmp = 0;
				}
			} else {
				count.add(tmp);
			}
		}
		model.addAttribute("count", count);
		model.addAttribute("ingredient", inArray);
		model.addAttribute("view", results);
	}
	
	@RequestMapping(value="search", method=RequestMethod.GET)
	public String search(ListInfo listInfo, Model model) throws Exception{
		model.addAttribute("list", recipeService.search(listInfo));
		//해시맵 타입, 키: "listInfo"-페이징을 위한 startNum, lastNum 받아옴 / "listPack"-List<RecipeDTO>받아옴
		return "recipe/recipeList";
	}

	@RequestMapping(value="catesearch", method=RequestMethod.GET)
	public String catesearch(CategoryDTO cdto, String[] curIng, ListInfo listInfo, Model model) throws Exception{
		List<IngredientsDTO> ings=new ArrayList<IngredientsDTO>();
		for(int i=0;i<curIng.length;i++){
			IngredientsDTO idto=new IngredientsDTO();
			System.out.println("받아온것 "+curIng[i]);
			idto.setName(curIng[i]);
			ings.add(idto);
			System.out.println("보내기 "+ings.get(i).getName());
		}
		model.addAttribute("list", recipeService.catesearch(cdto, ings, listInfo));
		model.addAttribute("curIng", curIng);
		return "recipe/recipeSearch";
		//해시맵 타입, 키: "listInfo"-페이징을 위한 startNum, lastNum 받아옴 / "listPack"-List<RecipeDTO>받아옴
	}
	
	@RequestMapping(value="inglist", method=RequestMethod.GET)
	public String inglist(String find, Model model) throws Exception{
		List<IngredientsDTO> ing=recipeService.ingList(find);
		model.addAttribute("ingList", ing);
		return "/recipe/ingList";
	}

	@RequestMapping(value="isearch", method=RequestMethod.GET)
	public String isearch(String[] ingredients, ListInfo listInfo, Model model) throws Exception{
		List<IngredientsDTO> ing=new ArrayList<IngredientsDTO>();
		for(int i=0;i<ingredients.length;i++){
			IngredientsDTO idto=new IngredientsDTO();
			idto.setName(ingredients[i]);
			ing.add(idto);
		}
		model.addAttribute("list", recipeService.isearch(ing, listInfo));
		//해시맵 타입, 키: "listInfo"-페이징을 위한 startNum, lastNum 받아옴 / "listPack"-List<RecipeDTO>받아옴
		model.addAttribute("curIng", ingredients);
		return "/recipe/recipeList";
	}

	@RequestMapping(value="writersearch", method=RequestMethod.GET)
	public String writersearch(String writer, ListInfo listInfo, RedirectAttributes ra){
		ra.addFlashAttribute("list", recipeService.writersearch(writer, listInfo));
		//해시맵 타입, 키: "listInfo"-페이징을 위한 startNum, lastNum 받아옴 / "listPack"-List<RecipeDTO>받아옴
		return "redirect:recipe/recipeSearch";
	}
	
	@RequestMapping(value="scrapsearch", method=RequestMethod.GET)
	public String scrapsearch(String nickname, ListInfo listInfo, RedirectAttributes ra){
		ra.addFlashAttribute("list", recipeService.scrapsearch(nickname, listInfo));
		//해시맵 타입, 키: "listInfo"-페이징을 위한 startNum, lastNum 받아옴 / "listPack"-List<RecipeDTO>받아옴
		return "redirect:recipe/recipeSearch";
	}
	
	@RequestMapping(value="recipeScrapI", method=RequestMethod.GET)
	public String scrapI(ScrapDTO scrapDTO, Model model) throws Exception{
		recipeService.scrapIncrease(scrapDTO);
		return "redirect:recipeView?num="+scrapDTO.getRecipenum();
	}
	
	@RequestMapping(value="recipeScrapD", method=RequestMethod.GET)
	public String scrapD(ScrapDTO scrapDTO, Model model) throws Exception{
		recipeService.scrapDecrease(scrapDTO);
		return "redirect:recipeView?num="+scrapDTO.getRecipenum();
	}
	
	@RequestMapping(value="replyList", method=RequestMethod.GET)
	public void replyList(ListInfo listInfo, Integer rnum, Model model) throws Exception{ //rnum은 해당 레시피의 글번호
		List<RecipeReplyDTO> replyList=recipeService.replyList(listInfo, rnum);
		model.addAttribute("list", replyList);
		model.addAttribute("listInfo", listInfo);
	}
	
	@RequestMapping(value="replyWrite", method=RequestMethod.POST)
	public String replyWrite(RecipeReplyDTO rreplyDTO) throws Exception{
		recipeService.replyWrite(rreplyDTO);
		return "redirect:replyList?rnum="+rreplyDTO.getRecipenum(); 
	}
	
	@RequestMapping(value="replyReply", method=RequestMethod.GET)
	public String replyReply(RecipeReplyDTO rreplyDTO) throws Exception{ //이 매개변수에서 rreplyDTO.setNum은 반드시 답글다는 댓글의 원댓글 번호를 가져와야 함!
		recipeService.replyReply(rreplyDTO);
		return "redirect:replyList?rnum="+rreplyDTO.getRecipenum();
	}
	
	@RequestMapping(value="replyUpdate", method=RequestMethod.GET)
	public String replyUpdate(Integer num, Model model) throws Exception{
		RecipeReplyDTO rrdto=recipeService.replyView(num);
		model.addAttribute("content", rrdto);
		return "/recipe/replyView";
	}
	
	@RequestMapping(value="replyUpdate", method=RequestMethod.POST)
	public String replyUpdate(RecipeReplyDTO rreplyDTO) throws Exception{
		recipeService.replyUpdate(rreplyDTO);
		return "redirect:replyList?rnum="+rreplyDTO.getRecipenum();
	}
	
	@RequestMapping(value="replyDelete", method=RequestMethod.GET)
	public String replyDelete(Integer num, Integer rnum) throws Exception{ //rnum은 해당 레시피의 글번호
		recipeService.replyDelete(num);
		return "redirect:replyList?rnum="+rnum;
	}
	
	@RequestMapping(value="reviewList", method=RequestMethod.GET)
	public void reviewList(ListInfo listInfo, Integer rnum, Model model) throws Exception{ //rnum은 해당 레시피의 글번호
		List<RecipeReviewDTO> reviewList=recipeService.reviewList(listInfo, rnum);
		model.addAttribute("list", reviewList);
		model.addAttribute("listInfo", listInfo);
	}
	
	@RequestMapping(value="reviewWrite", method=RequestMethod.POST)
	public String reviewWrite(RecipeReviewDTO rreviewDTO) throws Exception{
		recipeService.reviewWrite(rreviewDTO);
		return "redirect:reviewList?rnum="+rreviewDTO.getRecipenum(); 
	}
	
	@RequestMapping(value="reviewDelete", method=RequestMethod.GET)
	public String reviewDelete(Integer num, Integer rnum) throws Exception{ //rnum은 해당 레시피의 글번호
		recipeService.reviewDelete(num, rnum);
		return "redirect:reviewList?rnum="+rnum;
	}
	
	@RequestMapping(value="recipeWrite", method=RequestMethod.GET)
	public void recipeWrite() {}
	
	@RequestMapping(value="recipeWrite", method=RequestMethod.POST)
	public void recipeWrite(RecipeDTO recipeDTO, CategoryDTO categoryDTO, String[] explain, 
			String[] kind, Integer[] kind_count, String[] i_name, String[] i_amount, String[] hashtag,
			MultipartHttpServletRequest request, HttpSession session) throws Exception {
		
		List<String> stepFName = new ArrayList<String>();
		List<MultipartFile> step_pic = request.getFiles("step_pic");
		List<StepsDTO> stepsArray = new ArrayList<StepsDTO>();
		List<IngredientsDTO> ingredientArray = new ArrayList<IngredientsDTO>();
		List<HashtagDTO> hashtagArray = new ArrayList<HashtagDTO>();
		
		FileService fileService = new FileService();
		
		MultipartFile main_pic = request.getFile("main");
		String mainFName = fileService.fileSave(main_pic, session);
		recipeDTO.setRep_pic(mainFName);
		
		System.out.println("메인 원본명" + main_pic.getOriginalFilename());
		System.out.println("메인 파일명 " + mainFName);
		
		for(MultipartFile f:step_pic) {
			String tmp = fileService.fileSave(f, session);
			
			System.out.println("순서 원본명 : " + f.getOriginalFilename());
			System.out.println("순서 파일명 : " + tmp);
			
			stepFName.add(tmp);
		}
		
		System.out.println("대표사진 " + recipeDTO.getRep_pic());
		System.out.println("인원 : " + recipeDTO.getAmount());
		System.out.println("조리 시간 : " + recipeDTO.getElapsedtime());
		
		System.out.println("종류별 " + categoryDTO.getC_kind());
		System.out.println("상황별 " + categoryDTO.getC_situation());
		System.out.println("방법별 " + categoryDTO.getC_procedure());
		System.out.println("재료별 " + categoryDTO.getC_ingredient());
		
		for(int i=0;i<explain.length;i++) {
			StepsDTO stepsDTO = new StepsDTO();
			
			stepsDTO.setStep(i);
			stepsDTO.setExplain(explain[i]);
			stepsDTO.setFname(stepFName.get(i));
			
			stepsArray.add(stepsDTO);
		}
		
		for(StepsDTO s:stepsArray) {
			System.out.println("번호 : " + s.getStep());
			System.out.println("설명 : " + s.getExplain());
			System.out.println("사진 : " + s.getFname());	
		}
		
		int tmp = 0;
		
		for(int i=0;i<kind_count.length;i++) {
			if(i == 0) {
				for(int j=0;j<kind_count[i];j++) {
					IngredientsDTO ingredientsDTO = new IngredientsDTO();
					
					ingredientsDTO.setKind(kind[i]);
					ingredientsDTO.setName(i_name[j]);
					ingredientsDTO.setAmount(i_amount[j]);
					
					ingredientArray.add(ingredientsDTO);
				}
			} else {
				tmp += kind_count[i - 1];
				for(int j=0;j<kind_count[i];j++) {
					IngredientsDTO ingredientsDTO = new IngredientsDTO();
					
					ingredientsDTO.setKind(kind[i]);
					ingredientsDTO.setName(i_name[tmp + j]);
					ingredientsDTO.setAmount(i_amount[tmp + j]);
					
					ingredientArray.add(ingredientsDTO);
				}
			}
		}
		for(IngredientsDTO i:ingredientArray) {
			System.out.println("종류 : " + i.getKind());
			System.out.println("이름 : " + i.getName());
			System.out.println("양 : " + i.getAmount());
			System.out.println("-------------------------------------");
		}
		
		
		if(hashtag != null) {
			for(String h:hashtag) {
				HashtagDTO hashtagDTO = new HashtagDTO();
				hashtagDTO.setHashtag(h);
				hashtagArray.add(hashtagDTO);
			}
			for(HashtagDTO h:hashtagArray) {
				System.out.println(h.getHashtag());
				System.out.println("-------------------------------------");
			}
		} else {
			hashtagArray = null;
		}
		
		HashMap<String, Object> recipeMap = new HashMap<String, Object>();
		recipeMap.put("recipeInfo", recipeDTO);
		recipeMap.put("category", categoryDTO);
		recipeMap.put("ingredient", ingredientArray);
		recipeMap.put("step", stepsArray);
		recipeMap.put("hashtag", hashtagArray);
		
		recipeService.recipeWrite(recipeMap);
	}
	
	@RequestMapping(value="recipeDelete")
	public String recipeDelete(int recipeNum, RedirectAttributes rd) throws Exception {
		String message = "삭제가 실패하였습니다. 다시 시도해주십시오.";
		
		if(recipeService.recipeDelete(recipeNum) > 0) {
			message = "삭제 성공했습니다.";
		}
		
		rd.addFlashAttribute("message", message);
		
		return "redirect:../tmp/result";
	}
	
	@RequestMapping(value="recipeUpdateForm")
	public void recipeUpdateForm(int recipeNum, Model model) throws Exception {
		HashMap<String, Object> recipeMap = recipeService.recipeView(recipeNum);
		
		List<IngredientsDTO> inArray = (List<IngredientsDTO>) recipeMap.get("ingredient");
		List<IngredientsDTO> newArray = new ArrayList<IngredientsDTO>();
		List<Integer> count = new ArrayList<Integer>();
		
		int tmp = 0;
		
		for(int i=0;i<inArray.size();i++) {	
			if(i+1 < inArray.size()) {
				if(inArray.get(i).getKind().equals(inArray.get(i+1).getKind())) {
					tmp++;
				} else {
					count.add(tmp);
					tmp = 0;
				}
			} else {
				count.add(tmp);
			}
		}
		
		for(int i:count) {
			System.out.println(i);
		}
		model.addAttribute("ingredient", inArray);
		model.addAttribute("count", count);
		model.addAttribute("map", recipeMap);
	}
	
	@RequestMapping(value="recipeUpdate", method=RequestMethod.POST)
	public void recipeUpdate(RecipeDTO recipeDTO, CategoryDTO categoryDTO, String[] explain, 
			String[] kind, Integer[] kind_count, String[] i_name, String[] i_amount, String[] hashtag,
			String main_check, String[] step_pic_check, MultipartHttpServletRequest request, HttpSession session) throws Exception {
		
		List<String> stepFName = new ArrayList<String>();
		List<MultipartFile> step_pic = request.getFiles("step_pic");
		List<StepsDTO> stepsArray = new ArrayList<StepsDTO>();
		List<IngredientsDTO> ingredientArray = new ArrayList<IngredientsDTO>();
		List<HashtagDTO> hashtagArray = new ArrayList<HashtagDTO>();
		
		FileService fileService = new FileService();
		
		if(main_check.equals("yes")) {
			MultipartFile main_pic = request.getFile("main");
			
			String mainFName = fileService.fileSave(main_pic, session);
			recipeDTO.setRep_pic(mainFName);
			
			System.out.println("메인 사진 수정");
			System.out.println("메인 원본명" + main_pic.getOriginalFilename());
			System.out.println("메인 파일명 " + mainFName);
		} else {
			System.out.println("메인 사진 수정X");
			recipeDTO.setRep_pic(main_check);
		}
		
		int index = 0;
		for(MultipartFile f:step_pic) {
			String tmp = "";
			
			if(step_pic_check[index].equals("yes")) {
				tmp = fileService.fileSave(f, session);
				
				System.out.println("수정함");
				System.out.println(tmp);
			} else {
				tmp = step_pic_check[index];
				System.out.println("수정안함");
			}
			stepFName.add(tmp);
			index++;
		}
		
		for(int i=0;i<explain.length;i++) {
			StepsDTO stepsDTO = new StepsDTO();
			
			stepsDTO.setRecipenum(recipeDTO.getNum());
			stepsDTO.setStep(i);
			stepsDTO.setExplain(explain[i]);
			stepsDTO.setFname(stepFName.get(i));
			
			stepsArray.add(stepsDTO);
		}
		
		for(StepsDTO s:stepsArray) {
			System.out.println("번호 : " + s.getStep());
			System.out.println("설명 : " + s.getExplain());
			System.out.println("사진 : " + s.getFname());	
		}
		
		for(int i=0;i<kind_count.length;i++) {
			for(int j=0;j<kind_count[i];j++) {
				IngredientsDTO ingredientsDTO = new IngredientsDTO();
				
				ingredientsDTO.setRecipenum(recipeDTO.getNum());
				ingredientsDTO.setKind(kind[i]);
				ingredientsDTO.setName(i_name[i + j]);
				ingredientsDTO.setAmount(i_amount[i + j]);
				
				ingredientArray.add(ingredientsDTO);
			}
		}
		for(IngredientsDTO i:ingredientArray) {
			System.out.println("종류 : " + i.getKind());
			System.out.println("이름 : " + i.getName());
			System.out.println("양 : " + i.getAmount());
			System.out.println("-------------------------------------");
		}		
		
		if(hashtag != null) {
			for(String h:hashtag) {
				HashtagDTO hashtagDTO = new HashtagDTO();
				
				hashtagDTO.setRecipenum(recipeDTO.getNum());
				hashtagDTO.setHashtag(h);
				hashtagArray.add(hashtagDTO);
			}
			for(HashtagDTO h:hashtagArray) {
				System.out.println(h.getHashtag());
				System.out.println("-------------------------------------");
			}
		} else {
			hashtagArray = null;
		}
		
		HashMap<String, Object> recipeMap = new HashMap<String, Object>();
		
		recipeMap.put("recipeInfo", recipeDTO);
		recipeMap.put("category", categoryDTO);
		recipeMap.put("ingredient", ingredientArray);
		recipeMap.put("step", stepsArray);
		recipeMap.put("hashtag", hashtagArray);
		recipeMap.put("recipeNum", recipeDTO.getNum());
		
		recipeService.recipeUpadate(recipeMap);
	}
	
	@RequestMapping(value="recipeWrite_modal")
	public void modal() {
		
	}
}
