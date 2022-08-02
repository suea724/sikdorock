package com.project.sikdorock.service;

import com.project.sikdorock.repository.OrderNumDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class OrderNumService {

    private final OrderNumDAO dao;

    public int getSubSeq() {
        return dao.getSubSeq();
    }

    public int getOrderSeq() {
        return dao.getOrderSeq();
    }
}
