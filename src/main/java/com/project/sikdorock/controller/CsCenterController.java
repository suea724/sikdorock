package com.project.sikdorock.controller;

import com.project.sikdorock.dto.AnswerDTO;
import com.project.sikdorock.dto.Paging;
import com.project.sikdorock.dto.QuestionDTO;
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
    public String questionAdd() {

        return "cscenter.questionadd";
    }

    @PostMapping(value="/cscenter/questionaddok")
    public void questionAddOk(HttpServletResponse response, HttpServletRequest request, QuestionDTO questionDTO) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        String id = "hong1234";
        questionDTO.setId(id);
        int result = service.questionAdd(questionDTO, request);
        if (result == 1) {
            out.println("<script>alert('추가 완료'); location.href='/sikdorock/cscenter/questionlist'</script>");
            out.flush();
            return;
        } else {
            out.println("<script>alert('추가 실패'); location.href='/sikdorock/cscenter/questionadd'</script>");
            out.flush();
            return;
        }

    }

    @GetMapping(value="/cscenter/questionlist")
    public String questionList(Model model, @RequestParam(defaultValue = "1") int page, HttpServletRequest request) {

        String id = "hong1234";
        Paging paging = new Paging(page, service.questionCount(id), 10);
        List<QuestionDTO> list = service.getQuestion(id, paging);

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
    public String showAnswer(Model model, String seq) {

        AnswerDTO dto = service.getAnswer(seq);
        dto.setRegdate(dto.getRegdate().substring(0, 10));

        model.addAttribute("dto", dto);

        return "showanswer";
    }

}
