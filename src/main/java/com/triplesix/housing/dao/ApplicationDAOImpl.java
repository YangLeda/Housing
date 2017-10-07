package com.triplesix.housing.dao;


import com.triplesix.housing.entity.Application;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Repository
public class ApplicationDAOImpl implements ApplicationDAO {


    @Autowired
    private SessionFactory sessionFactory;

    @Override
    @Transactional
    public void addApplication(String phone, String email, String message, Date time, Integer houseid, Integer studentid, Integer landlordid) {
        Application application = new Application(phone, email, message, time, houseid, studentid, landlordid);
        Session currentSession = sessionFactory.getCurrentSession();
        currentSession.persist(application);
    }

    @Override
    @Transactional
    public List<Application> getApplicationsByStudentId(Integer studentid) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Application> q = currentSession.createQuery("Select a from Application a where a.studentid=:id", Application.class);
        q.setParameter("id", studentid);
        List<Application> applications = q.getResultList();
        return applications;
    }

    @Override
    @Transactional
    public List<Application> getApplicationsByLandlordId(Integer landlordid) {
        Session currentSession = sessionFactory.getCurrentSession();
        Query<Application> q = currentSession.createQuery("Select a from Application a where a.landlordid=:id", Application.class);
        q.setParameter("id", landlordid);
        List<Application> applications = q.getResultList();
        return applications;
    }

}
