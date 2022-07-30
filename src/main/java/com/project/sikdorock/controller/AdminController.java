package com.project.sikdorock.controller;

import com.project.sikdorock.dto.*;
import com.project.sikdorock.service.AdminService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class AdminController {

    private final AdminService service;

    @GetMapping(value="/admin/userList")
    public String userList(@RequestParam(defaultValue = "1") int page, String word, Model model) {

        Paging paging = new Paging(page, service.pageCount(word));
        List<UserDTO> list = service.list(paging, word);

        model.addAttribute("list", list);
        model.addAttribute("word", word);
        model.addAttribute("paging", paging);
        return "admin.userlist";
    }

    @GetMapping(value="/admin/userDel")
    public HttpServletResponse userDel(String id, HttpServletRequest request, HttpServletResponse response) throws IOException {

        String msg = service.delUser(id) == 0 ? "오류가 발생했습니다." : "삭제 완료.";
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('" + msg + "'); location.href='" + request.getHeader("Referer") + "'</script>");
        out.flush();

        return response;
    }

    @GetMapping(value="/admin/menuList")
    public String menuList(@RequestParam(defaultValue = "1") int page, Model model) {

        Paging paging = new Paging(page, service.menuCount());

        List<FoodDTO> list = service.getMenuList(paging);

        for (FoodDTO fdto : list) {
            fdto.setOutDate(fdto.getOutDate().substring(0, 10));
            LocalDate now = LocalDate.now();
            LocalDate sellDate = LocalDate.parse(fdto.getOutDate());
            if (now.isAfter(sellDate)) {
                fdto.setAllergy("판매완료");
            } else {
                fdto.setAllergy("판매중");
            }
        }

        model.addAttribute("list", list);
        model.addAttribute("paging", paging);

        return "admin.menulist";
    }

    @GetMapping(value="/admin/menuAdd")
    public String menuAdd(Model model) {

        List<CategoryDTO> category = service.category();

        model.addAttribute("category", category);

        return "admin.menuadd";
    }

    @PostMapping(value="/admin/menuAddOk")
    public void menuAddOk(FoodDTO foodDTO, HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        int check = service.dateCheck(foodDTO.getOutDate());
        if (check != 0) {
            out.println("<script>alert('이미 등록된 날짜입니다.'); location.href='/sikdorock/admin/menuList'</script>");
            out.flush();
            return;
        }
        int result = service.menuAddOk(foodDTO, request);
        if (result == 1) {
            out.println("<script>alert('추가 완료'); location.href='/sikdorock/admin/menuList'</script>");
            out.flush();
            return;
        } else {
            out.println("<script>alert('추가 실패'); location.href='/sikdorock/admin/menuList'</script>");
            out.flush();
            return;
        }

    }

    @GetMapping(value="/admin/menuDel")
    public HttpServletResponse menuDel(String seq, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String msg = service.delMenu(seq) == 0 ? "오류가 발생했습니다." : "삭제 완료.";
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('" + msg + "'); location.href='" + request.getHeader("Referer") + "'</script>");
        out.flush();

        return response;
    }
    
    @GetMapping(value="/admin/questionList")
    public String questionList(@RequestParam(defaultValue = "1") int page, Model model) {
        Paging paging = new Paging(page, service.questionCount());
        List<QuestionDTO> list = service.getQuestionList(paging);

        for (QuestionDTO qdto : list) {
            qdto.setRegdate(qdto.getRegdate().substring(0, 10));
            if (qdto.getContent().length() > 20) {
                qdto.setContent(qdto.getContent().substring(0, 20) + "...");
            }
        }

        model.addAttribute("list", list);
        model.addAttribute("paging", paging);

        return "admin.questionlist";
    }

    @GetMapping(value="/admin/questionView")
    public String questionView() {

        return "admin.questionview";
    }

}
