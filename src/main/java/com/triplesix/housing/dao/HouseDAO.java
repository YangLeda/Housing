package com.triplesix.housing.dao;

import com.triplesix.housing.entity.House;

import java.util.List;

public interface HouseDAO {
    List<House> getHouses();

    List<House> searchHouses();

    List<House> getLandlordHouses(Integer id);

    House getHouseById(Integer id);

    void addHouse(String address, String description, Integer price, Integer bedrooms, Integer bathrooms, Integer carparks, String pic, Integer landlordid);
}
