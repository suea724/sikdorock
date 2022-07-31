package com.project.sikdorock.dto;

import lombok.Data;

import java.util.List;

@Data
public class QuestionDTO {
    private String seq;
    private String content;
    private String regdate;
    private String id;
    private String answer;
    private List<QuestionImageDTO> list;
    private AnswerDTO answerDTO;
}
