package com.triplesix.housing.dao;

import com.triplesix.housing.entity.Application;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Repository
public class ApplicationDAOImpl implements ApplicationDAO {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public void addApplication(String phone, String email, String message, Date time, Integer houseid, Integer studentid) {
        Application application = new Application(phone, email, message, time, houseid, studentid);
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.persist(application);
    }
}
