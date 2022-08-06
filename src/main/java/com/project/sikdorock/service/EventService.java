package com.project.sikdorock.service;

import com.project.sikdorock.dto.EventDTO;
import com.project.sikdorock.dto.EventUserDTO;
import com.project.sikdorock.repository.EventDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
        if (rnd.nextInt(9) <  2) {
            result = 1;
        } else {
            result = 0;
        }



        return result;
    }

    public void getcoupon(EventUserDTO dto) {

       dao.getcoupon(dto);
    }

    public int eventattend(EventUserDTO dto) {

        return dao.eventattend(dto);
    }

    public int checkattend(EventUserDTO dto) {

        return dao.checkattend(dto);
    }

    public String getdate() {

        String nowDate = "";

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        Date now = new Date();

        nowDate = sdf.format(now);


        return nowDate;
    }

    public int checkdate(EventDTO dto) {


        int checkdate = 0;

        String nowDate = dto.getNowdate();
        String enddate = dto.getEnddate();

        try {
            Date now = new SimpleDateFormat("yyyy-MM-dd").parse(nowDate);
            Date end = new SimpleDateFormat("yyyy-MM-dd").parse(enddate);

            long calSec = now.getTime() - end.getTime();
            checkdate = (int)(calSec / (24*60*60*1000));


        } catch (ParseException e) {
            System.out.println("checkdate");
            e.printStackTrace();
        }



        return checkdate;
    }
}