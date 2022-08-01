package com.project.sikdorock.controller;

import com.project.sikdorock.dto.CouponDTO;
import com.project.sikdorock.dto.FoodDTO;
import com.project.sikdorock.service.MyPageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class MyPageController {

    private final MyPageService service;

    //마이페이지 >  내 정보 관리하기
    @GetMapping(value="/mypage/myinfo")
    public String myinfo(){
        return "mypage.myinfo";
    }

    //마이페이지 > 결제/구독 내역
    @GetMapping(value="/mypage/order")
    public String order() {
        return "mypage.order";
    }
    //마이페이지 > 찜 목록
    @GetMapping(value="/mypage/likefood")
    public String likeFood(@RequestParam(defaultValue = "1") int page, HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model) {

        List<FoodDTO> list = service.likeFoodList();
        model.addAttribute("list", list);

        return "mypage.likefood";
    }
    //마이페이지 > 쿠폰함
    @GetMapping(value="/mypage/coupon")
    public String coupon(@RequestParam(defaultValue = "1") int page, HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model) {


        List<CouponDTO> list = service.couponList();
        model.addAttribute("list", list);

        return "mypage.coupon";
    }
}
