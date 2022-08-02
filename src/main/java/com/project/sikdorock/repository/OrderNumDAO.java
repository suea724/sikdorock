package com.project.sikdorock.repository;

import org.springframework.stereotype.Repository;

@Repository
public interface OrderNumDAO {

    int getOrderSeq();

    int getSubSeq();
}
