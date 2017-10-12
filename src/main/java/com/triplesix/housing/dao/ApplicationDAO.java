package com.triplesix.housing.dao;

import com.triplesix.housing.entity.Application;

import java.util.Date;
import java.util.List;

public interface ApplicationDAO {
    void addApplication(String name, String phone, String email, String message, Date time, Integer houseid, Integer studentid, Integer landlordid);

    List<Application> getApplicationsByStudentId(Integer studentid);

    List<Application> getAllApplications();

    List<Application> getApplicationsByLandlordId(Integer landlordid);

    void deleteApplicationById(Integer id);

    void setStatusById(Integer applicationId, String status);

    String getEmailById(Integer id);

}
