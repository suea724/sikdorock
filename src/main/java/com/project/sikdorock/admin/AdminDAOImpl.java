package com.project.sikdorock.admin;

import com.project.sikdorock.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@RequiredArgsConstructor
public class AdminDAOImpl implements AdminDAO {

    private final SqlSessionTemplate template;

    @Override
    public List<UserDTO> list() {

        return template.selectList("admin.list");
    }
}
