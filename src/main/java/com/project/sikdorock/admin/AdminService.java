package com.project.sikdorock.admin;

import com.project.sikdorock.dto.UserDTO;

import java.util.List;

public interface AdminService {
    List<UserDTO> list(String page, String word);
}
