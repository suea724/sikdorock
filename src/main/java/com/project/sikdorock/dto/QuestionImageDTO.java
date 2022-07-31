package com.project.sikdorock.dto;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class QuestionImageDTO {
    private int seq;
    private int qSeq;
    private String ext;

}
