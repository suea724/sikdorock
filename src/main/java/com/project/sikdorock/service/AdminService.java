package com.project.sikdorock.service;

import com.project.sikdorock.dto.Paging;
import com.project.sikdorock.repository.AdminDAO;
import com.project.sikdorock.dto.UserDTO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class AdminService {

    private final AdminDAO dao;

    public List<UserDTO> list(Paging paging, String word) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", paging.getOffset());
        params.put("end", paging.getOffset() + paging.getFetch() - 1);
        params.put("word", word);

        return dao.list(params);
    }

    public int pageCount(String word) {

        return dao.getCount(word);
    }

    public int delUser(String id) {

        return dao.delUser(id);
    }

}
