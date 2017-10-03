package com.triplesix.housing.entity;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "application")
public class Application {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "phone")
    private String phone;

    @Column(name = "email")
    private String email;

    @Column(name = "message")
    private String message;

    @Column(name = "time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date time;

    @Column(name = "houseid")
    private Integer houseid;

    @Column(name = "studentid")
    private Integer studentid;

    @Column(name = "landlordid")
    private Integer landlordid;


    public Application() {
    }

    public Application(String phone, String email, String message, Date time, Integer houseid, Integer studentid, Integer landlordid) {
        this.phone = phone;
        this.email = email;
        this.message = message;
        this.time = time;
        this.houseid = houseid;
        this.studentid = studentid;
        this.landlordid = landlordid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getHouseid() {
        return houseid;
    }

    public void setHouseid(Integer houseid) {
        this.houseid = houseid;
    }

    public Integer getStudentid() {
        return studentid;
    }

    public void setStudentid(Integer studentid) {
        this.studentid = studentid;
    }

    public Integer getLandlordid() {
        return landlordid;
    }

    public void setLandlordid(Integer landlordid) {
        this.landlordid = landlordid;
    }

    @Override
    public String toString() {
        return "Application{" +
                "id=" + id +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", message='" + message + '\'' +
                ", time=" + time +
                ", houseid=" + houseid +
                ", studentid=" + studentid +
                ", landlordid=" + landlordid +
                '}';
    }
}
