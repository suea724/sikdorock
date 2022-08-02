package com.project.sikdorock.repository;

import com.project.sikdorock.dto.FoodDTO;
import com.project.sikdorock.dto.FoodListDTO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface MenuDAO {
    int menuCount();

    List<FoodListDTO> getMenuli(String month);

    String price();

    FoodListDTO menuView(String seq);
}
