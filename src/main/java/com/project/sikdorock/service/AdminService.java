package com.project.sikdorock.service;

import com.project.sikdorock.dto.*;
import com.project.sikdorock.repository.AdminDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class AdminService {

    private final AdminDAO dao;

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

    public int menuAddOk(FoodDTO foodDTO, HttpServletRequest request) {

        int result = dao.menuAdd(foodDTO);

        int seq = dao.getSeq();

        MultipartHttpServletRequest multi = (MultipartHttpServletRequest)request;

        List<MultipartFile> files = multi.getFiles("btnAtt");
        String path = request.getRealPath("resources/files");

        for (MultipartFile file : files) {

            String filename = getFileName(path, file.getOriginalFilename());
            System.out.println("filename = " + filename);

            File tempfile = new File(path + "\\" + filename);

            try {
                file.transferTo(tempfile);
            } catch (Exception e) {
                e.printStackTrace();
            }

            FoodImageDTO fdto = new FoodImageDTO();
            fdto.setFileName(filename);
            fdto.setFSeq(seq+"");

            dao.addFile(fdto);
        }

        return result;
    }

    private String getFileName(String path, String filename) {

        //저장 폴더의 파일명을 중복되지 않게 만들기
        //path = "resources/files/"
        //fileanme = "MyBatis.png"

        int n = 1; //인덱싱 숫자
        int index = filename.lastIndexOf(".");

        String tempName = filename.substring(0, index);
        String tempExt = filename.substring(index);


        while(true) {

            File file = new File(path + "\\" + filename); //files\MyBatis.png

            if (file.exists()) {
                //있다. > 중복 > 파일 변경
                filename = tempName + "_" + n + tempExt;
                n++;
            } else {

                return filename;
            }

        }


    }

    public List<FoodDTO> getMenuList(Paging paging) {
        Map<String, Object> params = new HashMap<>();
        params.put("start", paging.getOffset());
        params.put("end", paging.getOffset() + paging.getFetch() - 1);

        return dao.getMenuList(params);
    }

    public int dateCheck(String outDate) {

        return dao.dateCheck(outDate);
    }

    public int menuCount() {

        return dao.menuCount();
    }

    public int delMenu(String seq) {

        return dao.delMenu(seq);
    }
}
