package kr.ac.kopo.ctc.kopo25.resort.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class ReservationDTO {
    private Date resv_date;
    private int room;
    private String addr;
    private String comment;
    private String in_name;
    private String name;
    private int processing;
    private String telnum;    
    private Date write_date;    
}