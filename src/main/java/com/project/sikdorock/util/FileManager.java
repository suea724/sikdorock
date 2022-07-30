package com.project.sikdorock.util;

import com.project.sikdorock.dto.FoodImageDTO;
import com.project.sikdorock.repository.AdminDAO;
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

    @Autowired
    public FileManager(ServletContext context, AdminDAO adminDAO) {
        path = context.getRealPath("/resources/files/");
        this.adminDAO = adminDAO;
    }

    public boolean upload(List<MultipartFile> files, int fSeq) throws IOException {
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
}
