package com.project.sikdorock.repository;

import com.project.sikdorock.dto.AnswerDTO;
import com.project.sikdorock.dto.QuestionDTO;
import com.project.sikdorock.dto.QuestionImageDTO;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface CsCenterDAO {
    int questionAdd(QuestionDTO questionDTO);

    int getSeq();
    void addFile(QuestionImageDTO qdto);

    List<QuestionDTO> getQuestion(Map<String, Object> params);

    int questionCount(String id);

    AnswerDTO getAnswer(String seq);
}
