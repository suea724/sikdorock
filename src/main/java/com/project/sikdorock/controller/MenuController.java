package com.project.sikdorock.controller;

import com.project.sikdorock.dto.FoodImageDTO;
import com.project.sikdorock.dto.FoodListDTO;
import com.project.sikdorock.dto.ReviewDTO;
import com.project.sikdorock.dto.UserDTO;
import com.project.sikdorock.service.MenuService;
import lombok.RequiredArgsConstructor;
import oracle.jdbc.proxy.annotation.Post;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public String menuView(Model model, String seq, HttpSession session) {

        UserDTO userdto = (UserDTO) session.getAttribute("auth");
        String id = userdto.getId();

        System.out.println(id);

        String like = null; //찜
        String cart = null; //장바구니

        Map<String, String> map = new HashMap<>();
        map.put("id", id);
        map.put("seq", seq);

        like = service.idLike(map);
        cart = service.idCart(map);


        FoodListDTO fdto = service.menuView(seq);
        List<String> imgList = service.image(seq);

        fdto.setOutdate(fdto.getOutdate().substring(0, 10));



        int rcnt = 0;
        int avgStar = 0; //리뷰 평균 별점
        int temp = 0; //리뷰 수
        String name = ""; //이름 홍** 바꾸기
        String date = ""; //리뷰 작성일 날짜만 보여주기
        String fstar = "0";
        rcnt = service.rCnt(seq);

        if (rcnt != 0) {
            List<ReviewDTO> reviewList = service.review(seq);

            for (ReviewDTO star : reviewList) {
                avgStar += Integer.parseInt(star.getStar());
                temp++;
            }

            fstar = String.format("%.1f", (double)avgStar / temp); //평균
            System.out.println(fstar);

            for (int i=0; i < reviewList.size(); i++) {
                name = reviewList.get(i).getName().substring(0,1);
                name += "**";
                reviewList.get(i).setName(name);

                //날짜만 추출
                reviewList.get(i).setRegdate(reviewList.get(i).getRegdate().substring(0,10));


                //reviewList.add(reviewList.get(i)); //*&**

                System.out.println(reviewList.get(i).toString());
            }

            if (reviewList != null) {
                System.out.println("null?");
                model.addAttribute("reviewList", reviewList); //메뉴에 대한 리뷰 리스트
            }
        }

        //가격 가져오기
        String price = String.format("%,d" ,Integer.parseInt(service.price()));


        System.out.println(avgStar);

        System.out.println("like" + like);
        System.out.println("cart" + cart);

        model.addAttribute("id", id);
        model.addAttribute("like", like);
        model.addAttribute("cart", cart);
        model.addAttribute("price", price);
        model.addAttribute("fstar", fstar); //별점 평군
        model.addAttribute("fdto", fdto); //메뉴 정보
        model.addAttribute("imgList", imgList); //메뉴 이미지 이름
        return "menu.view";
    }


    @PostMapping(value = "/menu/reviewadd")
    public String reviewAdd(Model model, String seq, HttpSession session, HttpServletRequest req) {

        UserDTO userdto = (UserDTO) session.getAttribute("auth");
        String id = userdto.getId();

        String star = req.getParameter("cleanStar");
        String review = req.getParameter("review");
        String fseq = req.getParameter("fseq");

        ReviewDTO rdto = new ReviewDTO();

        rdto.setFseq(fseq);
        rdto.setStar(star);
        rdto.setContent(review);
        rdto.setId(id);

        int result = 0;

        result = service.reviewAdd(rdto);


        if (result == 0) {
            return "redirect:/menu/menuli";
        } else {
            return String.format("redirect:/menu/view?seq=%s", fseq);
        }
    }

    @GetMapping(value = "/menu/reviewdel")
    public void reviewDel(String rseq, HttpSession session, HttpServletResponse resp) throws IOException {

        //id 가져오고
        //rdto 가져와야함
        UserDTO userdto = (UserDTO) session.getAttribute("auth");
        String id = userdto.getId();



        int result = 0;

        result = service.reviewDel(rseq); //리뷰 삭제




        PrintWriter writer = resp.getWriter();

        writer.printf("{\"result\" : %d}", result);

        writer.close();
    }


}
