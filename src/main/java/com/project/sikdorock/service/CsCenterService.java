package com.project.sikdorock.service;

import com.project.sikdorock.dto.AnswerDTO;
import com.project.sikdorock.dto.Paging;
import com.project.sikdorock.dto.QuestionDTO;
import com.project.sikdorock.repository.CsCenterDAO;
import com.project.sikdorock.util.FileManager;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CsCenterService {

    private final CsCenterDAO dao;
    private final FileManager fileManager;

    public int questionAdd(QuestionDTO questionDTO, HttpServletRequest request) throws IOException {

        int result = dao.questionAdd(questionDTO);

        int seq = dao.getSeq();

        MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;

        List<MultipartFile> files = multi.getFiles("imageAdd");
        fileManager.csCenterUpload(files, seq);

        return result;
    }


    public List<QuestionDTO> getQuestion(String id, Paging paging) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", paging.getOffset());
        params.put("end", paging.getOffset() + paging.getFetch() - 1);
        params.put("id", id);
        return dao.getQuestion(params);
    }

    public int questionCount(String id) {

        return dao.questionCount(id);
    }

    public AnswerDTO getAnswer(String seq) {

        return dao.getAnswer(seq);
    }
}
