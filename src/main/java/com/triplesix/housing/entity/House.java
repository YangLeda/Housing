package com.triplesix.housing.entity;

import javax.persistence.*;
import java.util.Arrays;

@Entity
@Table(name = "house")
public class House {

    @Id
    @GeneratedValue
    @Column(name = "id")
    private Integer id;

    @Column(name = "address")
    private String address;

    @Column(name = "description")
    private String description;

    @Column(name = "price")
    private Integer price;

    @Column(name = "bedrooms")
    private Integer bedrooms;

    @Column(name = "bathrooms")
    private Integer bathrooms;

    @Column(name = "carparks")
    private Integer carparks;

    @Lob
    @Column(name = "pic", columnDefinition = "mediumblob")
    private byte[] pic;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getBedrooms() {
        return bedrooms;
    }

    public void setBedrooms(Integer bedrooms) {
        this.bedrooms = bedrooms;
    }

    public Integer getBathrooms() {
        return bathrooms;
    }

    public void setBathrooms(Integer bathrooms) {
        this.bathrooms = bathrooms;
    }

    public Integer getCarparks() {
        return carparks;
    }

    public void setCarparks(Integer carparks) {
        this.carparks = carparks;
    }

    public byte[] getPic() {
        return pic;
    }

    public void setPic(byte[] pic) {
        this.pic = pic;
    }

    @Override
    public String toString() {
        return "House{" +
                "id=" + id +
                ", address='" + address + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", bedrooms=" + bedrooms +
                ", bathrooms=" + bathrooms +
                ", carparks=" + carparks +
                ", pic=" + Arrays.toString(pic).length() +
                "}";
    }
}
