package com.project.sikdorock.repository;

import com.project.sikdorock.dto.*;
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
    int delLikeFood(Map<String, String> map);

    int likeFoodCount(String id);

    int couponCount(String id);

    //마이페이지에서 내 정보 관리하기
    UserDTO myInfo(String id);

    int editmyinfo(Map<String, String> map);

    List<UserOrderDTO> orderList(String id);
}
