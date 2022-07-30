package com.project.sikdorock.repository;

import com.project.sikdorock.dto.UserDTO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface AdminDAO {

    List<UserDTO> list(Map<String, Object> params);

    int getCount(String word);

    int delUser(String id);
}
