package com.project.sikdorock.dto;

import lombok.Data;

@Data
public class FoodListDTO {

    private String seq;
    private String menuname;
    private String menuexplain;
    private String allergy;
    private String outdate;
    private String cateseq;


    private String image; //이미지

}
