package com.project.sikdorock.controller;

import com.project.sikdorock.dto.AnswerDTO;
import com.project.sikdorock.dto.Paging;
import com.project.sikdorock.dto.QuestionDTO;
import com.project.sikdorock.dto.UserDTO;
import com.project.sikdorock.service.CsCenterService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class CsCenterController {

    private final CsCenterService service;

    @GetMapping(value="/cscenter/questionadd")
    public String questionAdd(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        UserDTO udto = (UserDTO) session.getAttribute("auth");
        if (udto == null) {
            out.println("<script>alert('로그인이 필요합니다.'); location.href='/sikdorock/login'</script>");
            out.flush();
        }

        return "cscenter.questionadd";
    }

    @PostMapping(value="/cscenter/questionaddok")
    public void questionAddOk(HttpServletResponse response, HttpServletRequest request, QuestionDTO questionDTO) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        UserDTO udto = (UserDTO) session.getAttribute("auth");
        if (udto == null) {
            out.println("<script>alert('로그인이 필요합니다.'); location.href='/sikdorock/login'</script>");
            out.flush();
        }
        questionDTO.setId(udto.getId());
        int result = service.questionAdd(questionDTO, request);
        if (result == 1) {
            out.println("<script>alert('추가 완료'); location.href='/sikdorock/cscenter/questionlist'</script>");
            out.flush();
        } else {
            out.println("<script>alert('추가 실패'); location.href='/sikdorock/cscenter/questionadd'</script>");
            out.flush();
        }

    }

    @GetMapping(value="/cscenter/questionlist")
    public String questionList(Model model, @RequestParam(defaultValue = "1") int page, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        UserDTO udto = (UserDTO) session.getAttribute("auth");
        if (udto == null) {
            out.println("<script>alert('로그인이 필요합니다.'); location.href='/sikdorock/login'</script>");
            out.flush();
        }
        Paging paging = new Paging(page, service.questionCount(udto.getId()), 10);
        List<QuestionDTO> list = service.getQuestion(udto.getId(), paging);

        for (QuestionDTO qdto : list) {
            qdto.setRegdate(qdto.getRegdate().substring(0, 10));
            if (qdto.getContent().length() > 10) {
                qdto.setContent(qdto.getContent().substring(0, 10) + "....");
            }
        }

        model.addAttribute("list", list);
        model.addAttribute("paging", paging);
        return "cscenter.questionlist";
    }

    @GetMapping(value="/cscenter/showanswer")
    public String showAnswer(Model model, String seq, HttpServletResponse response, HttpServletRequest request) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        UserDTO udto = (UserDTO) session.getAttribute("auth");
        if (udto == null) {
            out.println("<script>alert('로그인이 필요합니다.'); location.href='/sikdorock/login'</script>");
            out.flush();
        }
        AnswerDTO dto = service.getAnswer(seq);
        dto.setRegdate(dto.getRegdate().substring(0, 10));

        model.addAttribute("dto", dto);

        return "showanswer";
    }

}
