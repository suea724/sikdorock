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

        System.out.println(eventlist);

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

        //이벤트 참여 여부 확인
        int attend = service.checkattend(dto);

//        System.out.println("attend: " + attend);


        //참여하지 않은 사용자면 뽑기 실행
        if (attend == 0) {
            service.eventattend(dto);
            result = service.eventcheck();
        } else {
            //참여를 한 사용자면 2를 반환해서 > 이미 참여하셨습니다.
            result = 2;
        }

        //attend > 참여 여부 확인. attend가 0이면 아직 참여 X
        //result가 1일 때 : 당첨 > tblUserCoupon에 insert
        //result가 0일 때 : 당첨X

        //attend가 1이면 이미 참여함 > 그래서 result 값을 2로
        //result가 2일 때 : 이미 참여함.

        // 쿠폰이 당첨되면 insert
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











