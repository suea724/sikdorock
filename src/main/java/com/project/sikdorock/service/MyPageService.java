package com.project.sikdorock.service;

import com.project.sikdorock.repository.MyPageDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class MyPageService {
    private final MyPageDAO dao;
}
