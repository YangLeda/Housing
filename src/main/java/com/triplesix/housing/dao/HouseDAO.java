package com.triplesix.housing.dao;

import com.triplesix.housing.entity.House;

import java.util.List;

public interface HouseDAO {
    List<House> getHouses();

    List<House> searchHouses(Integer minBedrooms, Integer minBathrooms, Integer minCarparks,
                             Integer minPrice, Integer maxPrice);

    List<House> getLandlordHouses(Integer id);

    House getHouseById(Integer id);

    Integer addHouse(String address, String description, Integer price, Integer bedrooms, Integer bathrooms, Integer carparks, String pic, Integer landlordid);

    void deleteHouseById(Integer id);
}
