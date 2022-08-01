package com.project.sikdorock.dto;

import lombok.Data;

@Data
public class EventDTO {
    private String seq;
    private String name;
    private String eventinfo;
    private String startdate;
    private String enddate;
    private int cseq;
    private String state;
}
