package com.project.sikdorock.repository;

import com.project.sikdorock.dto.*;
import org.springframework.stereotype.Repository;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Repository
public interface AdminDAO {

    List<UserDTO> list(Map<String, Object> params);

    int getCount(String word);

    int delUser(String id);

    List<CategoryDTO> category();

    int menuAdd(FoodDTO foodDTO);

    int getSeq();

    void addFile(FoodImageDTO fdto);

    List<FoodDTO> getMenuList(Map<String, Object> params);

    int dateCheck(String outDate);

    int menuCount();

    int delMenu(String seq);

    List<QuestionDTO> getQuestionList(Map<String, Object> params);

    int questionCount();

    QuestionDTO getQuestion(String seq);

    List<QuestionImageDTO> getQuestionImage(String seq);
}
