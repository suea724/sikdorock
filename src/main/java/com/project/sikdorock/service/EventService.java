package com.project.sikdorock.service;

import com.project.sikdorock.dto.EventDTO;
import com.project.sikdorock.repository.EventDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Random;

@Service
@RequiredArgsConstructor
public class EventService {

    private final EventDAO dao;

    public List<EventDTO> eventlist() {

        return dao.eventlist();
    }

    public EventDTO get(String seq) {

        return dao.get(seq);
    }



    public int eventcheck() {

        Random rnd = new Random();

        int result = 0;

        //0~9까지의 숫자중 랜덤으로 나온 숫자가 0이나 1이면 쿠폰 당첨 (20%의 확률)
        if (rnd.nextInt(9) <  10) {
            result = 1;
        } else {
            result = 0;
        }



        return result;
    }

    public void getcoupon(String id, String cseq) {

       dao.getcoupon(id, cseq);
    }
}