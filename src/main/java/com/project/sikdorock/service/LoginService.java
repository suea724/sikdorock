package com.project.sikdorock.service;

import com.project.sikdorock.dto.RegisterDTO;
import com.project.sikdorock.dto.UserDTO;
import com.project.sikdorock.repository.LoginDAO;
import lombok.RequiredArgsConstructor;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

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
}
