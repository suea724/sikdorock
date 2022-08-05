package com.project.sikdorock.service;

import com.project.sikdorock.dto.*;
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

    public List<FoodListDTO> getMenuli(String month) {
        //Map<String, Object> params = new HashMap<>();
        //params.put("start", paging.getOffset());
        //params.put("end", paging.getOffset() + paging.getFetch() - 1);

        return dao.getMenuli(month);
    }

    public String price() {

        return dao.price();
    }

    public FoodListDTO menuView(String seq) {

        return dao.menuView(seq);
    }

    public List<String> image(String seq) {

        return dao.image(seq);
    }

    public List<ReviewDTO> review(String seq) {
        return dao.review(seq);
    }

    public int rCnt(String seq) {
        return dao.rCnt(seq);
    }


    public String idLike(Map<String, String> map) {
        return dao.idLike(map);
    }

    public String idCart(Map<String, String> map) {
        return dao.idCart(map);
    }

    public int reviewAdd(ReviewDTO rdto) {
        return dao.reviewAdd(rdto);
    }

    public int reviewDel(String rseq) {
        return dao.reviewDel(rseq);
    }

    public int editReAdd(ReviewDTO rdto) {
        return dao.editReAdd(rdto);
    }

    public int addlike(Map<String, String> map) {
        return dao.addlike(map);
    }

    public int dellike(Map<String, String> map) {
        return dao.dellike(map);
    }

    public int addcart(CartDTO cdto) {
        return dao.addcart(cdto);
    }

    public int editReview(ReviewDTO rdto) {
        return dao.editReview(rdto);
    }

    public List<CartDTO> cartList(String id) {
        return dao.cartList(id);
    }

    public int editCart(Map<String, String> map) {
        return dao.editCart(map);
    }

    public int delCart(String seq) {
        return dao.delCart(seq);
    }
}
