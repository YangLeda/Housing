package com.triplesix.housing.entity;

import javax.persistence.*;

@Entity
@Table(name = "img")
public class Img {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;

    @Column(name = "path")
    private String path;

    @Column(name = "houseid")
    private Integer houseid;

    public Img() {
    }

    public Img(String path, Integer houseid) {
        this.path = path;
        this.houseid = houseid;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path;
    }

    public Integer getHouseid() {
        return houseid;
    }

    public void setHouseid(Integer houseid) {
        this.houseid = houseid;
    }

    @Override
    public String toString() {
        return "Img{" +
                "id=" + id +
                ", path='" + path + '\'' +
                ", houseid='" + houseid + '\'' +
                '}';
    }
}
