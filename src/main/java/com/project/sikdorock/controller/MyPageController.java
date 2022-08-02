package com.project.sikdorock.controller;

import com.project.sikdorock.dto.*;
import com.project.sikdorock.service.MyPageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
public class MyPageController {

    private final MyPageService service;

    //마이페이지 >  내 정보 관리하기
    @GetMapping(value="/mypage/myinfo")
    public String myinfo(String fseq, HttpServletResponse resp, HttpSession session, Model model){

        UserDTO userdto = (UserDTO) session.getAttribute("auth");
        String id = userdto.getId();

        UserDTO dto = service.myInfo(id);
        model.addAttribute("dto", dto);

        return "mypage.myinfo";
    }

    //마이페이지 > 회원 정보 수정
    @PostMapping(value="/mypage/editmyinfo")
    public void editmyinfo(String tel, String address, String detail, HttpServletResponse resp, HttpSession session, Model model) throws IOException {
        //System.out.println(tel);
        //System.out.println(address);
        //System.out.println(detail);

        UserDTO userdto = (UserDTO) session.getAttribute("auth");
        String id = userdto.getId();

        Map<String, String> map = new HashMap<>();
        map.put("tel", tel);
        map.put("address", address);
        map.put("detail", detail);
        map.put("id", id);

        int result = service.editmyinfo(map);

        PrintWriter writer = resp.getWriter();

        writer.printf("{\"result\" : %d}", result);
        writer.close();

    }

    //마이페이지 > 결제/구독 내역
    @GetMapping(value="/mypage/order")
    public String order(@RequestParam(defaultValue = "1") int page, HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model) {

        UserDTO userdto = (UserDTO) session.getAttribute("auth");
        String id = userdto.getId();

        return "mypage.order";
    }
    //마이페이지 > 찜 목록
    @GetMapping(value="/mypage/likefood")
    public String likeFood(@RequestParam(defaultValue = "1") int page, HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model) {

        UserDTO userdto = (UserDTO) session.getAttribute("auth");
        String id = userdto.getId();
        Paging paging = new Paging(page, service.likeFoodCount(id), 16);
        List<UserLikeFoodDTO> list = service.likeFoodList(paging, id);
        model.addAttribute("list", list);
        model.addAttribute("paging", paging);

        return "mypage.likefood";
    }

    @PostMapping(value="/mypage/dellikefood")
    public void delLikeFood(String fseq, HttpServletResponse resp, HttpSession session) throws IOException {

        UserDTO userdto = (UserDTO) session.getAttribute("auth");
        String id = userdto.getId();
        int result = service.delLikeFood(fseq, id);

        PrintWriter writer = resp.getWriter();

        writer.printf("{\"result\" : %d}", result);
        writer.close();
    }
    //마이페이지 > 쿠폰함
    @GetMapping(value="/mypage/coupon")
    public String coupon(@RequestParam(defaultValue = "1") int page, HttpSession session, HttpServletRequest req, HttpServletResponse resp, Model model) {

        UserDTO userdto = (UserDTO) session.getAttribute("auth");
        String id = userdto.getId();
        Paging paging = new Paging(page, service.couponCount(id), 16);
        List<CouponDTO> list = service.couponList(paging, id);
        model.addAttribute("list", list);
        model.addAttribute("paging", paging);

        return "mypage.coupon";
    }
}
