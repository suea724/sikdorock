package com.project.sikdorock.controller;

import com.project.sikdorock.dto.*;
import com.project.sikdorock.service.AdminService;
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
import java.time.LocalDate;
import java.util.Calendar;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class AdminController {

    private final AdminService service;

    @GetMapping(value="/admin/adminlogin")
    public String adminLogin() {

        return "adminlogin";
    }

    @GetMapping(value="/admin/logout")
    public void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('로그아웃 성공'); location.href='/sikdorock/index'</script>");
        out.flush();
    }

    @PostMapping(value="/admin/loginok")
    public void loginOk(AdminDTO adminDTO, HttpServletResponse response, HttpServletRequest request) throws IOException {

        int result = service.loginOk(adminDTO);
        HttpSession session = request.getSession();
        if (result == 1) {
            session.setAttribute("admin", "ok");
        }
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter writer = response.getWriter();
        writer.print("{");
        writer.printf("\"result\": %d", result);
        writer.print("}");

        writer.close();

    }

    @GetMapping(value="/admin/userlist")
    public String userList(@RequestParam(defaultValue = "1") int page, String word, Model model) {

        Paging paging = new Paging(page, service.pageCount(word), 10);
        List<UserDTO> list = service.list(paging, word);

        model.addAttribute("list", list);
        model.addAttribute("word", word);
        model.addAttribute("paging", paging);
        return "admin.userlist";
    }

    @GetMapping(value="/admin/userdel")
    public HttpServletResponse userDel(String id, HttpServletRequest request, HttpServletResponse response) throws IOException {

        String msg = service.delUser(id) == 0 ? "오류가 발생했습니다." : "삭제 완료.";
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("<script>alert('" + msg + "'); location.href='" + request.getHeader("Referer") + "'</script>");
        out.flush();

        return response;
    }

    @GetMapping(value="/admin/menulist")
    public String menuList(@RequestParam(defaultValue = "1") int page, Model model) {

        Paging paging = new Paging(page, service.menuCount(), 10);

        List<FoodDTO> list = service.getMenuList(paging);
        PriceDTO pdto = service.getPrice();

        for (FoodDTO fdto : list) {
            fdto.setOutdate(fdto.getOutdate().substring(0, 10));
            LocalDate now = LocalDate.now();
            LocalDate sellDate = LocalDate.parse(fdto.getOutdate());
            if (now.isAfter(sellDate)) {
                fdto.setAllergy("판매완료");
            } else {
                fdto.setAllergy("판매중");
            }
        }

        model.addAttribute("list", list);
        model.addAttribute("paging", paging);
        model.addAttribute("pdto", pdto);

        return "admin.menulist";
    }

    @GetMapping(value="/admin/priceupdate")
    public String priceUpdate(Model model) {

        PriceDTO pdto = service.getPrice();

        model.addAttribute("pdto", pdto);

        return "price";
    }

    @PostMapping(value="/admin/priceupdateok")
    public void priceUpdateOk(PriceDTO priceDTO, HttpServletResponse response) throws IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter writer = response.getWriter();
        int result = service.updatePrice(priceDTO);
        if (result == 1) {

            writer.println("<html>");
            writer.println("<body>");
            writer.println("<script>");
            writer.println("opener.parent.location.reload();");
            writer.println("window.close();");
            writer.println("</script>");
            writer.println("</body>");
            writer.println("</html>");

            writer.close();
        } else {
            writer.println("<script>alert('추가 실패');</script>");
        }
    }

    @GetMapping(value="/admin/menuadd")
    public String menuAdd(Model model) {

        List<CategoryDTO> category = service.category();
        Calendar now = Calendar.getInstance();
        String nowDate = String.format("%tF", now);
        model.addAttribute("category", category);
        model.addAttribute("nowDate", nowDate);

        return "admin.menuadd";
    }

    @PostMapping(value="/admin/menuaddok")
    public void menuAddOk(FoodDTO foodDTO, HttpServletRequest request, HttpServletResponse response) throws IOException {

        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        int result = service.menuAddOk(foodDTO, request);
        if (result == 1) {
            out.println("<script>alert('추가 완료'); location.href='/sikdorock/admin/menulist'</script>");
            out.flush();
            return;
        } else {
            out.println("<script>alert('추가 실패'); location.href='/sikdorock/admin/menulist'</script>");
            out.flush();
            return;
        }

    }

    @PostMapping(value="/admin/datecheck")
    public void dateCheck(String date, HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        int result = service.dateCheck(date);
        out.print("{");
        out.printf("\"result\": %d", result);
        out.print("}");

        out.close();
    }

    @GetMapping(value="/admin/menudel")
    public HttpServletResponse menuDel(String seq, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        String msg = service.delMenu(seq) == 0 ? "오류가 발생했습니다." : "삭제 완료.";
        out.println("<script>alert('" + msg + "'); location.href='" + request.getHeader("Referer") + "'</script>");
        out.flush();

        return response;
    }
    
    @GetMapping(value="/admin/questionlist")
    public String questionList(@RequestParam(defaultValue = "1") int page, Model model) {

        Paging paging = new Paging(page, service.questionCount(), 10);
        List<QuestionDTO> list = service.getQuestionList(paging);

        for (QuestionDTO qdto : list) {
            qdto.setRegdate(qdto.getRegdate().substring(0, 10));
            if (qdto.getContent().length() > 20) {
                qdto.setContent(qdto.getContent().substring(0, 20) + "...");
            }
        }

        model.addAttribute("list", list);
        model.addAttribute("paging", paging);

        return "admin.questionlist";
    }

    @GetMapping(value="/admin/questionview")
    public String questionView(Model model, String seq){

        QuestionDTO dto = service.getQuestion(seq);
        dto.setContent(dto.getContent().replace("\r\n", "<br>"));
        List<QuestionImageDTO> qlist = service.getQuestionImage(seq);
        for (QuestionImageDTO q : qlist) {
            q.setExt(q.getSeq() + q.getExt());
        }

        model.addAttribute("dto", dto);
        model.addAttribute("qlist", qlist);

        return "admin.questionview";
    }

    @GetMapping(value="/admin/answeradd")
    public String answerAdd(Model model, String seq) {


        model.addAttribute("seq", seq);
        return "admin.answeradd";

    }

    @PostMapping(value="/admin/answeraddok")
    public void answeraddok(AnswerDTO answerDTO, HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        service.updateQuestion(answerDTO.getQseq());
        int result = service.answerAdd(answerDTO);
        if (result == 1) {
            out.println("<script>alert('답변 완료'); location.href='/sikdorock/admin/questionlist'</script>");
            out.flush();
            return;
        } else {
            out.println("<script>alert('답변 실패'); location.href='/sikdorock/admin/questionlist'</script>");
            out.flush();
            return;
        }
    }

    @GetMapping(value="/admin/eventlist")
    public String eventList(@RequestParam(defaultValue = "1") int page, Model model) {

        Paging paging = new Paging(page, service.eventCount(), 10);
        List<EventDTO> list = service.getEvent(paging);

        for (EventDTO edto : list) {
            edto.setStartdate(edto.getStartdate().substring(0, 10));
            edto.setEnddate(edto.getEnddate().substring(0, 10));
            LocalDate now = LocalDate.now();
            LocalDate startdate = LocalDate.parse(edto.getStartdate());
            LocalDate enddate = LocalDate.parse(edto.getEnddate());
            if (now.isAfter(enddate)) {
                edto.setState("종료");
            } else if (now.isAfter(startdate) && now.isBefore(enddate)) {
                edto.setState("진행중");
            } else {
                edto.setState("진행 예정");
            }

        }

        model.addAttribute("list", list);
        model.addAttribute("paging", paging);
        return "admin.eventlist";
    }

    @GetMapping(value="/admin/eventdel")
    public HttpServletResponse eventDel(String seq, HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        String msg = service.delEvent(seq) == 0 ? "오류가 발생했습니다." : "삭제 완료.";
        out.println("<script>alert('" + msg + "'); location.href='" + request.getHeader("Referer") + "'</script>");
        out.flush();

        return response;
    }

    @GetMapping(value="/admin/eventadd")
    public String eventAdd(Model model) {

        Calendar now = Calendar.getInstance();
        String nowDate = String.format("%tF", now);

        model.addAttribute("nowDate", nowDate);

        return "admin.eventadd";
    }

    @PostMapping(value="/admin/eventaddok")
    public void eventAddOk(EventDTO eventDTO, HttpServletResponse response, String couponname, int discount) throws IOException {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();

        int result = service.eventAdd(eventDTO, couponname, discount);
        if (result == 1) {
            out.println("<script>alert('추가 완료'); location.href='/sikdorock/admin/eventlist'</script>");
            out.flush();
            return;
        } else {
            out.println("<script>alert('추가 실패'); location.href='/sikdorock/admin/eventlist'</script>");
            out.flush();
            return;
        }
    }

    @GetMapping(value="/admin/chart")
    public String chart() {

        return "admin.chart";
    }




}
