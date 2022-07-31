package com.project.sikdorock.util;

import com.project.sikdorock.dto.FoodImageDTO;
import com.project.sikdorock.dto.QuestionImageDTO;
import com.project.sikdorock.repository.AdminDAO;
import com.project.sikdorock.repository.CsCenterDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.List;


@Component
@RequiredArgsConstructor
public class FileManager {

    private String path;
    private final AdminDAO adminDAO;
    private final CsCenterDAO csCenterDAO;

    @Autowired
    public FileManager(ServletContext context, AdminDAO adminDAO, CsCenterDAO csCenterDAO) {
        path = context.getRealPath("/resources/files/");
        this.adminDAO = adminDAO;
        this.csCenterDAO = csCenterDAO;
    }

    public boolean adminUpload(List<MultipartFile> files, int fSeq) throws IOException {
        for (MultipartFile file : files) {
            String originalFileName = file.getOriginalFilename();
            String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
            FoodImageDTO fdto = FoodImageDTO.builder().fSeq(fSeq).ext(ext).build();
            adminDAO.addFile(fdto);
            File newFile = new File(path, fdto.getSeq() + ext);
            file.transferTo(newFile);

        }
        return true;
    }

    public boolean csCenterUpload(List<MultipartFile> files, int qSeq) throws IOException {
        for (MultipartFile file : files) {
            String originalFileName = file.getOriginalFilename();
            String ext = originalFileName.substring(originalFileName.lastIndexOf("."));
            QuestionImageDTO qdto = QuestionImageDTO.builder().qSeq(qSeq).ext(ext).build();
            csCenterDAO.addFile(qdto);
            File newFile = new File(path, qdto.getSeq() + ext);
            file.transferTo(newFile);

        }
        return true;
    }
}
