package com.project.sikdorock.admin;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequiredArgsConstructor
public class AdminController {

    private final AdminService service;

    @GetMapping(value="/admin/home")
    public String home() {

        return "admin.home";
    }

}
