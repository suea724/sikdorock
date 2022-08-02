package com.project.sikdorock.service;

import com.project.sikdorock.dto.EventDTO;
import com.project.sikdorock.repository.EventDAO;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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
}