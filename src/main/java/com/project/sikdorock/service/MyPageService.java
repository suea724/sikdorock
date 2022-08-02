package com.project.sikdorock.service;

import com.project.sikdorock.dto.*;
import com.project.sikdorock.repository.MyPageDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class MyPageService {

    private final MyPageDAO dao;

    public List<CouponDTO> couponList(Paging paging, String id) {

        Map<String, Object> params = new HashMap<String, Object>();
        params.put("start", paging.getOffset());
        params.put("end", paging.getOffset() + paging.getFetch() -1);
        params.put("id", id);

        return dao.couponList(params);
    }

    public List<UserLikeFoodDTO> likeFoodList(Paging paging, String id) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("start", paging.getOffset());
        params.put("end", paging.getOffset() + paging.getFetch() -1);
        params.put("id", id);

        return dao.likeFoodList(params);
    }

    public int delLikeFood(String fseq, String id) {
        Map<String, String> map = new HashMap<>();
        map.put("fseq", fseq);
        map.put("id", id);
        return dao.delLikeFood(map);
    }

    public int likeFoodCount(String id) {
        return dao.likeFoodCount(id);
    }

    public int couponCount(String id) {
        return dao.couponCount(id);
    }

    public UserDTO myInfo(String id) {
        return dao.myInfo(id);
    }

    public int editmyinfo(Map<String, String> map) {
        return dao.editmyinfo(map);
    }

    public List<UserOrderDTO> orderList(String id) {
        return dao.orderList(id);
    }
}
