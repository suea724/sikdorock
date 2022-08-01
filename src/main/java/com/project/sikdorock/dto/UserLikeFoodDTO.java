package com.project.sikdorock.dto;

import lombok.Data;

@Data
public class UserLikeFoodDTO {
    private String fseq; //음식 번호
    private String menuname; //음식 이름
    private String filename; //이미지 이름
}
