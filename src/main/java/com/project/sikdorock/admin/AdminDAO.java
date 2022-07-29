package com.project.sikdorock.admin;

import com.project.sikdorock.dto.UserDTO;

import java.util.List;

public interface AdminDAO {
    List<UserDTO> list();
}
