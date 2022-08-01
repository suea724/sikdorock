package com.project.sikdorock.repository;

import com.project.sikdorock.dto.CouponDTO;
import com.project.sikdorock.dto.FoodDTO;
import com.project.sikdorock.dto.UserLikeFoodDTO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface MyPageDAO {
    // 쿠폰함에서 쿠폰 리스트를 받아오는 DAO
    List<CouponDTO> couponList(Map<String, Object> params);

    //찜목록에서 찜 리스트를 받아오는 DAO
    List<UserLikeFoodDTO> likeFoodList(Map<String, Object> params);

    //찜목록에서 요소를 삭제하는 DAO
    int delLikeFood(String fseq);

    int likeFoodCount();

    int couponCount();
}
