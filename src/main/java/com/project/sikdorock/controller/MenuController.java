package com.project.sikdorock.controller;

import com.project.sikdorock.dto.FoodImageDTO;
import com.project.sikdorock.dto.FoodListDTO;
import com.project.sikdorock.service.MenuService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.Calendar;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MenuController {

    private final MenuService service;

    @GetMapping(value = "/menu/menuli")
    public String menuList(Model model, String month) {

        //Paging paging = new Paging(page, service.menuCount(), 8); //메뉴 전체 수 > 켄텐츠 숫자 반환

        //List<FoodListDTO> list = service.getMenuli(paging); //메뉴 리스트 정보

        String today = "";
        Calendar cal = Calendar.getInstance();
        if (month == null) {
            month = String.valueOf(cal.get(Calendar.MONTH) + 1);
            today = String.format("%tF", cal.getInstance());
        } else {
            cal.set(Calendar.MONTH, Integer.parseInt(month) - 1);
            today = String.format("%tF", cal);
        }
        System.out.println(today);
        List<FoodListDTO> list = service.getMenuli(month); //메뉴 리스트 정보

        for (FoodListDTO fdto : list) {
            String outdate = fdto.getOutdate().substring(0, 10);
            int index = fdto.getMenuname().indexOf("/");

            String menuname = fdto.getMenuname().substring(0, index);
            fdto.setMenuname(menuname);
            fdto.setOutdate(outdate);
        }

        String price = String.format("%,d" ,Integer.parseInt(service.price()));



        model.addAttribute("price", price);
        model.addAttribute("month", month);
        model.addAttribute("today", today);
        model.addAttribute("list", list);
        //model.addAttribute("paging", paging);

        return "menu.menuli";

    }


    @GetMapping("/menu/view")
    public String menuView(Model model, String seq) {

        FoodListDTO fdto = service.menuView(seq);
        //List<FoodImageDTO> imgList = service.image(seq);

        model.addAttribute("fdto", fdto);
        return "menu.view";
    }

}
