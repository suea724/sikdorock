package com.project.sikdorock.controller;

import com.project.sikdorock.dto.EventDTO;
import com.project.sikdorock.dto.UserDTO;
import com.project.sikdorock.service.EventService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class EventController {

    private final EventService service;


    @GetMapping(value="/event")
    public String userList(Model model, HttpServletRequest request, HttpServletResponse response) {

        List<EventDTO> eventlist = service.eventlist();

        //System.out.println(eventlist);

        model.addAttribute("list", eventlist);

        return "event.eventlist";
    }


    @GetMapping(value="/event/eventview")
    public String eventview(Model model, HttpServletRequest request, HttpServletResponse response, String seq) {

        HttpSession session = request.getSession();
        UserDTO udto = (UserDTO) session.getAttribute("auth");

        EventDTO dto = service.get(seq);

        model.addAttribute("dto", dto);
        model.addAttribute("udto", udto);

        System.out.println(dto);
        return "event.eventview";

    }





}











