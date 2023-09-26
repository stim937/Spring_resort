package kr.ac.kopo.ctc.kopo25.resort.dto;

import java.sql.Date;

import jakarta.validation.constraints.Pattern;

public class ReservationDTO {
    private Date resv_date;
    private int room;
    private String addr;
    private String comment;
    private String in_name;
    private String name;
    private int processing;
    
    @Pattern(regexp = "\\d{11}", message = "전화번호는 11자리 숫자여야 합니다.")	
    private String telnum;
    private Date write_date;
    
	public Date getResv_date() {
		return resv_date;
	}
	public void setResv_date(Date resv_date) {
		this.resv_date = resv_date;
	}
	public int getRoom() {
		return room;
	}
	public void setRoom(int room) {
		this.room = room;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getIn_name() {
		return in_name;
	}
	public void setIn_name(String in_name) {
		this.in_name = in_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getProcessing() {
		return processing;
	}
	public void setProcessing(int processing) {
		this.processing = processing;
	}
	public String getTelnum() {
		return telnum;
	}
	public void setTelnum(String telnum) {
		this.telnum = telnum;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}

    // Getter와 Setter 메서드를 생성하세요.
    
    // 필요한 생성자를 만들 수도 있습니다.
}
