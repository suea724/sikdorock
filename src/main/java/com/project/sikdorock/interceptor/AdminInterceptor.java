package com.project.sikdorock.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class AdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        response.setContentType("text/html; charset=UTF-8");
        PrintWriter out = response.getWriter();
        if (session.getAttribute("admin") == null) {
            out.println("<script>alert('관리자가 아닙니다.'); location.href='/sikdorock/index'</script>");
            out.flush();
            return false;
        }
        return true;
    }
}
