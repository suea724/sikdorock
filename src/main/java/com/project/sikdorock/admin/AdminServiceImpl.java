package com.project.sikdorock.admin;

import com.project.sikdorock.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {

    private final AdminDAO dao;

    @Override
    public List<UserDTO> list(String page, String word) {

        List<UserDTO> list = dao.list();

        return list;
    }
}
