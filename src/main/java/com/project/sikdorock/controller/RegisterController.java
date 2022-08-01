package com.project.sikdorock.controller;

import com.project.sikdorock.dto.RegisterDTO;
import com.project.sikdorock.dto.UserDTO;
import com.project.sikdorock.service.LoginService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
public class RegisterController {

    private final LoginService loginService;

    @GetMapping("/register")
    public String registerGet() {
        return "user.register";
    }

    @PostMapping("/register")
    public String registerPost(@ModelAttribute RegisterDTO registerDTO, HttpSession session) {

        int result = loginService.register(registerDTO);

        if (result == 1) {
            UserDTO user = loginService.getUser(registerDTO);
            session.setAttribute("auth", user);
        }

        return "index";
    }

}
