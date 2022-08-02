package com.project.sikdorock.interceptor;

import com.project.sikdorock.dto.UserDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Slf4j
public class LoginInterceptor implements HandlerInterceptor {


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        UserDTO udto = (UserDTO) session.getAttribute("auth");
        if (udto == null) {
            out.println("<script>alert('로그인이 필요합니다.'); location.href='/sikdorock/login'</script>");
            out.flush();
            return false;
        }
        return true;
    }
}
