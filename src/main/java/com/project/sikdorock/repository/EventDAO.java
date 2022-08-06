package com.project.sikdorock.repository;

import com.project.sikdorock.dto.EventDTO;
import com.project.sikdorock.dto.EventUserDTO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface EventDAO {

    //DAO의 메소드명을 xml의 id와 일치시키기 **

    List<EventDTO> eventlist();


    EventDTO get(String seq);

    void getcoupon(EventUserDTO dto);

    int eventattend(EventUserDTO dto);

    int checkattend(EventUserDTO dto);

}