package com.project.sikdorock.service;

import com.project.sikdorock.dto.RegisterDTO;
import com.project.sikdorock.dto.UserDTO;
import com.project.sikdorock.repository.LoginDAO;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
@RequiredArgsConstructor
public class LoginService {

    private final LoginDAO loginDAO;

    public UserDTO checkUser(String apiResult) {
        JSONParser parser = new JSONParser();
        try {
            JSONObject jsonObject = (JSONObject) parser.parse(apiResult);
            JSONObject responseObj = (JSONObject) jsonObject.get("response");

            String email = (String) responseObj.get("email");

            UserDTO dto = loginDAO.findUser(email);

            return dto;

        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    public RegisterDTO parse(String apiResult) {
        JSONParser parser = new JSONParser();
        try {
            JSONObject jsonObject = (JSONObject) parser.parse(apiResult);
            JSONObject responseObj = (JSONObject) jsonObject.get("response");

            String email = (String) responseObj.get("email");
            String name = (String) responseObj.get("name");
            String mobile = (String) responseObj.get("mobile");

            RegisterDTO dto = new RegisterDTO();

            dto.setEmail(email);
            dto.setName(name);
            dto.setTel(mobile);

            return dto;

        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
    }

    public int register(RegisterDTO registerDTO) {
        return loginDAO.saveUser(registerDTO);
    }

    public UserDTO getUser(RegisterDTO registerDTO) {
        UserDTO user = loginDAO.findUser(registerDTO.getEmail());
        return user;
    }

    // ????????? ????????? AccessToken ??????
    public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            // POST ????????? ?????? ???????????? false??? setDoOutput??? true???
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            // POST ????????? ????????? ???????????? ???????????? ???????????? ?????? ??????
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");

            sb.append("&client_id=dfeb89b9833869d3e1a11f5d2aa1d36f"); //????????? ???????????? key
            sb.append("&redirect_uri=http://localhost:9090/sikdorock/login/kakao"); // ????????? ????????? ??????

            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            // ?????? ????????? 200????????? ??????
            // int responseCode = conn.getResponseCode();
            // System.out.println("responseCode : " + responseCode);

            // ????????? ?????? ?????? JSON????????? Response ????????? ????????????
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            // System.out.println("response body : " + result);

            // Gson ?????????????????? ????????? ???????????? JSON?????? ?????? ??????
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            // refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            // System.out.println("access_token : " + access_Token);
            // System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();

        } catch (IOException e) {
            e.printStackTrace();
        }
        return access_Token;
    }

    public String getUserEmail(String access_Token) {

        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");

            // ????????? ????????? Header??? ????????? ??????
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            // System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            // System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            String email = kakao_account.getAsJsonObject().get("email").getAsString();

            return email;

        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }

    public UserDTO checkUserByEmail(String email) {
        return loginDAO.findUser(email);
    }
}
