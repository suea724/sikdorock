package com.project.sikdorock.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class FoodImageDTO {
    private int seq;
    private int fSeq;
    private String ext;
}
