package com.project.sikdorock.controller;

import com.project.sikdorock.dto.EventDTO;
import com.project.sikdorock.dto.EventUserDTO;
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
    public String eventlist(Model model, HttpServletRequest request, HttpServletResponse response) {

        List<EventDTO> eventlist = service.eventlist();

       // System.out.println(eventlist);

        model.addAttribute("list", eventlist);

        return "event.eventlist";
    }


    @GetMapping(value="/event/eventview")
    public String eventview(Model model, HttpServletRequest request, HttpServletResponse response, String seq) {

        HttpSession session = request.getSession();
        UserDTO udto = (UserDTO) session.getAttribute("auth");

        String nowDate = service.getdate();

        EventDTO dto = service.get(seq);

        dto.setNowdate(nowDate);

        //System.out.println("dto: " + dto);

        int checkdate = service.checkdate(dto);

        dto.setCheckdate(checkdate);

        model.addAttribute("dto", dto);
        model.addAttribute("udto", udto);

        return "event.eventview";

    }


    @GetMapping (value="/event/eventcheck")
    public void eventcheck(Model model, HttpServletRequest request, HttpServletResponse response, EventUserDTO dto) throws IOException {

        request.setCharacterEncoding("UTF-8");
        String id = request.getParameter("id");
        String cseq = request.getParameter("cseq");
        String eventseq = request.getParameter("seq");

        dto.setId(id);
        dto.setEventseq(eventseq);
        dto.setCseq(cseq);

//        System.out.println("id: " + id);
//        System.out.println("cseq: " + cseq);
//        System.out.println("eventseq: " + eventseq);


        int result = 0;

        //????????? ?????? ?????? ??????
        int attend = service.checkattend(dto);

//        System.out.println("attend: " + attend);


        //???????????? ?????? ???????????? ?????? ??????
        if (attend == 0) {
            service.eventattend(dto);
            result = service.eventcheck();
        } else {
            //????????? ??? ???????????? 2??? ???????????? > ?????? ?????????????????????.
            result = 2;
        }

        //attend > ?????? ?????? ??????. attend??? 0?????? ?????? ?????? X
        //result??? 1??? ??? : ?????? > tblUserCoupon??? insert
        //result??? 0??? ??? : ??????X

        //attend??? 1?????? ?????? ????????? > ????????? result ?????? 2???
        //result??? 2??? ??? : ?????? ?????????.

        // ????????? ???????????? insert
        if (result == 1) {
            service.getcoupon(dto);
        }

//        System.out.println("result: " + result);

        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        PrintWriter writer = response.getWriter();

        writer.printf("{\"result\" : \"%d\"}", result);
        writer.close();


    }






}











