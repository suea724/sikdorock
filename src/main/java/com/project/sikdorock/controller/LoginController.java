package com.project.sikdorock.controller;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.project.sikdorock.NaverLoginBO;
import com.project.sikdorock.dto.RegisterDTO;
import com.project.sikdorock.dto.UserDTO;
import com.project.sikdorock.service.LoginService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequiredArgsConstructor
public class LoginController {

    private final LoginService loginService;
    private final NaverLoginBO naverLoginBO;
    private String apiResult = null;

    @RequestMapping(value = "/login", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {

        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);

        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);

        //네이버
        model.addAttribute("url", naverAuthUrl);

        /* 생성한 인증 URL을 View로 전달 */
        return "user.login";
    }

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/login/naver/callback", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session) throws IOException {

        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);

        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);

        model.addAttribute("result", apiResult);

        System.out.println("apiResult = " + apiResult);

        // 이메일로 DB에서 회원 찾기
        UserDTO findUser = loginService.checkUser(apiResult);

        if (findUser == null) { // 존재하지 않으면 회원가입 페이지로 이동

            // 회원가입 페이지로 넘길 데이터 파싱
            RegisterDTO rdto = loginService.parse(apiResult);

            model.addAttribute("token", oauthToken.getAccessToken());
            model.addAttribute("rdto", rdto);

            return "user.register";

        } else { // 존재하면 메인 페이지로
            session.setAttribute("auth", findUser);
            return "index";
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
    }

}
