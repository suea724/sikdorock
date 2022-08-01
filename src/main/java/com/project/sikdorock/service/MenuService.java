package com.project.sikdorock.service;

import com.project.sikdorock.dto.FoodDTO;
import com.project.sikdorock.dto.FoodListDTO;
import com.project.sikdorock.dto.Paging;
import com.project.sikdorock.repository.MenuDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MenuService {

    private final MenuDAO dao;

    public int menuCount() {
        return dao.menuCount();
    }

    public List<FoodListDTO> getMenuli(Paging paging) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", paging.getOffset());
        params.put("end", paging.getOffset() + paging.getFetch() - 1);

        return dao.getMenuli(params);
    }
}
