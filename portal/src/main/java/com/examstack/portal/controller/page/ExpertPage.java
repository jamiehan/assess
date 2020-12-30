package com.examstack.portal.controller.page;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.examstack.common.Constants;
import com.examstack.common.domain.expert.CmsExpert;
import com.examstack.common.domain.rules.CmsCat;
import com.examstack.common.domain.rules.CmsRules;
import com.examstack.portal.service.CmsCatService;
import com.examstack.portal.service.CmsExpertService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.examstack.common.domain.training.Training;
import com.examstack.common.domain.training.TrainingSection;
import com.examstack.common.domain.training.TrainingSectionProcess;
import com.examstack.common.domain.training.UserTrainingHistory;
import com.examstack.common.util.Page;
import com.examstack.common.util.PagingUtil;
import com.examstack.portal.security.UserInfo;
import com.examstack.portal.service.TrainingService;

@Controller
public class ExpertPage {
	
	@Autowired
	private CmsExpertService cmsExpertService;
	@Autowired
	private CmsCatService cmsCatService;
	@RequestMapping(value = "/expert-list", method = RequestMethod.GET)
	public String trainingListPage(Model model, HttpServletRequest request,
								   @RequestParam(value="page",required=false,defaultValue="1") int page,
								   String catId) {
		
		Page<CmsExpert> pageModel = new Page<CmsExpert>();
		pageModel.setPageNo(page);
		pageModel.setPageSize(10);
		List<CmsExpert> expertList = cmsExpertService.getCmsExpertList(pageModel,catId);
		String pageStr = PagingUtil.getPagelink(page,
				pageModel.getTotalPage(),"", "/" + Constants.CONTEXT_PATH_PORTAL + "/expert-list");

		Page<CmsCat> pageModel2 = new Page<CmsCat>();
		List<CmsCat> cmsCatList = cmsCatService.getCmsCatList(pageModel2, "2");
		model.addAttribute("catId",catId);
		model.addAttribute("catList",cmsCatList);
		model.addAttribute("expertList", expertList);
		model.addAttribute("pageStr", pageStr);
		return "expert-list";
	}

	@RequestMapping(value = "/expert-show/{id}", method = RequestMethod.GET)
	public String expertShowPage(Model model,
										 @PathVariable("id") Long id) {
		CmsExpert expert  = cmsExpertService.getCmsExpertById(id);
		model.addAttribute("expert", expert);
		return "expert-show";
	}

	
//	@RequestMapping(value = "/student/training/{trainingId}", method = RequestMethod.GET)
//	public String trainingPage(Model model, HttpServletRequest request, @PathVariable("trainingId") int trainingId, @RequestParam(value="sectionId",required=false,defaultValue="-1") int sectionId) {
//		
//		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext()
//			    .getAuthentication()
//			    .getPrincipal();
//		List<TrainingSection> sectionList = trainingService.getTrainingSectionByTrainingId(trainingId, null);
//		if(sectionList == null){
//			model.addAttribute("errorMsg", "章节不存在！");
//			return "error";
//		}
//		TrainingSection thisSection = null;
//		
//		for(TrainingSection section : sectionList){
//			
//			if(section.getSectionId() == sectionId || sectionId == -1){
//				String filePath = section.getFilePath();
//				section.setFilePath("../" + filePath.replace("\\", "/"));
//				thisSection = section;
//				sectionId = section.getSectionId();
//				break;
//			}
//		}
//		UserTrainingHistory history = trainingService.getTrainingHistBySectionId(thisSection.getSectionId(), userInfo.getUserid());
//		float duration = 0;
//		boolean finished = false;
//		if(history != null){
//			duration = history.getDuration();
//			if(history.getProcess() == 1)
//				finished = true;
//		}
//			
//		//每一个章节已经耗费的时间，每次提交需要加上这个时间
//		model.addAttribute("finished", finished);
//		model.addAttribute("duration", duration);
//		model.addAttribute("sectionList", sectionList);
//		model.addAttribute("sectionId", sectionId);
//		model.addAttribute("section", thisSection);
//		if(thisSection.getFileType().toLowerCase().equals(".pdf"))
//			return "training-pdf";
//		else
//			return "training";
//	}
//
//	@RequestMapping(value = "/student/training/video", method = RequestMethod.GET)
//	public String videoPage(Model model, HttpServletRequest request){
//		return "video";
//	}
//	
//	
//	@RequestMapping(value = "/student/training-history", method = RequestMethod.GET)
//	public String trainingHistory(Model model, HttpServletRequest request, @RequestParam(value="page",required=false,defaultValue="1") int page) {
//		UserInfo userInfo = (UserInfo) SecurityContextHolder.getContext()
//			    .getAuthentication()
//			    .getPrincipal();
//		Page<Training> pageModel = new Page<Training>();
//		pageModel.setPageNo(page);
//		pageModel.setPageSize(10);
//		List<Training> trainingList = trainingService.getTrainingList(pageModel);
//		Map<Integer,List<TrainingSectionProcess>> processMap = trainingService.getTrainingSectionProcessMapByUserId(userInfo.getUserid());
//		String pageStr = PagingUtil.getPageBtnlink(page,
//				pageModel.getTotalPage());
//		model.addAttribute("trainingList", trainingList);
//		model.addAttribute("processMap", processMap);
//		model.addAttribute("pageStr", pageStr);
//		return "training-history";
//	}
}
