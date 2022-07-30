package com.project.sikdorock.controller;

import com.project.sikdorock.service.AdminService;
import com.project.sikdorock.dto.Paging;
import com.project.sikdorock.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String userDel(Model model, String id) {

        int result = service.delUser(id);
        System.out.println("result = " + result);

        model.addAttribute("result", result);

        return "admin.userdel";
    }

}
