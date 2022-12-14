package com.project.sikdorock.service;

import com.project.sikdorock.dto.*;
import com.project.sikdorock.repository.AdminDAO;
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
public class AdminService {

    private final AdminDAO dao;
    private final FileManager FileManager;

    public List<UserDTO> list(Paging paging, String word) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", paging.getOffset());
        params.put("end", paging.getOffset() + paging.getFetch() - 1);
        params.put("word", word);

        return dao.list(params);
    }

    public int pageCount(String word) {

        return dao.getCount(word);
    }

    public int delUser(String id) {

        return dao.delUser(id);
    }

    public List<CategoryDTO> category() {

        return dao.category();
    }

    public int menuAddOk(FoodDTO foodDTO, HttpServletRequest request) throws IOException {

        int result = dao.menuAdd(foodDTO);

        int seq = dao.getSeq();

        MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;

        List<MultipartFile> files = multi.getFiles("btnAtt");
        FileManager.adminUpload(files, seq);

        return result;
    }

    public List<FoodDTO> getMenuList(Paging paging) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", paging.getOffset());
        params.put("end", paging.getOffset() + paging.getFetch() - 1);

        return dao.getMenuList(params);
    }

    public int dateCheck(String outdate) {

        return dao.dateCheck(outdate);
    }

    public int menuCount() {

        return dao.menuCount();
    }

    public int delMenu(String seq) {

        return dao.delMenu(seq);
    }

    public List<QuestionDTO> getQuestionList(Paging paging) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", paging.getOffset());
        params.put("end", paging.getOffset() + paging.getFetch() - 1);

        return dao.getQuestionList(params);
    }

    public int questionCount() {

        return dao.questionCount();
    }

    public QuestionDTO getQuestion(String seq) {

        return dao.getQuestion(seq);
    }

    public List<QuestionImageDTO> getQuestionImage(String seq) {

        return dao.getQuestionImage(seq);
    }

    public int answerAdd(AnswerDTO answerDTO) {

        return dao.answerAdd(answerDTO);
    }

    public void updateQuestion(String qseq) {

        dao.updateQuestion(qseq);
    }

    public List<EventDTO> getEvent(Paging paging) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", paging.getOffset());
        params.put("end", paging.getOffset() + paging.getFetch() - 1);

        return dao.getEvent(params);
    }

    public int eventCount() {

        return dao.eventCount();
    }

    public int delEvent(String seq) {

        return dao.delEvent(seq);
    }

    public int eventAdd(EventDTO eventDTO, String couponname, int discount) {
        CouponDTO cdto = new CouponDTO();
        cdto.setName(couponname);
        cdto.setDiscount(discount);

        dao.couponAdd(cdto);

        int seq = dao.getCouponSeq();

        eventDTO.setCseq(seq);

        int result = dao.eventAdd(eventDTO);

        return result;
    }


    public PriceDTO getPrice() {

        return dao.getPrice();
    }

    public int updatePrice(PriceDTO priceDTO) {

        return dao.updatePrice(priceDTO);
    }

    public int loginOk(AdminDTO adminDTO) {

        return dao.loginOk(adminDTO);
    }
}
