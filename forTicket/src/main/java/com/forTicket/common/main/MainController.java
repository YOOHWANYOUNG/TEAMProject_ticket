package com.forTicket.common.main;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.forTicket.goods.service.GoodsService;
import com.forTicket.goods.vo.GoodsVO;

@Controller("mainController")
public class MainController {
	@Autowired
	private GoodsService goodsService;
	
	@RequestMapping(value={"/main.do"}, method={RequestMethod.GET,RequestMethod.POST})
	 private ModelAndView main(HttpServletRequest req,HttpServletResponse resp) throws Exception {
		HttpSession session;
		session=req.getSession();
		System.out.println("main : "+session);

		ModelAndView mav=new ModelAndView();
		
		String viewName=(String)req.getAttribute("viewName");
		Map<String,List<GoodsVO>> goodsMap=goodsService.mainListGoods();
		//별점
		List<Integer> goodsIds = goodsMap.values()
		        .stream()
		        .flatMap(List::stream)
		        .map(GoodsVO::getGoods_id)
		        .collect(Collectors.toList());
		
		Map<Integer, Double> goodsIdToAvgStarMap = new HashMap<>();
		
		for (int goods_id : goodsIds) {
		    double avgStar = calculateAverageStar(goods_id); // 평균 평점 계산
		    double roundedAvgStar = Math.round(avgStar * 10) / 10.0; // 반올림하여 소수점 첫째 자리까지 표시
		    goodsIdToAvgStarMap.put(goods_id, roundedAvgStar); // 맵에 값 추가

		    // goodsMap에서 해당 goods_id에 해당하는 GoodsVO 객체를 찾아 avgStar 설정
		    goodsMap.values().stream()
		        .flatMap(List::stream)
		        .filter(goods -> goods.getGoods_id() == goods_id)
		        .findFirst()
		        .ifPresent(goods -> goods.setGoods_avg(roundedAvgStar));
		}
		
		mav.addObject("goodsMap", goodsMap);
		mav.setViewName(viewName);
		
		return mav;
	}
     

     //寃��깋 寃곌낵 李�
     @RequestMapping(value={"/mainsearch.do"}, method={RequestMethod.GET,RequestMethod.POST})
     private ModelAndView mainsearch(HttpServletRequest req, HttpServletResponse resp) throws Exception {
    	 
    	 String viewName = (String)req.getAttribute("viewName");
    	 
    	 ModelAndView mav = new ModelAndView();
		
    	 mav.setViewName(viewName);
    	 
    	 return mav;

}

    
     
     private double calculateAverageStar(int goods_id) {
 		Double avgStar = goodsService.avgStar(goods_id); // goods_id에 해당하는 상품의 평균 평점을 DB에서 조회하여 계산하는 로직
 	    // 실제로는 데이터베이스 조회 등의 작업이 여기에 들어감
 		if (avgStar != null) {
 	        return avgStar; // 평균 평점이 null이 아닐 경우 정상적으로 값을 반환
 	    } else {
 	        return 0; // 평균 평점이 null일 경우 0 또는 다른 기본값을 반환
 	    }
  	   
 	}
}

