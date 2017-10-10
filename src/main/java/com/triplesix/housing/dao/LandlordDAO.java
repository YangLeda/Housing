package com.triplesix.housing.dao;

public interface LandlordDAO {
    String getLandlordEmailById(Integer id);
    void deleteApplicationById(Integer id);
}
