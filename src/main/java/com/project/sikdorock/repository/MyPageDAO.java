package com.project.sikdorock.repository;

import com.project.sikdorock.dto.CouponDTO;
import com.project.sikdorock.dto.FoodDTO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MyPageDAO {
    // 쿠폰함에서 쿠폰 리스트를 받아오는 DAO
    List<CouponDTO> couponList();

    //찜목록에서 찜 리스트를 받아오는 DAO
    List<FoodDTO> likeFoodList();
}
