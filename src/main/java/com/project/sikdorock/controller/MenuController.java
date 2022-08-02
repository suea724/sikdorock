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
import java.util.Calendar;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MenuController {

    private final MenuService service;

    @GetMapping(value = "/menu/menuli")
    public String menuList(@RequestParam(defaultValue = "1") int page, Model model) {

        //Paging paging = new Paging(page, service.menuCount(), 8); //메뉴 전체 수 > 켄텐츠 숫자 반환

        //List<FoodListDTO> list = service.getMenuli(paging); //메뉴 리스트 정보
        List<FoodListDTO> list = service.getMenuli(); //메뉴 리스트 정보

        Calendar cal = Calendar.getInstance();
        String today = String.format("%tF", cal.getInstance());

        for (FoodListDTO fdto : list) {
            String outdate = fdto.getOutdate().substring(0, 10);
            int index = fdto.getMenuname().indexOf("/");

            String menuname = fdto.getMenuname().substring(0, index);
            fdto.setMenuname(menuname);
            fdto.setOutdate(outdate);
        }

        model.addAttribute("today", today);
        model.addAttribute("list", list);
        //model.addAttribute("paging", paging);

        return "menu.menuli";

    }

}
