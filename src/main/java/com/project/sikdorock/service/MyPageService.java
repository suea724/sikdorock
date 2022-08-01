package com.project.sikdorock.service;

import com.project.sikdorock.dto.CouponDTO;
import com.project.sikdorock.dto.FoodDTO;
import com.project.sikdorock.repository.MyPageDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MyPageService {

    private final MyPageDAO dao;

    public List<CouponDTO> couponList() {
        return dao.couponList();
    }

    public List<FoodDTO> likeFoodList() {
        return dao.likeFoodList();
    }
}
