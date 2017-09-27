package com.triplesix.housing.dao;

import com.triplesix.housing.entity.House;

import java.util.List;

public interface HouseDAO {
    List<House> getHouses();

    List<House> getLandlordHouses(Integer id);
}
