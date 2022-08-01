package com.project.sikdorock.repository;

import com.project.sikdorock.dto.RegisterDTO;
import com.project.sikdorock.dto.UserDTO;
import org.springframework.stereotype.Repository;

@Repository
public interface LoginDAO {

    UserDTO findUser(String email);

    int saveUser(RegisterDTO registerDTO);
}
