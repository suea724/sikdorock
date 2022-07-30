package com.project.sikdorock.repository;

import com.project.sikdorock.dto.CategoryDTO;
import com.project.sikdorock.dto.FoodDTO;
import com.project.sikdorock.dto.FoodImageDTO;
import com.project.sikdorock.dto.UserDTO;
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
}
