package com.project.sikdorock.controller;

import com.project.sikdorock.dto.CategoryDTO;
import com.project.sikdorock.dto.FoodDTO;
import com.project.sikdorock.service.AdminService;
import com.project.sikdorock.dto.Paging;
import com.project.sikdorock.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
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
    public String menuList() {
        
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
        System.out.println("foodDTO = " + foodDTO);
        int result = service.menuAddOk(foodDTO, request);
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
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

}
