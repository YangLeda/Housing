package com.triplesix.housing.dao;

import com.triplesix.housing.entity.Application;
import com.triplesix.housing.entity.ApplicationShow;
import com.triplesix.housing.entity.House;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
public class ApplicationShowDAOImpl implements ApplicationShowDAO {

    @Autowired
    private HouseDAO houseDAO;

    @Override
    @Transactional
    public List<ApplicationShow> getApplicationShowsList(List<Application> applications) {

        List<ApplicationShow> applicationShows = new ArrayList<>();

        for (Application application : applications) {
            ApplicationShow a = new ApplicationShow();
            House h = houseDAO.getHouseById(application.getHouseid());

            a.setAddress(h.getAddress());
            a.setBathrooms(h.getBathrooms());
            a.setBedrooms(h.getBedrooms());
            a.setCarparks(h.getCarparks());
            a.setDescription(h.getDescription());
            a.setPrice(h.getPrice());
            a.setMessage(application.getMessage());
            a.setTime(application.getTime());
            a.setStatus(application.getStatus());

            applicationShows.add(a);
        }

        return applicationShows;
    }
}
