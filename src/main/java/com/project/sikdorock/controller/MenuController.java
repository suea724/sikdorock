package com.project.sikdorock.controller;

import com.project.sikdorock.dto.FoodDTO;
import com.project.sikdorock.dto.FoodImageDTO;
import com.project.sikdorock.dto.FoodListDTO;
import com.project.sikdorock.dto.Paging;
import com.project.sikdorock.service.MenuService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MenuController {

    private final MenuService service;

    @GetMapping(value = "/menu/menuli")
    public String menuList(@RequestParam(defaultValue = "1") int page, Model model) {

        Paging paging = new Paging(page, service.menuCount(), 8); //메뉴 전체 수 > 켄텐츠 숫자 반환

        List<FoodListDTO> list = service.getMenuli(paging); //메뉴 리스트 정보


//        for (FoodDTO fdto : list) {
//            fdto.setOutdate(fdto.getOutdate().substring(0, 10));
//            LocalDate now = LocalDate.now();
//            LocalDate sellDate = LocalDate.parse(fdto.getOutdate());
//            if (now.isAfter(sellDate)) {
//                fdto.setAllergy("판매완료");
//            } else {
//                fdto.setAllergy("판매중");
//            }
//        }

        model.addAttribute("list", list);
        model.addAttribute("paging", paging);

        return "menu.menuli";

    }

}
