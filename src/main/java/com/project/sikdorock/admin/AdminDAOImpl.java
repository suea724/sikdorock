package com.project.sikdorock.admin;

import lombok.RequiredArgsConstructor;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
@RequiredArgsConstructor
public class AdminDAOImpl implements AdminDAO {

    private final SqlSessionTemplate template;

}
