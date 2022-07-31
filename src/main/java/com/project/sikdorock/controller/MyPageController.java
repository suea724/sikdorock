package com.project.sikdorock.controller;

import com.project.sikdorock.service.MyPageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;

@Controller
@RequiredArgsConstructor
public class MyPageController {

    private final MyPageService service;
}
