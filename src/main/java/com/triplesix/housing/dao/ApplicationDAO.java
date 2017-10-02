package com.triplesix.housing.dao;

import java.util.Date;

public interface ApplicationDAO {
    void addApplication(String phone, String email, String message, Date time, Integer houseid, Integer studentid);
}
