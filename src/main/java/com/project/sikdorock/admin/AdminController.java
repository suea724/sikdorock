package com.project.sikdorock.admin;

import com.project.sikdorock.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class AdminController {

    private final AdminService service;

    @GetMapping(value="/admin/userList")
    public String home(Model model, String page, String word) {
        List<UserDTO> list = service.list(page, word);
        int i = 1;
        for (UserDTO u : list) {
            u.setSeq(i + "");
            i++;
        }
        model.addAttribute("list", list);
        return "admin.userlist";
    }

}
