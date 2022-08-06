package com.project.sikdorock.repository;

import com.project.sikdorock.dto.*;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface MenuDAO {
    int menuCount();

    List<FoodListDTO> getMenuli(String month);

    String price();

    FoodListDTO menuView(String seq);

    List<String> image(String seq);

    List<ReviewDTO> review(String seq);

    int rCnt(String seq);


    String idLike(Map<String, String> map);

    String idCart(Map<String, String> map);

    int reviewAdd(ReviewDTO rdto);

    int reviewDel(String rseq);

    int editReAdd(ReviewDTO rdto);

    int addlike(Map<String, String> map);

    int dellike(Map<String, String> map);

    int addcart(CartDTO cdto);

    int editReview(ReviewDTO rdto);

    List<CartDTO> cartList(String id);

    int editCart(Map<String, String> map);

    int delCart(String seq);

    UserDTO userInfo(String id);

    List<CartDTO> payment(String where);

    List<CouponDTO> coupon(String id);

    int getOlderSeq();

    void addOrder(Map<String, Object> params);

    String getOrderSeq();

    void addBuyList(Map<String, Object> params);

    void okCart(Map<String, Object> params);

    void delCoupon(Map<String, Object> params);
}
