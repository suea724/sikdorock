package com.project.sikdorock.repository;

import com.project.sikdorock.dto.FoodDTO;
import com.project.sikdorock.dto.FoodImageDTO;
import com.project.sikdorock.dto.FoodListDTO;
import com.project.sikdorock.dto.ReviewDTO;
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
}
