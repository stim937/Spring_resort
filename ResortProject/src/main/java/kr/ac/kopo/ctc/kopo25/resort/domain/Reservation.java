package kr.ac.kopo.ctc.kopo25.resort.domain;

import java.sql.Date;

import jakarta.persistence.Column;
import jakarta.persistence.EmbeddedId;
import jakarta.persistence.Entity;

@Entity
public class Reservation {

    @EmbeddedId
    private ReservationId id;

    @Column(nullable = false, length = 20) // 성명, 필수값, 최대 길이 20
    private String name;

    @Column(length = 100) // 주소, 최대 길이 100
    private String addr;

    @Column(length = 20) // 연락처, 최대 길이 20
    private String telnum;

    @Column(length = 20) // 입금자명, 최대 길이 20
    private String in_name;

    @Column(columnDefinition = "TEXT") // 남기실말, TEXT 데이터 타입
    private String comment;

    @Column // 예약한(이 글을 쓴) 날짜
    private Date write_date;

    @Column(nullable = false) // 현재 진행, 필수값
    private int processing;

    public ReservationId getId() {
        return id;
    }

    public void setId(ReservationId id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddr() {
        return addr;
    }

    public void setAddr(String addr) {
        this.addr = addr;
    }

    public String getTelnum() {
        return telnum;
    }

    public void setTelnum(String telnum) {
        this.telnum = telnum;
    }

    public String getIn_name() {
        return in_name;
    }

    public void setIn_name(String in_name) {
        this.in_name = in_name;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Date getWrite_date() {
        return write_date;
    }

    public void setWrite_date(Date write_date) {
        this.write_date = write_date;
    }

    public int getProcessing() {
        return processing;
    }

    public void setProcessing(int processing) {
        this.processing = processing;
    }
}

