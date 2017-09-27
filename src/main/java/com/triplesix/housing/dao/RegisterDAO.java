package com.triplesix.housing.dao;

public interface RegisterDAO {
    void register(String email, String password, String gender, String fullname);
}
